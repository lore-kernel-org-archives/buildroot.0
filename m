From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  5 Mar 2016 16:58:35 +0100
Subject: [Buildroot] [PATCH] package/shairport-sync: bump to version 2.8.1
Message-ID: <1457193515-17693-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove patch from upstream.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.hash | 3 +--
 package/shairport-sync/shairport-sync.mk   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 35aba30..1cf7d55 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  6f3535012ed25017e4f893f9bad5391c2ea23c64f398caac3f29d8dad5f9e987  shairport-sync-2.8.0.tar.gz
-sha256  e0c750f51c54611e564ddb1ee161aa57ba6be36d3bf54198d9a6435ad6bf1757  8e8a0ee7ab0db61dc46735a1206843fe943ffc61.patch
+sha256  9e137da3c96c233f55a35ac50cb2fc9f96d4bee76c4907b75a3dd6af7be1745a  shairport-sync-2.8.1.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 628d121..42c2e60 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.8.0
+SHAIRPORT_SYNC_VERSION = 2.8.1
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
-SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/8e8a0ee7ab0db61dc46735a1206843fe943ffc61.patch
 
 # git clone, no configure
 SHAIRPORT_SYNC_AUTORECONF = YES
-- 
2.7.2
