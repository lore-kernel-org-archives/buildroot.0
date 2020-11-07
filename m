From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Nov 2020 16:55:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/davfs2: fix indent
Message-ID: <20201107155540.427974-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following check-package warning added by commit
a2b98a6add92e38dbcd4ca9fda25454a38c719e3:

package/davfs2/davfs2.mk:22: expected indent with tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davfs2/davfs2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index bc2aa79646..1099f1b13b 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -19,7 +19,7 @@ DAVFS2_CONF_ENV += \
 	LIBS=$(TARGET_NLS_LIBS)
 
 define DAVFS2_USERS
-        davfs2 -1 davfs2 -1 * - - - davfs user
+	davfs2 -1 davfs2 -1 * - - - davfs user
 endef
 
 $(eval $(autotools-package))
-- 
2.28.0
