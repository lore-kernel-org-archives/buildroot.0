From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 22 May 2017 14:40:14 +0100
Subject: [Buildroot] [PATCH next 1/2] lvm2: add host package
Message-ID: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9a422feda..6cb351c47 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -47,4 +47,7 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
 
+HOST_LVM2_INSTALL_OPTS = DESTDIR=$(HOST_DIR) install
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.13.0
