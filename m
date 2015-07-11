From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 11 Jul 2015 16:15:07 +0200
Subject: [Buildroot] [PATCH 4/7] nanocom: use <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1436624110-20428-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/nanocom/nanocom.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index f723951281f7..293dd091fc9d 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -7,14 +7,10 @@
 NANOCOM_VERSION = 1.0
 NANOCOM_SOURCE = nanocom.tar.gz
 NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v$(NANOCOM_VERSION)
+NANOCOM_STRIP_COMPONENTS = 0
 NANOCOM_LICENSE = GPLv2+
 NANOCOM_LICENSE_FILES = COPYING
 
-# N.B. Don't strip any path components during extraction.
-define NANOCOM_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(NANOCOM_SOURCE) | tar --strip-components=0 -C $(NANOCOM_DIR) -xf -
-endef
-
 define NANOCOM_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
 endef
-- 
1.9.1
