From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 18:50:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1467477991-13051-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467477991-13051-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160702185004.34235606@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 18:46:31 +0200, Bernd Kuhls wrote:
> Also propagate as reverse dependency to libplayer & tovid.
> 
> Fixes
> http://autobuild.buildroot.net/results/630/6306757da3be9bb7e3cdcbfc8abb4e64a3fb7913/

According to this build failure:

ffmpeg/libavcodec/libavcodec.a(utils.o): In function `default_lockmgr_cb':
utils.c:(.text+0x3f8): undefined reference to `__sync_val_compare_and_swap_4'
utils.c:(.text+0x48c): undefined reference to `__sync_val_compare_and_swap_4'

So it's the internal copy of ffmpeg that mplayer carries that uses
those atomic operations.

In this case, why doesn't the standalone ffmpeg package also use atomic
operations ? Is the ffmpeg code base different ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
