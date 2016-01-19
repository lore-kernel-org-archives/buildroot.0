From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 19 Jan 2016 22:47:12 +0100
Subject: [Buildroot] [PATCH v3 3/5] package/gutenprint: Un-deprecate and
 bump version to 5.2.10
In-Reply-To: <1442492616-12626-4-git-send-email-olivier.schonken@gmail.com>
References: <1442492616-12626-1-git-send-email-olivier.schonken@gmail.com>
 <1442492616-12626-4-git-send-email-olivier.schonken@gmail.com>
Message-ID: <CAHXCMM+a4sOMHtb9d0M1zNOOfuv6thqf0dPCXh706MJpCbMpwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Olivier,

On Thu, Sep 17, 2015 at 2:23 PM, Olivier Schonken
<olivier.schonken@gmail.com> wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/gutenprint/Config.in       | 1 -
>  package/gutenprint/gutenprint.hash | 2 +-
>  package/gutenprint/gutenprint.mk   | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
> index 686dbce..2826594 100644
> --- a/package/gutenprint/Config.in
> +++ b/package/gutenprint/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_GUTENPRINT
>         bool "gutenprint"
>         # because of cups security issues
This comment is no longer appropriate, right? If so, remove it, please.

> -       depends on BR2_DEPRECATED_SINCE_2015_05
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_PACKAGE_CUPS
>         select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> diff --git a/package/gutenprint/gutenprint.hash b/package/gutenprint/gutenprint.hash
> index 3cfe0e1..36c12cc 100644
> --- a/package/gutenprint/gutenprint.hash
> +++ b/package/gutenprint/gutenprint.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  4b27e4f06f32d30271df89ecb6089bb11bcf2caec5f60b0909e083095354bca0  gutenprint-5.2.9.tar.bz2
> +sha256  431f352b412dfb9809d126a85a37a1fcd1c1826275ace8cdcd4fd9a6ee360e59  gutenprint-5.2.10.tar.bz2
> diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
> index 3ff05b6..0bdc3bc 100644
> --- a/package/gutenprint/gutenprint.mk
> +++ b/package/gutenprint/gutenprint.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  GUTENPRINT_VERSION_MAJOR = 5.2
> -GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).9
> +GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).10
>  GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-$(GUTENPRINT_VERSION_MAJOR)/$(GUTENPRINT_VERSION)
>  GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
>  GUTENPRINT_LICENSE = GPLv2+
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
