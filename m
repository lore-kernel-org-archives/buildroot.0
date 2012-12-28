From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Dec 2012 21:52:05 +0100
Subject: [Buildroot] [PATCH 1/7] gnutls: bump to version 3.1.5
In-Reply-To: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 28 Dec 2012 16:47:17 -0300")
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87boddzyq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/gnutls/Config.in                           |    9 +++-
 Gustavo>  ...001-gets-no-longer-exists-in-e-glibc-2.16.patch |   56 --------------------
 Gustavo>  package/gnutls/gnutls.mk                           |   26 +++++++---
 Gustavo>  3 files changed, 27 insertions(+), 64 deletions(-)
 Gustavo>  delete mode 100644 package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch

 Gustavo> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
 Gustavo> index cedf120..2bd5ab6 100644
 Gustavo> --- a/package/gnutls/Config.in
 Gustavo> +++ b/package/gnutls/Config.in
 Gustavo> @@ -1,8 +1,15 @@
 Gustavo>  config BR2_PACKAGE_GNUTLS
 Gustavo>  	bool "gnutls"
 Gustavo> -	select BR2_PACKAGE_LIBGCRYPT
 Gustavo> +	select BR2_PACKAGE_NETTLE
 Gustavo>  	help
 Gustavo>  	  GnuTLS is a secure communications library implementing the SSL
 Gustavo>  	  and TLS protocols and technologies around them.
 
 Gustavo>  	  http://www.gnu.org/software/gnutls/gnutls.html
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_GNUTLS_TOOLS
 Gustavo> +	bool "install tools"
 Gustavo> +	depends on BR2_PACKAGE_GNUTLS
 Gustavo> +	depends on BR2_USE_WCHAR
 Gustavo> +	help
 Gustavo> +	  Install GnuTLS command line tools for various cryptographic tasks.

I've added a comment line about tools not available with a !WCHAR
toolchain and committed, thanks.

-- 
Bye, Peter Korsgaard
