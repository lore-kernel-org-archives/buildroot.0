From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 1 Nov 2019 05:03:45 -0400
Subject: [Buildroot] [PATCH] package/systemd: bump to v243-78
In-Reply-To: <20191101085746.18330-1-jeremy.rosen@smile.fr>
References: <20191101085746.18330-1-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4qxOy0cmYgz5m5C8gHmi-R3MNa1f5L_fbKdesEy6AySiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 1, 2019 at 4:58 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> The systemd project maintains a separate repository on github where patches
> are backported on top of released version by the systemd maintainers.
>
> This patch changes the SYSTEMD_SITE to point on that repository and points
> to the latest version of v243, which was the previous version used by
> systemd.
>
> Unfortunately, upstream does not tag any version,so we use 'git describe'
> as a SYSTEMD_VERSION
>
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
>
> ---
> This was triggered by networkd not setting-up some interfaces in v243. This
> was fixed in v243-stable
> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 2f2c11089c..d984338dc6 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256 0611843c2407f8b125b1b7cb93533bdebd4ccf91c99dffa64ec61556a258c7d1        systemd-243.tar.gz
> +sha256 d9cb11fab907292c61f66ef8ad2d9a68054c0e8856bd47cd2b0a12b2255da771        systemd-v243-78-gef677436aa.tar.gz
>  sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6        LICENSE.GPL2
>  sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551        LICENSE.LGPL2.1
>  sha256 3a3b3cbd0ef03c7045bfda9b61062bdc33ad4913b44a6b6147043f26d00b51bf        README
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index df40961fee..10e375b94d 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -SYSTEMD_VERSION = 243
> -SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
> +SYSTEMD_VERSION = v243-78-gef677436aa
> +SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
>  SYSTEMD_INSTALL_STAGING = YES
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
