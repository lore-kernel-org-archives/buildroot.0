From: Sven Klomp <mail@klomp.eu>
Date: Thu,  5 Nov 2020 14:11:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/davfs2: add davfs user and group
Message-ID: <20201105131149.1124173-1-mail@klomp.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mount.davfs expects the availability of the user and group davfs.
These are added using

Signed-off-by: Sven Klomp <mail@klomp.eu>
---
 package/davfs2/davfs2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index a73093a52a..4f245423f9 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -18,4 +18,8 @@ DAVFS2_CONF_ENV += \
 	ac_cv_path_NEON_CONFIG=$(STAGING_DIR)/usr/bin/neon-config \
 	LIBS=$(TARGET_NLS_LIBS)
 
+define DAVFS2_USERS
+        davfs2 -1 davfs2 -1 * - - - davfs user
+endef
+
 $(eval $(autotools-package))
-- 
2.29.2
