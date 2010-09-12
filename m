From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:59 +0200
Subject: [Buildroot] [PATCH 73/74] which: remove useless stripping
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <240fa521cfc3fc297e58b8aa9f3d02b86a7be053.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/which/which.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/which/which.mk b/package/which/which.mk
index 0eb9d58..3bdfaca 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -11,7 +11,3 @@ WHICH_INSTALL_STAGING:=NO
 WHICH_INSTALL_TARGET:=YES
 
 $(eval $(call AUTOTARGETS,package,which))
-
-$(WHICH_HOOK_POST_INSTALL): $(WHICH_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/which
-	touch $@
-- 
1.7.0.4
