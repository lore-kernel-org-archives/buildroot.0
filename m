From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:31 +0100
Subject: [Buildroot] [PATCH 02/38] dialog: remove useless POST_CLEAN command
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, the dialog package has a DIALOG_POST_CLEAN variable,
which doesn't match any of the variables understood by the
infrastructure. This commit gets rid of it.

This was noticed while reviewing the packaging of python-dialog.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dialog/dialog.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 06379f2..9846fd3 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -21,9 +21,4 @@ define DIALOG_INSTALL_TARGET_CMDS
 	install -c $(@D)/dialog $(TARGET_DIR)/usr/bin/dialog
 endef
 
-define DIALOG_POST_CLEAN
-	-$(MAKE) -C $(@D) clean
-	rm -f $(TARGET_DIR)/usr/bin/dialog
-endef
-
 $(eval $(autotools-package))
-- 
1.8.1.2
