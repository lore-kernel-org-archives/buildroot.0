From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 21:14:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <20150726200401.GF17029@tarshish>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
 <20150726193803.GB17029@tarshish>
 <CA+BsyQ6yfCRKAHpMq2Y68N9DSKrD3z20jBzfWgmSdqnTjXEk4w@mail.gmail.com>
 <20150726200401.GF17029@tarshish>
Message-ID: <CA+BsyQ6gLC2LQdReP1rAuO1CjeL+BAw0+Z9qFB7moLWTUh5v9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Just copy the dependencies of BR2_PACKAGE_LIBFUSE to
> BR2_PACKAGE_EXFAT_UTILS.
> See the explanation at
> http://nightly.buildroot.org/manual.html#_config_files
> under "Choosing depends on or select".
>

Baruch,

I think this has already been done ? package/exfat/Config.in :

config BR2_PACKAGE_EXFAT
bool "exFAT (FUSE)"
depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
depends on BR2_USE_MMU # libfuse
depends on BR2_USE_WCHAR
depends on !BR2_STATIC_LIBS # libfuse
select BR2_PACKAGE_LIBFUSE <-- added by me
help
  A full-featured exFAT file system implementation for GNU/Linux
  and other Unix-like systems as a FUSE module.

  http://code.google.com/p/exfat/

package/libfuse/Config.in :

config BR2_PACKAGE_LIBFUSE
bool "libfuse"
# Really doesn't like static, see fuse/lib/fuse.c
depends on !BR2_STATIC_LIBS
depends on BR2_TOOLCHAIN_HAS_THREADS
depends on BR2_USE_MMU # fork()
help
  FUSE (Filesystem in UserSpacE)

  http://fuse.sourceforge.net/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/1267c0cc/attachment.html>
