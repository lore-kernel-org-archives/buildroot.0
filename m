From: Ilya Averyanov <averyanovin@gmail.com>
Date: Tue, 13 Aug 2019 00:29:43 +0300
Subject: [Buildroot] [PATCH 1/1] package/libvips: bump version to 8.8.1
In-Reply-To: <20190809104655.3158-1-averyanovin@gmail.com>
References: <20190809104655.3158-1-averyanovin@gmail.com>
Message-ID: <CABi8O6Y7nowkdVbCO=JJjoatn=-aizJoALXCYxNjRwHjjb07Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping. Can we apply this to next branch?

??, 9 ???. 2019 ?. ? 13:49, <averyanovin@gmail.com>:
>
> From: Ilya Averyanov <averyanovin@gmail.com>
>
> Remove patch. Now gtk-doc disable correct.
>
> Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
> ---
>  package/libvips/0001-fix-no-gtk-doc.patch | 35 -----------------------
>  package/libvips/libvips.hash              |  2 +-
>  package/libvips/libvips.mk                |  7 ++---
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/libvips/0001-fix-no-gtk-doc.patch
>
> diff --git a/package/libvips/0001-fix-no-gtk-doc.patch b/package/libvips/0001-fix-no-gtk-doc.patch
> deleted file mode 100644
> index bfaf7c345b..0000000000
> --- a/package/libvips/0001-fix-no-gtk-doc.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From a3d47be3b6bed845af5e1aa87ca2da2b1e840cbb Mon Sep 17 00:00:00 2001
> -From: Pieter De Gendt <pieter.degendt@basalte.be>
> -Date: Thu, 29 Jan 2015 12:25:35 +0100
> -Subject: [PATCH] Same patch as for systemd in commit
> - http://git.buildroot.net/buildroot/commit/?id=7144f2f04b70553
> -
> -Fix deactivation of gtk-doc
> -
> -The tarball contains the Makefile for building documentation with gtk-doc,
> -Unfortunately the AM_CONDITIONAL variable is not the correct one, which
> -results in an error when running autoreconf.
> -
> -This patch fixes this issue.
> -
> -Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
> ----
> - doc/reference/gtk-doc.make | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/doc/reference/gtk-doc.make b/doc/reference/gtk-doc.make
> -index e791656..786803e 100644
> ---- a/doc/reference/gtk-doc.make
> -+++ b/doc/reference/gtk-doc.make
> -@@ -267,7 +267,7 @@ uninstall-local:
> - #
> - # Require gtk-doc when making dist
> - #
> --if HAVE_GTK_DOC
> -+if ENABLE_GTK_DOC
> - dist-check-gtkdoc: docs
> - else
> - dist-check-gtkdoc:
> ---
> -2.2.2
> -
> diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
> index 18c1ae80f9..54d838bb9b 100644
> --- a/package/libvips/libvips.hash
> +++ b/package/libvips/libvips.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  45961855e21c8d5f0983d05bb79a6f3c2427dc6eed8e3ac68c0f62759b8612c6  vips-7.42.2.tar.gz
> +sha256  a0ee255a2a1ebfea5b2dff2a780824d7157a78c010d7ddd531279aacefbf2539  vips-8.8.1.tar.gz
> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> index 72fcf6003e..66153b244b 100644
> --- a/package/libvips/libvips.mk
> +++ b/package/libvips/libvips.mk
> @@ -4,14 +4,11 @@
>  #
>  ################################################################################
>
> -LIBVIPS_VERSION_MAJOR = 7.42
> -LIBVIPS_VERSION = $(LIBVIPS_VERSION_MAJOR).2
> +LIBVIPS_VERSION = 8.8.1
>  LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
> -LIBVIPS_SITE = http://www.vips.ecs.soton.ac.uk/supported/$(LIBVIPS_VERSION_MAJOR)
> +LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
>  LIBVIPS_LICENSE = LGPL-2.1+
>  LIBVIPS_LICENSE_FILES = COPYING
> -# We're patching gtk-doc.make, so need to autoreconf
> -LIBVIPS_AUTORECONF = YES
>
>  # Sparc64 compile fails, for all optimization levels except -O0. To
>  # fix the problem, use -O0 with no optimization instead. Bug reported
> --
> 2.20.1
>
