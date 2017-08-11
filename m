From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Aug 2017 10:14:04 +0200
Subject: [Buildroot] [PATCH 1/2] package/monolite: bump to version 1050001000
Message-ID: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest version of mono carries a bit of changes in the monolite
package: the version string changes and from now on, monolite should
be installed in a subdirectory with the exact version string as a name.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 09f9554..7638ce2 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 2cdf6cff1d82d76412461a4c8a3616bb2aa1e835fb55479941662dec3799c924  monolite-156-latest.tar.gz
+sha256 365dc589e6d336530ef8efaa491e932c15163f449632daef6c41bed770d9fe53  monolite-1050001000-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 73f2352..2cc08df 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 156
+MONOLITE_VERSION = 1050001000
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
 
 define HOST_MONOLITE_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/lib/monolite
-	cp $(@D)/* $(HOST_DIR)/usr/lib/monolite
+	mkdir -p $(HOST_DIR)/usr/lib/monolite/$(MONOLITE_VERSION)
+	cp -r $(@D)/* $(HOST_DIR)/usr/lib/monolite/$(MONOLITE_VERSION)
 endef
 
 $(eval $(host-generic-package))
-- 
2.7.4
