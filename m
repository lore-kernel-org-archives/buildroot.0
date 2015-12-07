From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 7 Dec 2015 13:33:54 +0100 (CET)
Subject: [Buildroot] libeet and removed gnutls functions
In-Reply-To: <566579EF.6050906@imgtec.com>
References: <20151207073022.BE3B6101727@stock.ovh.net>
 <566579EF.6050906@imgtec.com>
Message-ID: <235549288.4898236.1449491634762.JavaMail.zimbra@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

----- Mail original -----
> De: "Vicente Olivert Riera" <Vincent.Riera@imgtec.com>
> ?: "Romain Naour" <romain.naour@openwide.fr>
> Cc: "buildroot" <buildroot@buildroot.org>
> Envoy?: Lundi 7 D?cembre 2015 13:22:07
> Objet: libeet and removed gnutls functions

> Dear Romain, all,
> 
> On 07/12/15 07:30, Thomas Petazzoni wrote:
> 
>>      sparc64 |                  libeet-1.7.10 | NOK |
>>      http://autobuild.buildroot.net/results/826a8f36631daa35ebd49850e12304e784ff9be8/
>>          arm |                  libeet-1.7.10 | NOK |
>>          http://autobuild.buildroot.net/results/7d5f483cdce508d27678acf5ac387b57fffae9bd/
>>         i686 |                  libeet-1.7.10 | NOK |
>>         http://autobuild.buildroot.net/results/e47b75bf07892126eb1fa21268edd24077f140c7/
>>         i686 |                  libeet-1.7.10 | NOK |
>>         http://autobuild.buildroot.net/results/1025f598e3995ce2157fd028345796e00ac36da6/
>>         mips |                  libeet-1.7.10 | NOK |
>>         http://autobuild.buildroot.net/results/a5f9100346aca894188126b499ba2ac84579c8d3/
>>          arm |                  libeet-1.7.10 | NOK |
>>          http://autobuild.buildroot.net/results/1a90ae4963a73ce1f12b743272e61697dee25454/
>>       xtensa |                  libeet-1.7.10 | NOK |
>>       http://autobuild.buildroot.net/results/bb4a2715923f9d098607b2de76f208ea6c9f2c42/
>>      aarch64 |                  libeet-1.7.10 | NOK |
>>      http://autobuild.buildroot.net/results/5836d5758ff8c8421973b325fdd80ab70f04699e/
>>         mips |                  libeet-1.7.10 | NOK |
>>         http://autobuild.buildroot.net/results/5d7202143f0ca453a251ac147421b9d284ed942e/
>>          arm |                  libeet-1.7.10 | NOK |
>>          http://autobuild.buildroot.net/results/746be354f6372df33dae9e2cc969e2a497fe9a3b/
>>          arc |                  libeet-1.7.10 | NOK |
>>          http://autobuild.buildroot.net/results/46896031bcf3195716ee2224679400eff37c4151/
> 
> According to gnutls upstream:
> 
> ------------------
> "GnuTLS 3.4.x is source compatible with GnuTLS 3.3.x releases; however,
> several deprecated functions were removed, and are listed below."
> 
> Old function	Replacement
> [...]
> gnutls_x509_crt_verify_data	gnutls_pubkey_verify_data2
> ------------------
> 
> So, gnutls_x509_crt_verify_data no longer exists because has been
> replaced by gnutls_pubkey_verify_data2.
> 
> libeet uses the former one:
> 
> src/lib/eet_cipher.c:   if (!gnutls_x509_crt_verify_data(cert, 0,
> &datum, &signature))
> 
> And it fails with an error like this one:
> 
> ../../src/lib/.libs/libeet.so: undefined reference to
> `gnutls_x509_crt_verify_data'
> 
> You are more in touch with the enlightenment packages, so, how do you
> suggest to fix this?

No since the libeet package will be removed with the efl bump series.
But...

> Do you think we could disable the gnutls support in
> libeet until upstream adds support for the 3.4.x branch?

I'll take a look to the gnutls support with efl 1.15.2 which provide
an updated version of libeet.

Best regards,
Romain

> 
> Regards,
> 
> Vincent.
