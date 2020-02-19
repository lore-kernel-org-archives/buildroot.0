From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 20:13:50 +0100
Subject: [Buildroot] [git commit] Makefile: use HOST_DIR_SYMLINK instead of
 hardcoding
Message-ID: <20200219190232.079038E543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b62227d43ce9324e7ab19aace629352d26bca2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 671e12a9d4..5b9e592b35 100644
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
