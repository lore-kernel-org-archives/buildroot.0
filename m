From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 23:39:48 +0100
Subject: [Buildroot] [git commit] dialog: remove useless POST_CLEAN command
Message-ID: <20131208224038.2B92F9BD7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66eecfa7bd2b6f6877c1c5df8635ca13e2866db7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, the dialog package has a DIALOG_POST_CLEAN variable,
which doesn't match any of the variables understood by the
infrastructure. This commit gets rid of it.

This was noticed while reviewing the packaging of python-dialog.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dialog/dialog.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

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
