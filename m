From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Dec 2011 07:54:40 +0100
Subject: [Buildroot] [PATCH v2 1/4] Allow user to pick uClibc version
	when using ct-ng
In-Reply-To: <1323173840-8837-2-git-send-email-will_wagner@carallon.com>
References: <1323173840-8837-1-git-send-email-will_wagner@carallon.com>
 <1323173840-8837-2-git-send-email-will_wagner@carallon.com>
Message-ID: <201112140754.40229.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 06 December 2011 13:17:17 Will Wagner wrote:
> +# Set version
> +ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32)),y)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V_)(.+)=y$$:\# \1\2 is not set\n\10_9_32=y:;
> +else ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30)),y)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V_)(.+)=y$$:\# \1\2 is not set\n\10_9_30_3=y:;
> +endif
> +
>  # Handle the locales option
>  ifneq ($(call qstrip,$(BR2_ENABLE_LOCALE)),)
>  CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;

 I realize that it isn't used for the existing fixes, but is it possible to
use the KCONFIG_ENABLE_OPT/KCONFIG_DISABLE_OPT function from Makefile.package.in?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
