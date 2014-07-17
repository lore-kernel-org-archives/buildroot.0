From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 17 Jul 2014 17:06:18 +0200
Subject: [Buildroot] [PATCH] pkg-infra: Fix DOWNLOAD_LOCALFILES
Message-ID: <1405609578-28052-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cp helperscript expects a filename as target, but just the folder name was given.
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7f208d5..118591c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -206,7 +206,7 @@ endef
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call qstrip,$(1))) \
-					 $(DL_DIR) && \
+					 $(DL_DIR)/$(2) && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
-- 
1.8.3.2
