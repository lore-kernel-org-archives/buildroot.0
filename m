From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 16:09:04 +0100
Subject: [Buildroot] [git commit] package/hostapd: bump to version 2.4
Message-ID: <20150316150915.816F880085@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd505a7e51f9befaf6b3590d21cce66903618964
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
- remove patches: merged upstream
- update hash

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-use-correct-include-path-for-libnl-3.0.patch |   26 --------------------
 package/hostapd/hostapd.hash                       |    2 +-
 package/hostapd/hostapd.mk                         |    2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/package/hostapd/0001-use-correct-include-path-for-libnl-3.0.patch b/package/hostapd/0001-use-correct-include-path-for-libnl-3.0.patch
deleted file mode 100644
index 6ed0eed..0000000
--- a/package/hostapd/0001-use-correct-include-path-for-libnl-3.0.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4426de35f0e5dd5b0152474ce6a885b73de60656 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 16 Dec 2014 23:50:33 +0100
-Subject: [PATCH 2/2] use correct include path for libnl-3.0
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/drivers/drivers.mak | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
-index cdb913e..e9fc83c 100644
---- a/src/drivers/drivers.mak
-+++ b/src/drivers/drivers.mak
-@@ -35,7 +35,7 @@ NEED_RFKILL=y
- ifdef CONFIG_LIBNL32
-   DRV_LIBS += -lnl-3
-   DRV_LIBS += -lnl-genl-3
--  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
-+  DRV_CFLAGS += -DCONFIG_LIBNL20 `pkg-config --cflags libnl-3.0`
- ifdef CONFIG_LIBNL3_ROUTE
-   DRV_LIBS += -lnl-route-3
-   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
--- 
-1.9.3
-
diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index 5aefa14..3c7b63d 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c94c2b76876fad4c80a1063a06f958a2189ba5003475016fa7658a1ca49bb4df	hostapd-2.3.tar.gz
+sha256	6fe0eb6bd1c9cbd24952ece8586b6f7bd14ab358edfda99794e79b9b9dbd657f  hostapd-2.4.tar.gz
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 72305fa..8927dbf 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.3
+HOSTAPD_VERSION = 2.4
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
