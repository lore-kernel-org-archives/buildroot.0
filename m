From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 14 Sep 2020 20:58:30 +1200
Subject: [Buildroot] [PATCH 2/3] micropython: Bump version to 1.13
In-Reply-To: <20200914085831.25302-1-judge.packham@gmail.com>
References: <20200914085831.25302-1-judge.packham@gmail.com>
Message-ID: <20200914085831.25302-2-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 49fd903fab..4ca3f8402f 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256 330cd32c7b67cb6b531d158eabcf68af3a7d7ad7b5a4b0ce3c73da3d241da6a2  micropython-1.12.tar.gz
+sha256 31466dacebeb3af60dc80a071a07c3e15b657219a826e0b6ac741f9f22472f23  micropython-1.13.tar.gz
 sha256 afde3432122205e8e08d615fcb920aca58631c52b6c0c01813854287a457b298  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 8328992090..7c83b18b4e 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.12
+MICROPYTHON_VERSION = 1.13
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
@@ -40,7 +40,7 @@ define MICROPYTHON_INSTALL_TARGET_CMDS
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
 		DESTDIR=$(TARGET_DIR) \
-		PREFIX=$(TARGET_DIR)/usr \
+		PREFIX=/usr \
 		install
 endef
 
-- 
2.28.0
