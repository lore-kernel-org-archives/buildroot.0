From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 May 2012 18:26:05 +0200
Subject: [Buildroot] [PATCH 1/2] libaio: make available only on supported
	architectures
In-Reply-To: <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
References: <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f91dca9115c62024abe481cbf529baece84f70ec.1336235161.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libaio has some architecture-specific code, and isn't available for
all architectures that Buildroot support.

Fixes
http://autobuild.buildroot.org/results/b171a6d6243ea021dc52830bc4b9d36fc083a60d/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libaio/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.7.9.5
