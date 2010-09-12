From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:54 +0200
Subject: [Buildroot] [PATCH 08/74] taglib: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e3077bc8225ef10361f1b81b93d3eafc35bd2e55.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/taglib/taglib.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/taglib/taglib.mk b/package/multimedia/taglib/taglib.mk
index 2620b97..e5433a4 100644
--- a/package/multimedia/taglib/taglib.mk
+++ b/package/multimedia/taglib/taglib.mk
@@ -16,10 +16,12 @@ TAGLIB_CONF_ENV = \
 
 TAGLIB_CONF_OPT = --disable-libsuffix --program-prefix=''
 
-$(eval $(call AUTOTARGETS,package/multimedia,taglib))
+define TAGLIB_REMOVE_DEVFILE
+	rm -f $(TARGET_DIR)/usr/bin/taglib-config
+endef
 
 ifneq ($(BR2_HAVE_DEVFILES),y)
-$(TAGLIB_HOOK_POST_INSTALL):
-	rm -f $(TARGET_DIR)/usr/bin/taglib-config
-	touch $@
+TAGLIB_POST_INSTALL_TARGET_HOOKS += TAGLIB_REMOVE_DEVFILE
 endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,taglib))
-- 
1.7.0.4
