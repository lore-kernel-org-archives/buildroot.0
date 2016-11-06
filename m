From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Nov 2016 17:19:24 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/x265: bump version to 2.1"
Message-ID: <20161106161924.9791-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 1ba7b6a4f12977aec994c4f38d5be38cfdb27846.

Adding -DCROSS_COMPILE_ARM=ON to _CONF_OPTS will not fix the build:

/home/buildroot/br2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gnu/stubs.h:7:29:
  fatal error: gnu/stubs-soft.h: No such file or directory

because cross-compiling x265 is only supported for soft-float abi:
https://bitbucket.org/multicoreware/x265/src/583fc74fc0a29f330187dbd78151c30a3e03d5a7/source/CMakeLists.txt?at=default#CMakeLists.txt-211

Fixes
http://autobuild.buildroot.net/results/6ec/6ec75cc176e05bfc6287dc54fa1a53e0ffc0521d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index d6dec12..92b5bea 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 88fcb9af4ba52c0757ac9c0d8cd5ec79951a22905ae886897e06954353d6a643  x265_2.1.tar.gz
+sha256	3e4654133ed957a98708fdb4cb9a154d9e80922b84e26e43fc462a101c5b15c8	x265_1.9.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index ba284da..e737c31 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 2.1
+X265_VERSION = 1.9
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPLv2+
-- 
2.10.2
