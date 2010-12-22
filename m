From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 18:25:24 +0100
Subject: [Buildroot] [PATCH 5/7] libpng: remove libpng*-config scripts from
	TARGET_DIR
In-Reply-To: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6ccd12874e5df9dbf0258efc63bd3b9e9c3751aa.1293038710.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 82b88da..d655199 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -23,5 +23,12 @@ endef
 
 LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
 
+define LIBPNG_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config \
+		 $(TARGET_DIR)/usr/bin/libpng-config
+endef
+
+LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
+
 $(eval $(call AUTOTARGETS,package,libpng))
 $(eval $(call AUTOTARGETS,package,libpng,host))
-- 
1.7.0.4
