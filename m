From: Jeroen Roovers <jer@airfi.aero>
Date: Thu, 10 Nov 2016 10:54:56 +0100
Subject: [Buildroot] [PATCH] sunxi-tools: bump to version 1.4.1
In-Reply-To: <1478770830-9962-1-git-send-email-francois.perrad@gadz.org>
References: <1478770830-9962-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CANCHnQquoyVokw+CR_1vEAAJeSFgRTyi-3XOQkV_RTHonR9Rnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With host gcc 5.4.0 the "-std=c99" is a problem:

fel.c: In function 'get_image_type':
fel.c:164:6: warning: implicit declaration of function 'be32toh'
[-Wimplicit-function-declaration]
  if (be32toh(buf32[0]) != IH_MAGIC) /* signature mismatch */

Are those still needed? And -D_POSIX_C_SOURCE=200112L ?

On 10 November 2016 at 10:40, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/sunxi-tools/sunxi-tools.hash | 2 +-
>  package/sunxi-tools/sunxi-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
> index 90991a3..aba3fe6 100644
> --- a/package/sunxi-tools/sunxi-tools.hash
> +++ b/package/sunxi-tools/sunxi-tools.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 8b5defeaabec99b6c759ed1d99d91e4d23188431868d17cf6ed144f37e42bee5  sunxi-tools-89dac0f7eaaedd0d8afa9d5a3c713c7c1ccb9cf6.tar.gz
> +sha256 da5d762608517b4b2e9bd392bd9a63afae3973d9c8264cbcfb757ddac8120d1b  sunxi-tools-1.4.1.tar.gz
> diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
> index 23e3135..c554a5f 100644
> --- a/package/sunxi-tools/sunxi-tools.mk
> +++ b/package/sunxi-tools/sunxi-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -SUNXI_TOOLS_VERSION = 89dac0f7eaaedd0d8afa9d5a3c713c7c1ccb9cf6
> +SUNXI_TOOLS_VERSION = v1.4.1
>  SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
>  SUNXI_TOOLS_LICENSE = GPLv2+
>  SUNXI_TOOLS_LICENSE_FILES = COPYING
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
