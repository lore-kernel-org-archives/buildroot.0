From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 16:06:14 +0200
Subject: [Buildroot] [git commit] time: bump to version 1.9
Message-ID: <20180329140804.47DA383D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec848f899dce5aae2197089d49131f84831eea94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix seed variable name for the wait3 system call AC_TRY_RUN test.

Remove manual installation; not needed anymore.

Cc: Will Newton <will.newton@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/time/time.hash |  2 +-
 package/time/time.mk   | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/time/time.hash b/package/time/time.hash
index 7d395bfb6c..b843534a58 100644
--- a/package/time/time.hash
+++ b/package/time/time.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8a2f540155961a35ba9b84aec5e77e3ae36c74cecb4484db455960601b7a2e1b	time-1.8.tar.gz
+sha256	fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e	time-1.9.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/time/time.mk b/package/time/time.mk
index c238ee6e27..400eca0dc7 100644
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
