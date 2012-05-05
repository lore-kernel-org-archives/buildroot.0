From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 19:33:24 +0200
Subject: [Buildroot] [git commit] libaio: make available only on supported
	architectures
Message-ID: <20120505173639.AD86696A7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c5a33e41ba55f5c156204701d775879ff4fd98f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libaio has some architecture-specific code, and isn't available for
all architectures that Buildroot support.

Fixes
http://autobuild.buildroot.org/results/b171a6d6243ea021dc52830bc4b9d36fc083a60d/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libaio/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index ff6cc13..833009a 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -1,4 +1,8 @@
 config BR2_PACKAGE_LIBAIO
 	bool "libaio"
+	depends on \
+		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
+		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
+		BR2_sparc || BR2_x86_64
 	help
 	  Library for doing asynchronous I/O
