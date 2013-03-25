From: arved at arved.at <arved@arved.at>
Date: Mon, 25 Mar 2013 15:48:11 +0100
Subject: [Buildroot] [PATCH 2/4] Support .dotfiles in / being copied to the
	TARGET
In-Reply-To: <1364222893-23858-1-git-send-email-arved@arved.at>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
Message-ID: <1364222893-23858-2-git-send-email-arved@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tilman Keskin?z <arved@arved.at>

An example is .init_enable_core, to enable coredumps in busybox

Signed-off-by: Tilman Keskin?z <arved@arved.at>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f1c98aa..62311ed 100644
--- a/Makefile
+++ b/Makefile
@@ -431,7 +431,7 @@ $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 		if [ -d "$(TARGET_SKELETON)" ]; then \
-			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
+			rsync -au $(TARGET_SKELETON)/ $(TARGET_DIR)/; \
 		fi; \
 	fi
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
-- 
1.7.10.4
