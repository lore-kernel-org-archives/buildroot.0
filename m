From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Apr 2016 21:41:32 +0200
Subject: [Buildroot] [PATCH] toolchain-external: bump CodeSourcery NiosII to
	2015.11-130
Message-ID: <1462045292-22024-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From getting-started.pdf:
- DWARF signed LEB128 encoding fix
- Fix CVE 2015-7547 getaddrinfo
- Breakpoint in non-existent file bug fix

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.hash | 4 ++--
 toolchain/toolchain-external/toolchain-external.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 2f1c44f..f07bdf9 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -14,8 +14,8 @@ sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfi
 sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
 # NiosII
-sha256 cc47745dc1264fcb8fb98fb1315ab772ab98691396021c455229b58abaf887f5  sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 8b5710e41685a316d577b503c068c69ba1eaf228fe0a056cac36945323a0dd23  sourceryg++-2015.11-27-nios2-linux-gnu.src.tar.bz2
+sha256 e43899fd950e5d06e90c2eb01527c626240b6b4a603cbbeb532fad9fb8ea58c3  sourceryg++-2015.11-130-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 c412375ba3f93bafc9225de22366fa5b3f4d073ef856cf19595237ddb0815e6d  sourceryg++-2015.11-130-nios2-linux-gnu.src.tar.bz2
 # PowerPC
 sha256 525e1f53abbf65c2974ae9af762c45bb38520fe5fc50e968a23fe6a18e9eec04  freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 fe45a1d2725e1b9f0ec7b8041c923e01f461da01b298caad537854ec1c61e211  freescale-2011.03-38-powerpc-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 5bd1df7..8ed1881 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -338,7 +338,7 @@ TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-l
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-130-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.5.5
