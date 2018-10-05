From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 22:12:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] x265: disable parallel
 build
Message-ID: <20181005201140.B6EDE802D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40c7b5c08794c20369d72d3310989645cc2d084d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

It seems package has a parallel build issue on ARM cortex A8 or A9 since
at least version 2.5:

[ 94%] Linking CXX shared library libx265.so
ipfilter8.S.o: file not recognized: File truncated
collect2: error: ld returned 1 exit status
CMakeFiles/x265-shared.dir/build.make:221: recipe for target 'libx265.so.160' failed

Fixes:
 - http://autobuild.buildroot.org/results/f6ea88324a8f9ac8ee780ddd71ec61f922e20210
 - http://autobuild.buildroot.org/results/3bd91a5694936650ce936a408ddd50338f65f8b0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 03bfbc5ab26c9aed0c0cfce55341a1d1f05deca3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x265/x265.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index ae570e6e4c..86709e62b8 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -11,6 +11,7 @@ X265_LICENSE = GPL-2.0+
 X265_LICENSE_FILES = COPYING
 X265_SUBDIR = source
 X265_INSTALL_STAGING = YES
+X265_MAKE = $(MAKE1)
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-yasm
