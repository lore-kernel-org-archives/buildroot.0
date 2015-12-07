From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 12:32:57 +0000
Subject: [Buildroot] libeet and removed gnutls functions
In-Reply-To: <56657B17.4060008@zacarias.com.ar>
References: <20151207073022.BE3B6101727@stock.ovh.net>
 <566579EF.6050906@imgtec.com> <56657B17.4060008@zacarias.com.ar>
Message-ID: <56657C79.90501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/15 12:27, Gustavo Zacarias wrote:
> On 07/12/15 09:22, Vicente Olivert Riera wrote:
> 
>> According to gnutls upstream:
>>
>> ------------------
>> "GnuTLS 3.4.x is source compatible with GnuTLS 3.3.x releases; however,
>> several deprecated functions were removed, and are listed below."
>>
>> Old function    Replacement
>> [...]
>> gnutls_x509_crt_verify_data    gnutls_pubkey_verify_data2
>> ------------------
>>
>> So, gnutls_x509_crt_verify_data no longer exists because has been
>> replaced by gnutls_pubkey_verify_data2.
>>
>> libeet uses the former one:
>>
>> src/lib/eet_cipher.c:   if (!gnutls_x509_crt_verify_data(cert, 0,
>> &datum, &signature))
>>
>> And it fails with an error like this one:
>>
>> ../../src/lib/.libs/libeet.so: undefined reference to
>> `gnutls_x509_crt_verify_data'
>>
>> You are more in touch with the enlightenment packages, so, how do you
>> suggest to fix this? Do you think we could disable the gnutls support in
>> libeet until upstream adds support for the 3.4.x branch?
> 
> Hi Vincent.
> Likely http://patchwork.ozlabs.org/patch/538802/ (series) handles that.
> Regards.

Perfect. Thanks!

Regards,

Vincent.
