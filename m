From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:22:48 +0100
Subject: [Buildroot] [PATCH 4/6] libpng: remove libpng*-config scripts from
	TARGET_DIR
In-Reply-To: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ac7dbcf925e084a4c2e1d22d53d5d7bdb829d4d6.1299532965.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
