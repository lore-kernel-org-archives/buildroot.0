From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:12 +0200
Subject: [Buildroot] [PATCH 20/20] sysvinit: remove unneeded dependency on
	ncurses
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <360fdc975894067c0b2e73f6741b11946be5219d.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
