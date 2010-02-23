From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Tue, 23 Feb 2010 23:43:24 +0200
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
 autotools infrastructure
In-Reply-To: <20100223202924.D6947776A1@busybox.osuosl.org>
References: <20100223202924.D6947776A1@busybox.osuosl.org>
Message-ID: <4B844BFC.6030906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/2010 10:27 PM, Thomas Petazzoni wrote:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=abc1479ea795a18a743ea513e33179058bdfe6b6
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/x11r7/xfont_font-util/xfont_font-util.mk |   74 ++--------------------
>   1 files changed, 6 insertions(+), 68 deletions(-)
>
> diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
> index 38e7e80..88dce38 100644
> --- a/package/x11r7/xfont_font-util/xfont_font-util.mk
> +++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
> @@ -5,76 +5,14 @@
>   ################################################################################
>
>   XFONT_FONT_UTIL_VERSION = 1.0.1
> -XFONT_FONT_UTIL_NAME = font-util-$(XFONT_FONT_UTIL_VERSION)
>   XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
>   XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
> -XFONT_FONT_UTIL_AUTORECONF = NO
> -XFONT_FONT_UTIL_DIR=$(BUILD_DIR)/$(XFONT_FONT_UTIL_NAME)
> -XFONT_FONT_UTIL_CAT:=$(BZCAT)
> +XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config

[...]

> -$(XFONT_FONT_UTIL_DIR)/.installed: $(XFONT_FONT_UTIL_DIR)/.compiled
> -	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(XFONT_FONT_UTIL_DIR) install
> -	touch $@
> -

Shouldn't font-utils be installed to STAGING instead of TARGET?
Originally it was installed to STAGING.
I would suggest adding:

XFONT_FONT_UTIL_INSTALL_STAGING = YES
XFONT_FONT_UTIL_INSTALL_TARGET = NO

BR,
Paulius Zaleckas
