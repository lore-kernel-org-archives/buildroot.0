From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] bmon: use correct way of
	overriding steps
Message-ID: <20100916113828.41BB98AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=166631bdfbd5bc063a88126c5b91227701b48745
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bmon/bmon.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 759b084..5036185 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -10,9 +10,8 @@ BMON_SITE = http://distfiles.gentoo.org/distfiles
 BMON_DEPENDENCIES = ncurses
 BMON_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS,package,bmon))
-
-$(BMON_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define BMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/bmon
-	rm -f $(BMON_TARGET_INSTALL_TARGET) $(BMON_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,bmon))
-- 
1.7.1
