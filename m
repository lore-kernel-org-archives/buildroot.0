From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] sysvinit: remove unneeded
	dependency on ncurses
Message-ID: <20100825153146.7CDA589018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=311e0a6fc49a2135a3a5e1e63fe8b77c184cb8c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysvinit/Config.in   |    1 -
 package/sysvinit/sysvinit.mk |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 82826dc..34ec391 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
-	select BR2_PACKAGE_NCURSES
 	help
 	  /sbin/init - parent of all processes
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 09aaf74..ef7c713 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -30,7 +30,7 @@ $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY): $(SYSVINIT_DIR)/$(SYSVINIT_BINARY)
 		install -D $(SYSVINIT_DIR)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
 
-sysvinit: ncurses $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY)
+sysvinit: $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY)
 
 sysvinit-source: $(DL_DIR)/$(SYSVINIT_SOURCE)
 
-- 
1.7.1
