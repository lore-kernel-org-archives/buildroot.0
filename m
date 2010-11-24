From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 24 Nov 2010 16:34:13 -0500
Subject: [Buildroot] [PATCH] linux: restore note/comment section stripping
Message-ID: <1290634453-12442-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent linux strip patch dropped the removal of note/comment sections
from kernel modules.  Add them back in using the existing variables.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 81f516b..708a943 100644
--- a/Makefile
+++ b/Makefile
@@ -429,7 +429,7 @@ endif
 	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db.so*' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
+		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(REMOVE_SECTION_COMMENT) $(REMOVE_SECTION_NOTE)
 
 	mkdir -p $(TARGET_DIR)/etc
 	# Mandatory configuration file and auxilliary cache directory
-- 
1.7.3.2
