From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Feb 2020 16:00:59 +0100
Subject: [Buildroot] [PATCH 1/2] Makefile: use HOST_DIR_SYMLINK instead of
 hardcoding
Message-ID: <20200218150101.22274-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a52f1c75fd..facccd32e7 100644
--- a/Makefile
+++ b/Makefile
@@ -455,7 +455,7 @@ endif
 ifneq ($(HOST_DIR),$(BASE_DIR)/host)
 HOST_DIR_SYMLINK = $(BASE_DIR)/host
 $(HOST_DIR_SYMLINK): $(BASE_DIR)
-	ln -snf $(HOST_DIR) $(BASE_DIR)/host
+	ln -snf $(HOST_DIR) $(HOST_DIR_SYMLINK)
 endif
 
 # Quotes are needed for spaces and all in the original PATH content.
-- 
2.24.1
