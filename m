From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 11 Oct 2015 23:02:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/shairport-sync: bump to version
	2.4.1
Message-ID: <1444597369-27828-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove backported from upstream patch.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
  - Fix autoreconf comment (Baruch Siach)
---
 package/shairport-sync/shairport-sync.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 36d5b82..fa7100a 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.4
+SHAIRPORT_SYNC_VERSION = 2.4.1
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
-SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/6ae067af1f695e615415cde69a506ad330dbc45b.patch
 
-# Touching configure.ac with the patches
+# git clone, no configure
 SHAIRPORT_SYNC_AUTORECONF = YES
 
 SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
-- 
2.6.1
