From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 11:29:39 +0100
Subject: [Buildroot] [git commit] package/arp-scan: bump version to 1.9.7
Message-ID: <20200201101914.C79C5873D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5cfb319f9493d677f059ca72b80f7fa22fc9f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/arp-scan/arp-scan.hash | 2 +-
 package/arp-scan/arp-scan.mk   | 2 +-
 package/python/python.mk       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index d14e6ba270..562deb8ff0 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	971b45c3369816467994797fbcd0076eb8f0ffb9c42764ea6dba25ab3fd490da	arp-scan-1.9.6.tar.gz
+sha256  e03c36e4933c655bd0e4a841272554a347cd0136faf42c4a6564059e0761c039	arp-scan-1.9.7.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 20e9cb62fe..cc1efe84a7 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9.6
+ARP_SCAN_VERSION = 1.9.7
 ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
diff --git a/package/python/python.mk b/package/python/python.mk
index 41a981e3d3..9e3c32687c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -60,7 +60,7 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 ifeq ($(BR2_PACKAGE_HOST_PYTHON_SSL),y)
 HOST_PYTHON_DEPENDENCIES += host-openssl
 else
-HOST_PYTHON_CONF_OPTS += --disable-ssl
+HOST_PYTHON_CONF_OPTS += --disable-ssl --disable-hashlib
 endif
 
 PYTHON_INSTALL_STAGING = YES
