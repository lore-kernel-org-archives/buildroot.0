From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 9 Aug 2008 21:01:16 +0200
Subject: [Buildroot] [PATCH] Makefile: also copy top level hidden files to
	the rootfs
Message-ID: <200808092101.16455.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure about the filename pattern .[^.]*
Is it dependent on the shell, does this work with others than bash? Or should
there be another solution?


Makefile: also copy top level hidden files to the rootfs

Hidden files and directories that are located directly under / haven't been
copied to the target rootfs. But for example you may need the shell startup
file /.profile when your home directory is set to /
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1f9e7f6..54462b6 100644
--- a/Makefile
+++ b/Makefile
@@ -319,7 +319,7 @@ $(PROJECT_BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 		if [ -d "$(TARGET_SKELETON)" ]; then \
-			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
+			cp -fa $(TARGET_SKELETON)/* $(TARGET_SKELETON)/.[^.]* $(TARGET_DIR)/; \
 		fi; \
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
