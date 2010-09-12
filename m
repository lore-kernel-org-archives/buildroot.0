From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:44 +0200
Subject: [Buildroot] [PATCH 58/74] expat: remove useless post install
	stripping hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bf65aad5d96cff92aa679e0349ffb52bf6cd1d4c.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
