From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 09:01:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  mplayer
In-Reply-To: <20070723081239.EB861A67FA@busybox.net>
References: <20070723081239.EB861A67FA@busybox.net>
Message-ID: <1185433286.31437.36.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-07-23 at 01:12 -0700, ulf at uclibc.org wrote:
> Author: ulf
> Date: 2007-07-23 01:12:39 -0700 (Mon, 23 Jul 2007)
> New Revision: 19201
> 
> Log:
> Add mplayer package
> 
> Added:
>    trunk/buildroot/package/mplayer/
>    trunk/buildroot/package/mplayer/Config.in
>    trunk/buildroot/package/mplayer/mplayer-1.0rc1-avr32-support.patch

Which patch is this? Please keep the revision number so I have some idea
where the patch origins. It differs from the atmel.2 patch for mplayer.

 > md5sum package/mplayer/mplayer-1.0rc1-atmel.2.patch
5688bf61f40ebe56c3932ca06c5988d9  package/mplayer/mplayer-1.0rc1-atmel.2.patch
 > l package/mplayer/mplayer-1.0rc1-atmel.2.patch 
-rw-r--r-- 1 hcegtvedt hcegtvedt 216693 2007-07-20 09:36 package/mplayer/mplayer-1.0rc1-atmel.2.patch

>    trunk/buildroot/package/mplayer/mplayer-1.0rc1-remove-configuration-x11-header-search-path.patch
>    trunk/buildroot/package/mplayer/mplayer.mk

Uses _VER, not _VERSION.

MPlayer should also depend on alsa if alsa has been chosen, this will
make mplayer use alsa by default instead of oss.

The same goes for the usage of libmad, it is not used default by
mplayer.

And I assume most embedded systems wants to use fbdev2 instead of fbdev
given the atmel.2 patch.

The atmel.2 patch can disable the double buffering mplayer does and use
the framebuffer directly. The framebuffer should support double
buffering though.

I am looking into what Debian does with mplayer to enable a configure
which suits embedded platforms better.

<cut>

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
-- 
Mvh
Hans-Christian Egtvedt
