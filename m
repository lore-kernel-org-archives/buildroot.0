From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 25 Feb 2013 16:21:44 +0100
Subject: [Buildroot] [PATCH] f2fs-tools: new package
In-Reply-To: <1361804829-5961-1-git-send-email-gustavo@zacarias.com.ar>
References: <1361804829-5961-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAGm1_kuGGo9M6j829D9oYZ3BfJ+jo=sv8DGPBytGidaJPqs-Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Feb 25, 2013 at 4:07 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                |  1 +
>  package/f2fs-tools/Config.in     | 12 ++++++++++++
>  package/f2fs-tools/f2fs-tools.mk | 13 +++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/f2fs-tools/Config.in
>  create mode 100644 package/f2fs-tools/f2fs-tools.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e65396a..f77911f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -191,6 +191,7 @@ source "package/dosfstools/Config.in"
>  source "package/e2fsprogs/Config.in"
>  source "package/exfat/Config.in"
>  source "package/exfat-utils/Config.in"
> +source "package/f2fs-tools/Config.in"
>  source "package/flashbench/Config.in"
>  source "package/genext2fs/Config.in"
>  source "package/genromfs/Config.in"
> diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
> new file mode 100644
> index 0000000..20db928
> --- /dev/null
> +++ b/package/f2fs-tools/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_F2FS_TOOLS
> +       bool "f2fs-tools"
> +       select BR2_PACKAGE_UTIL_LINUX
> +       depends on BR2_LARGEFILE
> +       depends on BR2_USE_WCHAR # util-linux
> +       help
> +         Tools for Flash-Friendly File System (F2FS)
> +
> +         http://sourceforge.net/projects/f2fs-tools/
> +
> +comment "f2fs-tools requires a toolchain with LARGEFILE and WCHAR support"
> +       depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
> diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
> new file mode 100644
> index 0000000..4de4adb
> --- /dev/null
> +++ b/package/f2fs-tools/f2fs-tools.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# f2fs-tools
> +#
> +#############################################################
> +
> +F2FS_TOOLS_VERSION = e3eadd686ed1da1828f32977a36b694bc0090f4e
> +F2FS_TOOLS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
> +F2FS_TOOLS_CONF_ENV = ac_cv_file__git=yes
> +F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
> +F2FS_TOOLS_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> --
> 1.7.12.4

what about adding http or https instead of git protocol like
http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git?
It were useful for people behind a proxy.

Yegor
