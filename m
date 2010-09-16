From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] expat: remove useless post
	install stripping hook
Message-ID: <20100916113831.AF58B8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bf65aad5d96cff92aa679e0349ffb52bf6cd1d4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expat/expat.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5b4eb97..5d68e36 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -20,7 +20,3 @@ EXPAT_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,expat))
 $(eval $(call AUTOTARGETS,package,expat,host))
-
-$(EXPAT_HOOK_POST_INSTALL): $(EXPAT_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libexpat.so.*
-	touch $@
-- 
1.7.1
