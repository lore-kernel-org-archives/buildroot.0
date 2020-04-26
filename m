From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 11:55:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: needs
 host-pkgconf
In-Reply-To: <20200425224719.1548095-1-fontaine.fabrice@gmail.com>
References: <20200425224719.1548095-1-fontaine.fabrice@gmail.com>
Message-ID: <20200426095557.GY5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-26 00:47 +0200, Fabrice Fontaine spake thusly:
> pkg-config is used unconditionally in configure.ac to find dependencies
> (openssl, gnutls and nss)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c01ae4f1a7babf94c841d4bb737408a9c8869845
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkcs11-helper/pkcs11-helper.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
> index 24e0c65d84..a95340daf7 100644
> --- a/package/pkcs11-helper/pkcs11-helper.mk
> +++ b/package/pkcs11-helper/pkcs11-helper.mk
> @@ -8,6 +8,7 @@ PKCS11_HELPER_VERSION = 1.26
>  PKCS11_HELPER_SITE = $(call github,OpenSC,pkcs11-helper,pkcs11-helper-$(PKCS11_HELPER_VERSION))
>  PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
>  PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
> +PKCS11_HELPER_DEPENDENCIES = host-pkgconf
>  PKCS11_HELPER_AUTORECONF = YES
>  PKCS11_HELPER_INSTALL_STAGING = YES
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
