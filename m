From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:11:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Fix linking with
 sunxi-mali
In-Reply-To: <1437833993-1654-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437833993-1654-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150726151113.4dfbbddb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 25 Jul 2015 16:19:53 +0200, Bernd Kuhls wrote:
> Since
> http://git.buildroot.net/buildroot/commit/package/sunxi-mali?id=8906f272ab41e0373f392cc7a04cc97320dd8382
> sunxi-mali as egl/gles provider also depends on libump.
> 
> This dependency was unknown to Kodi leading to this error during
> configure:
> 
> configure:23127: /home/buildroot/build/instance-0/output/host/usr/bin/arm-none-linux-gnueabi-gcc -o conftest -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -D_DEBUG -Wall -mno-apcs-stack-check -mfpu=neon -mvectorize-with-neon-quad -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lEGL   -lpython2.7 -lpthread -ldl -lutil -lm >&5
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libUMP.so.2, needed by /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/thumb2/usr/lib/libMali.so, not found (try using -rpath or -rpath-link)
> /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/thumb2/usr/lib/libEGL.so: undefined reference to `ump_close'
> 
> This patch updates CXXFLAGS with the necessary libs to fix linking of
> the final kodi binary. The additional CFLAGS are needed because
> configure uses gcc to detect egl support.
> 
> Fixes
> http://autobuild.buildroot.net/results/ce3/ce35d25253410abcbdbf1c58a5c9fb90f4eea6cd/
> http://autobuild.buildroot.net/results/1ee/1eefd8e23d8e1b4374c79201b4c631603372d431/
> http://autobuild.buildroot.net/results/3d8/3d8314392c61d6d278fb900a028e3bfc4d1d4d2c/
> http://autobuild.buildroot.net/results/ee5/ee5e53ed9e2bbebab64122dd422d5da6abca3095/
> http://autobuild.buildroot.net/results/703/7033594221b4a75e7f8aea8c145c8b7d2db0637c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/kodi.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
