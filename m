From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  4 Oct 2017 10:24:36 +0200
Subject: [Buildroot] [PATCH] shairport-sync: bump to version 3.1.3
Message-ID: <20171004082436.10105-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a runtime startup issue on SysV init systems:
```
# shairport-sync -d
Daemon returned 2 as return value.
```

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 35391a84f5..eac39138db 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8c13f7ebbd417e8cab07ea9f74392ced0f54315d8697d4513580f472859a9c65  shairport-sync-3.1.2.tar.gz
+sha256  dd0484d7e8ee7631aee78c78b3762abbdba7ec3f2ee8cd6c1e361544c1414da3  shairport-sync-3.1.3.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 01c13707e8..acca45c121 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.1.2
+SHAIRPORT_SYNC_VERSION = 3.1.3
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.14.2
