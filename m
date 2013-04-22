From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 20:36:03 +0200
Subject: [Buildroot] [PATCH 3/7] arc: Add support for ARC-specific
	binutils
In-Reply-To: <1366630651-6857-4-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-4-git-send-email-mjonker@synopsys.com>
Message-ID: <51758313.8040605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 13:37, Mischa Jonker wrote:
[snip]
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 92e0a74..d387c27 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -26,6 +26,9 @@ BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
>   ifeq ($(ARCH),avr32)
>   BINUTILS_SITE =ftp://www.at91.com/pub/buildroot
>   endif
> +ifeq ($(ARCH),arc)

  What about arceb?


  Regards,
  Arnout
> +BINUTILS_SITE = $(BR2_ARC_SITE)
> +endif
>   BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
>   BINUTILS_INSTALL_STAGING = YES
>   BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
