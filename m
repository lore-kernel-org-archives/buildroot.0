From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:21:59 -0800
Subject: [Buildroot] [git commit] linux-fusion: bump to version 8.10.4
Message-ID: <20121130154710.2BCF399369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bed3e388a91c7a4ce78eeaa6f958774ab772cb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix directfb build avoiding the following error to occur
(since FCEF_FOLLOW has been added in linux-fusion-8.9.0):

libtool: compile:  /opt/br/output/host/usr/bin/ccache /opt/br/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I../.. -I../../include -I../../lib -I../../include -I../../lib -DDATADIR=\"/usr/share/directfb-1.4.17\" -DMODULEDIR=\"/usr/lib/directfb-1.4-6\" -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -ffast-math -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -g2 -g3 -fno-inline -Wno-inline -D_GNU_SOURCE -finstrument-functions -std=gnu99 -Werror-implicit-function-declaration -MT call.lo -MD -MP -MF .deps/call.Tpo -c call.c  -fPIC -DPIC -o .libs/call.o
call.c: In function 'fusion_call_execute3':
call.c:311:66: error 'FCEF_FOLLOW' undeclared (first use in this function)
call.c:311:66: note: each undeclared identifier is reported only once for each function it appears in
call.c: In function 'fusion_world_flush_calls':
call.c:444:54: error 'FCEF_FOLLOW' undeclared (first use in this function)
make[5]: *** [call.lo] Error 1
make[5]: Leaving directory `/opt/br/output/build/directfb-1.4.17/lib/fusion'

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index feb1ab3..631f526 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -3,7 +3,7 @@
 # linux-fusion
 #
 #############################################################
-LINUX_FUSION_VERSION = 8.8.1
+LINUX_FUSION_VERSION = 8.10.4
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
