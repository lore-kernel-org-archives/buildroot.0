From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 12:44:34 +0200
Subject: [Buildroot] [PATCH] package/cups: fix static linking with GnuTLS
In-Reply-To: <1456675640-22176-1-git-send-email-joerg.krause@embedded.rocks>
References: <1456675640-22176-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160703124434.342effb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Feb 2016 17:07:20 +0100, J?rg Krause wrote:
> cups forgets to link against the libs found by pkg-config if it is build with
> GnuTLS support.
> 
> Otherwise, static build fails with:
> ../cups/libcups.a(tls.o): In function `http_gnutls_create_credential':
> cups-2.1.2/cups/tls-gnutls.c:762: undefined reference to `gnutls_x509_crt_init'
> [..]
> 
> Fixes:
> http://autobuild.buildroot.net/results/205/20509b7d1edc73dc2a7622f2ae7dbf9f6665a918/
> http://autobuild.buildroot.net/results/b86/b86d685caf8cf812f9505fca2de36fb8c18baee1/
> 
> Patch is sent upstream.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../cups/0004-Fix-static-linking-with-GnuTLS.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/cups/0004-Fix-static-linking-with-GnuTLS.patch

In the end, since nobody ever worked on a better solution, I applied
your patch (together with a bump to cups 2.1.4).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
