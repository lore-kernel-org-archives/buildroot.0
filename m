From: Javier Viguera <javier.viguera@digi.com>
Date: Fri, 26 Nov 2010 19:26:56 +0100
Subject: [Buildroot] [PATCH 1/1] target-finalize: do not strip libthread_db
In-Reply-To: <1290796016-2136-1-git-send-email-javier.viguera@digi.com>
References: <1290796016-2136-1-git-send-email-javier.viguera@digi.com>
Message-ID: <1290796016-2136-2-git-send-email-javier.viguera@digi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix previous commit not to strip libthread_db library. In the previous
commit the wildcard was incorrectly matching the symbolic link instead
of the real library file.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 6752aa6..fc165e1 100644
--- a/Makefile
+++ b/Makefile
@@ -418,7 +418,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 endif
-	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db.so*' | \
+	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
-- 
1.7.3.2
