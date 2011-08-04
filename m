From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Aug 2011 21:22:19 +0200
Subject: [Buildroot] [git commit] orc: target install: cleanup unused files
Message-ID: <20110804192914.17A358B73C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fc57b341d9e3ce65d6df4e3ec14d87eb2ff361be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

orcc is only needed when developing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/orc/orc.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index f89d5cf..37b6e99 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -7,4 +7,18 @@ ORC_VERSION = 0.4.14
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_INSTALL_STAGING = YES
 
+define ORC_REMOVE_BUGREPORT
+	rm -f $(TARGET_DIR)/usr/bin/orc-bugreport
+endef
+
+define ORC_REMOVE_DEVFILES
+	rm -f $(TARGET_DIR)/usr/bin/orcc
+endef
+
+ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_BUGREPORT
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
+endif
+
 $(eval $(call AUTOTARGETS,package,orc))
-- 
1.7.3.4
