From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 May 2013 12:20:26 +0300
Subject: [Buildroot] [PATCH] pixman: Apply upstream patch to fix
 compilation on MIPS
In-Reply-To: <1369040459-17604-1-git-send-email-markos.chandras@gmail.com>
References: <1369040459-17604-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130520092025.GF7188@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Markos,

On Mon, May 20, 2013 at 10:00:59AM +0100, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> Fixes:
> http://autobuild.buildroot.net/results/38aa4f2a2269b80226b910c46e0c9abe7dc38ff8/
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  package/pixman/pixman-0.30.0-loongson-cflags.patch | 38 ++++++++++++++++++++++

We now usually omit version numbers from bundled patches file names.

>  package/pixman/pixman.mk                           |  3 +-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 package/pixman/pixman-0.30.0-loongson-cflags.patch

[snip]

> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index c2ee035..7822ede 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -3,11 +3,12 @@
>  # pixman
>  #
>  ################################################################################
> -PIXMAN_VERSION = 0.28.2
> +PIXMAN_VERSION = 0.30.0

This is a version bump. The commit log should change accordingly.

>  PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
>  PIXMAN_LICENSE = MIT
>  PIXMAN_LICENSE_FILES = COPYING
>  
> +PIXMAN_AUTORECONF = YES

Please add a comment explaining why this is needed.

>  PIXMAN_INSTALL_STAGING = YES
>  PIXMAN_DEPENDENCIES = host-pkgconf
>  # don't build gtk based demos

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
