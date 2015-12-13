From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:32:50 +0100
Subject: [Buildroot] [PATCH] gnutls: needs argp-standalone for
 musl/uclibc
In-Reply-To: <1449248499-2852-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449248499-2852-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151213223250.77e3dbfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Fri,  4 Dec 2015 14:01:39 -0300, Gustavo Zacarias wrote:

> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index dde23ce..998e213 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -14,6 +14,8 @@ if BR2_PACKAGE_GNUTLS
>  
>  config BR2_PACKAGE_GNUTLS_TOOLS
>  	bool "install tools"
> +	select BR2_PACKAGE_ARGP_STANDALONE \
> +		if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	help
>  	  Install GnuTLS command line tools for various cryptographic tasks.

Seems like BR2_PACKAGE_GNUTLS needs argp.h as well, not only
BR2_PACKAGE_GNUTLS_TOOLS. See
http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5//.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
