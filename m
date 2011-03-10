From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 11:36:18 +0100
Subject: [Buildroot] [git commit master 1/1] libpng: remove libpng*-config
	scripts from TARGET_DIR
Message-ID: <20110310111400.DB8FE8FE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ac7dbcf925e084a4c2e1d22d53d5d7bdb829d4d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 699561b..e64989d 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -22,5 +22,14 @@ endef
 
 LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
 
+define LIBPNG_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config \
+		 $(TARGET_DIR)/usr/bin/libpng-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
+endif
+
 $(eval $(call AUTOTARGETS,package,libpng))
 $(eval $(call AUTOTARGETS,package,libpng,host))
-- 
1.7.3.4
