From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 Mar 2018 00:14:01 +0300
Subject: [Buildroot] [PATCH] time: bump to version 1.9
Message-ID: <a7074ff187b9bbaf0663f6a0e952587cf2a8d336.1522271641.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix seed variable name for the wait3 system call AC_TRY_RUN test.

Remove manual installation; not needed anymore.

Cc: Will Newton <will.newton@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/time/time.hash |  2 +-
 package/time/time.mk   | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/time/time.hash b/package/time/time.hash
index 7d395bfb6c30..b843534a5899 100644
--- a/package/time/time.hash
+++ b/package/time/time.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8a2f540155961a35ba9b84aec5e77e3ae36c74cecb4484db455960601b7a2e1b	time-1.8.tar.gz
+sha256	fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e	time-1.9.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/time/time.mk b/package/time/time.mk
index c238ee6e2777..400eca0dc70a 100644
--- a/package/time/time.mk
+++ b/package/time/time.mk
@@ -4,16 +4,10 @@
 #
 ################################################################################
 
-TIME_VERSION = 1.8
+TIME_VERSION = 1.9
 TIME_SITE = $(BR2_GNU_MIRROR)/time
-TIME_CONF_ENV = ac_cv_func_wait3=yes
+TIME_CONF_ENV = ac_cv_func_wait3_rusage=yes
 TIME_LICENSE = GPL-3.0+
 TIME_LICENSE_FILES = COPYING
 
-# time uses an old version of automake that does not support
-# installing in DESTDIR.
-define TIME_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755  $(@D)/time $(TARGET_DIR)/usr/bin/time
-endef
-
 $(eval $(autotools-package))
-- 
2.16.2
