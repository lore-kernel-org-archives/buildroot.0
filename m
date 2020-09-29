From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 18:02:37 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/fontconfig: add pthread as a
 dependency of a static lib
In-Reply-To: <20200920115816.1567616-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 20 Sep 2020 13:58:14 +0200")
References: <20200920115816.1567616-1-bernd.kuhls@t-online.de>
Message-ID: <87k0wcwoyq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d2d/d2d73f3c7075ca6e9782b9bb591dae40ab56b6a2/

 > ffmpeg configure prints: "ERROR: fontconfig not found using pkg-config"

 > Please note that the ffmpeg build error was reproducible but with a
 > different error message in ffbuild/config.log:

 >   sysroot/usr/lib/libfontconfig.a(fccache.o): in function `lock_cache':
 >   fccache.c:(.text+0xcd8): undefined reference to `pthread_mutex_init'

 >   arm-buildroot-linux-gnueabi/bin/ld: fccache.c:(.text+0xcf8):
 >   undefined reference to `pthread_mutex_destroy'

 >   arm-buildroot-linux-gnueabi/bin/ld: fccache.c:(.text+0xd00):
 >   undefined reference to `pthread_mutex_lock'

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: removed " 1/1" from patch subject

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
