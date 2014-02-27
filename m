From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 27 Feb 2014 08:24:21 +0000
Subject: [Buildroot] [PATCH] vlc: add a patch to remove autoreconf
	warnings
In-Reply-To: <1393457442-26456-1-git-send-email-arnout@mind.be>
References: <1393457442-26456-1-git-send-email-arnout@mind.be>
Message-ID: <CAHt8ZCPZW_XnW22v5TVSR8jR-m=iMZh8wKArhKSvGEtn2-KhhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 February 2014 23:30, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...c-0003-automake-add-subdir-objects-option.patch | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/vlc/vlc-0003-automake-add-subdir-objects-option.patch
>
> diff --git a/package/vlc/vlc-0003-automake-add-subdir-objects-option.patch b/package/vlc/vlc-0003-automake-add-subdir-objects-option.patch
> new file mode 100644
> index 0000000..cea6a38
> --- /dev/null
> +++ b/package/vlc/vlc-0003-automake-add-subdir-objects-option.patch
> @@ -0,0 +1,22 @@
> +automake: add subdir-objects option
> +
> +Our version of automake warns if this option is enabled and source files
> +in subdirectories are used.
> +
> +It doesn't really seems to have a noticable effect on the build, but it
> +does remove a lot of annoying warnings.
> +
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> +
> +diff -Nrup vlc-2.1.2.orig/configure.ac vlc-2.1.2/configure.ac
> +--- vlc-2.1.2.orig/configure.ac        2014-02-27 00:22:19.512944952 +0100
> ++++ vlc-2.1.2/configure.ac     2014-02-27 00:24:21.360940651 +0100
> +@@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
> + AC_CANONICAL_HOST
> + AC_PRESERVE_HELP_ORDER
> +
> +-AM_INIT_AUTOMAKE(tar-ustar color-tests foreign)
> ++AM_INIT_AUTOMAKE(tar-ustar color-tests foreign subdir-objects)
> + AC_CONFIG_HEADERS([config.h])
> +
> + # Disable with "./configure --disable-silent-rules" or "make V=1"
> --
> 1.9.0

Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
