From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  6 May 2016 09:45:12 +0200
Subject: [Buildroot] [PATCH 1/2] macchanger: bump to version 1.7.0
Message-ID: <1462520713-9222-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to github repository to fetch latest version, which also added the
missing license file.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/macchanger/macchanger.hash | 2 +-
 package/macchanger/macchanger.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/macchanger/macchanger.hash b/package/macchanger/macchanger.hash
index d0b6f35..ce3a7f5 100644
--- a/package/macchanger/macchanger.hash
+++ b/package/macchanger/macchanger.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	31534f138f1d21fa247be74ba6bef3fbfa47bbcd5033e99bd10c432fe58e51f7	macchanger-1.6.0.tar.gz
+sha256  dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf  macchanger-1.7.0.tar.gz
diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
index a7ea943..2e716d9 100644
--- a/package/macchanger/macchanger.mk
+++ b/package/macchanger/macchanger.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MACCHANGER_VERSION = 1.6.0
-MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
+MACCHANGER_VERSION = 1.7.0
+MACCHANGER_SITE = https://github.com/alobbs/macchanger/releases/download/$(MACCHANGER_VERSION)
 MACCHANGER_LICENSE = GPLv2+
-MACCHANGER_LICENSE_FILES = src/main.c
+MACCHANGER_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
2.8.2
