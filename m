From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 18 Jun 2012 10:02:21 -0500
Subject: [Buildroot] [RFC/PATCH 2/4] ensure target fs is writable
In-Reply-To: <1340031743-29694-1-git-send-email-ntl@pobox.com>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
Message-ID: <1340031743-29694-3-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the source target skeleton is read-only, modifications to the
output target (such as creating /etc/hostname and /etc/issue) fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 Makefile |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9a9634d..38276cd 100644
--- a/Makefile
+++ b/Makefile
@@ -378,6 +378,7 @@ endif
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 		if [ -d "$(TARGET_SKELETON)" ]; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
+			chmod -R u+w $(TARGET_DIR)/; \
 		fi; \
 	fi
 	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
-- 
1.7.10.2
