From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Feb 2016 13:02:27 +0100
Subject: [Buildroot] [PATCH v2] package/knock: bump version to 0.7.8
Message-ID: <1454760147-31190-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream source repo switched to github.com. Since the last release
dating back to 2014 no new tarball was released so we switch to the
latest github commit.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: explained version bump (Thomas)

 package/knock/knock.hash | 2 +-
 package/knock/knock.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/knock/knock.hash b/package/knock/knock.hash
index ae152db..3599e43 100644
--- a/package/knock/knock.hash
+++ b/package/knock/knock.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 9938479c321066424f74c61f6bee46dfd355a828263dc89561a1ece3f56578a4 knock-0.7.tar.gz
+sha256	940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58	knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 28db1eb..2ab8d1b 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 0.7
-KNOCK_SITE = http://www.zeroflux.org/proj/knock/files
+KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
+KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
+KNOCK_AUTORECONF = YES
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
-- 
2.7.0
