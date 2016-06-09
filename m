From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 16:59:02 +0200
Subject: [Buildroot] [git commit] fetchmail: fix post install target hook
Message-ID: <20160609153406.9144581DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2b66b348afe777384da74b5152668e72436c39d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a typo in commit
a890032596aa5e6afbfdbcccc01fcb07c9a4ef8c ("package/fetchmail: fix *.pyc
compilation with python-3"), the post install target hook was in fact
not registered, and the build failure kept showing up.

This commit fixes the typo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/fetchmail.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 5cae0e2..6aa0a2c 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -30,7 +30,7 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define FETCHMAIL_REMOVE_FETCHMAILCONF_PY
 	$(RM) -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/fetchmailconf.py
 endef
-FETCHMAIL_POST_TARGET_INSTALL_HOOKS += FETCHMAIL_REMOVE_FETCHMAILCONF_PY
+FETCHMAIL_POST_INSTALL_TARGET_HOOKS += FETCHMAIL_REMOVE_FETCHMAILCONF_PY
 endif
 
 $(eval $(autotools-package))
