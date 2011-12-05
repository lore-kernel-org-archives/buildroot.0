From: Will Wagner <will_wagner@carallon.com>
Date: Mon,  5 Dec 2011 18:28:41 +0000
Subject: [Buildroot] [PATCH] Ensure distclean actually removes everything
Message-ID: <1323109721-14824-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 0d67143..9b8a8d9 100644
--- a/Makefile
+++ b/Makefile
@@ -627,8 +627,10 @@ ifeq ($(DL_DIR),$(TOPDIR)/dl)
 endif
 ifeq ($(O),output)
 	rm -rf $(O)
+else
+	rm -rf $(O)/toolchainfile.cmake
 endif
-	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
+	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps $(CONFIG_DIR)/..config.tmp
 
 cross: $(BASE_TARGETS)
 
-- 
1.7.2.5
