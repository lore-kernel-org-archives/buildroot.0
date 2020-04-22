From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 22 Apr 2020 11:36:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/evtest: switch to Gitlab
Message-ID: <20200422093633.31668-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Downloading from the cgit repo is now broken and it is a mirror of the
Gitlab repo so use the Gitlab repo.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/evtest/Config.in   | 2 +-
 package/evtest/evtest.hash | 2 +-
 package/evtest/evtest.mk   | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/evtest/Config.in b/package/evtest/Config.in
index 1087217ee4..e74bac02fd 100644
--- a/package/evtest/Config.in
+++ b/package/evtest/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_EVTEST
 	  device. It then monitors the device and displays all the
 	  events layer events generated.
 
-	  http://cgit.freedesktop.org/evtest
+	  https://gitlab.freedesktop.org/libevdev/evtest
diff --git a/package/evtest/evtest.hash b/package/evtest/evtest.hash
index 566d423fcd..b1ee24371e 100644
--- a/package/evtest/evtest.hash
+++ b/package/evtest/evtest.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256 73d5b604d57551418d282fedee3deae9f851afb3c355dccc87153364c046efd3 evtest-1.34.tar.gz
+sha256 0e7a2eeff380af796e5e9b21b6f48fd706c58c931162c151c2c1074bdfeb85c6 evtest-evtest-1.34.tar.gz
 
 # License files
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index d2fd01c2d9..8b8667e045 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 EVTEST_VERSION = 1.34
-EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
+EVTEST_SOURCE = evtest-evtest-$(EVTEST_VERSION).tar.gz
+EVTEST_SITE = https://gitlab.freedesktop.org/libevdev/evtest/-/archive/evtest-$(EVTEST_VERSION)
 EVTEST_LICENSE = GPL-2.0+
 EVTEST_LICENSE_FILES = COPYING
 EVTEST_DEPENDENCIES = host-pkgconf
-- 
2.25.3
