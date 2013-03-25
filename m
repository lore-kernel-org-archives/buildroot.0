From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 23:38:26 +0100
Subject: [Buildroot] [git commit] Support .dotfiles in / being copied to the
	TARGET
Message-ID: <20130325225558.4A9249B2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cd3f992fb3659aacbb0cdd3ed64347a37569891
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An example is .init_enable_core, to enable coredumps in busybox

Signed-off-by: Tilman Keskin??z <arved@arved.at>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
