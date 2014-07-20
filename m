From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:43:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] xapp_xfs: Fix compile errors after
 libXfont 1.5.0 update
In-Reply-To: <1405842733-27018-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405842733-27018-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140720114323.59448cd1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 20 Jul 2014 09:52:13 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/385/385cffbab4261337afa449998aa7457a8142db92/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Cleanup patch (Yann)
> 
>  package/x11r7/xapp_xfs/xapp_xfs.mk |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
> index 0907fc3..6322662 100644
> --- a/package/x11r7/xapp_xfs/xapp_xfs.mk
> +++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -XAPP_XFS_VERSION = 1.1.3
> -XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
> -XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
> +XAPP_XFS_VERSION = 1c8459eafc04997751ae3d200d0ec91e43e19b5b
> +XAPP_XFS_SITE = git://anongit.freedesktop.org/xorg/app/xfs
>  XAPP_XFS_LICENSE = MIT
>  XAPP_XFS_LICENSE_FILES = COPYING
> -XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
> +XAPP_XFS_AUTORECONF = YES
> +XAPP_XFS_DEPENDENCIES = xfont_font-util xlib_libFS xlib_libXfont xproto_fontsproto
>  
>  $(eval $(autotools-package))

Applied, thanks. Since my understanding is that the new dependency
xfont_font-util was only needed because of the autoreconf, I added a
comment to indicate that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
