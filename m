From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  6 Jan 2021 18:17:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/minicom: use official tarball
Message-ID: <20210106171753.56540-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use official tarball (this will also have the nice side-effect of making
MINICOM_VERSION compatible with release-monitoring.org)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 970b7ad2c1..42a4499c85 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0e5d218d9f8f00fb9cc323f7517c49d8eb12a22d158efee513df3c50843619fb  minicom-v2.8.tar.gz
+sha256  38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba  minicom-2.8.tar.bz2
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 616a3bd24f..1e12725983 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MINICOM_VERSION = v2.8
-MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
-MINICOM_SITE_METHOD = git
+MINICOM_VERSION = 2.8
+MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.bz2
+MINICOM_SITE = \
+	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 MINICOM_AUTORECONF = YES
-- 
2.29.2
