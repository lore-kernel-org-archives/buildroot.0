From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 16:03:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: disable inline asm on
 i386
In-Reply-To: <20170402112507.14419-1-bernd.kuhls@t-online.de>
References: <20170402112507.14419-1-bernd.kuhls@t-online.de>
Message-ID: <20170406160336.630ba15d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 13:25:07 +0200, Bernd Kuhls wrote:
> A similar fix was committed to ffmpeg:
> https://git.buildroot.net/buildroot/commit/package/ffmpeg?id=bfb8df2ad9b164b421d25294c6882c8b61dc59a5

It is not similar: ffmpeg only disables it for i586, while for mplayer
you disable it for the x86 architecture completely.

> Fixes
> http://autobuild.buildroot.net/results/030/03066dd8937ef4c75d62f237fd195df92b247ee2//

And this configuration is i686, so if the ffmpeg fix of disabling
inline ASM is used, it will not solve this build failure.

>  ifeq ($(BR2_i386),y)
> -# inline asm breaks with "can't find a register in class 'GENERAL_REGS'"
> -# inless we free up ebp
> -MPLAYER_CFLAGS += -fomit-frame-pointer
> +MPLAYER_POST_CONFIGURE_HOOKS += MPLAYER_DISABLE_INLINE_ASM
>  endif

Do we really want to disable this for all x86 platforms?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
