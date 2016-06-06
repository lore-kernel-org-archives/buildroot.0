From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jun 2016 20:08:15 -0300
Subject: [Buildroot] [PATCH] openntpd: bump to version 6.0p1
Message-ID: <1465254495-23323-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openntpd/openntpd.hash | 4 ++--
 package/openntpd/openntpd.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index e066904..7f5d3e3 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,2 +1,2 @@
-# From ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/SHA256
-sha256	a993d95976e375acc0ab1a677fd268f55024477835633c8ae404895046bccb23	openntpd-5.7p4.tar.gz
+# From http://www.openntpd.org/txt/release-6.0p1.txt
+sha256	b1ab80094788912adb12b33cb1f251cc58db39294c1b5c6376972f5f7ba577e8	openntpd-6.0p1.tar.gz
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 40bb1bf..9c98064 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 5.7p4
+OPENNTPD_VERSION = 6.0p1
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = COPYING
+# Ships a beta libtool version hence our patch doesn't apply.
+OPENNTPD_AUTORECONF = YES
 
 # openntpd uses pthread functions for arc4random emulation but forgets
 # to use -pthread
-- 
2.7.3
