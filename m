From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Jul 2015 23:34:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <CA+BsyQ6gLC2LQdReP1rAuO1CjeL+BAw0+Z9qFB7moLWTUh5v9A@mail.gmail.com>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
 <20150726193803.GB17029@tarshish>
 <CA+BsyQ6yfCRKAHpMq2Y68N9DSKrD3z20jBzfWgmSdqnTjXEk4w@mail.gmail.com>
 <20150726200401.GF17029@tarshish>
 <CA+BsyQ6gLC2LQdReP1rAuO1CjeL+BAw0+Z9qFB7moLWTUh5v9A@mail.gmail.com>
Message-ID: <20150726203413.GG17029@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brendan,

On Sun, Jul 26, 2015 at 09:14:29PM +0100, Brendan Heading wrote:
> > Just copy the dependencies of BR2_PACKAGE_LIBFUSE to
> > BR2_PACKAGE_EXFAT_UTILS.
> > See the explanation at
> > http://nightly.buildroot.org/manual.html#_config_files
> > under "Choosing depends on or select".
> 
> I think this has already been done ? package/exfat/Config.in :
> 
> config BR2_PACKAGE_EXFAT
> bool "exFAT (FUSE)"
> depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
> depends on BR2_USE_MMU # libfuse
> depends on BR2_USE_WCHAR
> depends on !BR2_STATIC_LIBS # libfuse
> select BR2_PACKAGE_LIBFUSE <-- added by me

As far as I can see your patch touches package/exfat-utils/Config.in, not 
package/exfat/Config.in.

baruch

> help
>   A full-featured exFAT file system implementation for GNU/Linux
>   and other Unix-like systems as a FUSE module.
> 
>   http://code.google.com/p/exfat/
> 
> package/libfuse/Config.in :
> 
> config BR2_PACKAGE_LIBFUSE
> bool "libfuse"
> # Really doesn't like static, see fuse/lib/fuse.c
> depends on !BR2_STATIC_LIBS
> depends on BR2_TOOLCHAIN_HAS_THREADS
> depends on BR2_USE_MMU # fork()
> help
>   FUSE (Filesystem in UserSpacE)
> 
>   http://fuse.sourceforge.net/

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
