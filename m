From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 16 Mar 2017 23:38:39 +0100
Subject: [Buildroot] [PATCH 1/2] acl: add host variant
Message-ID: <20170316223840.23007-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need host-acl to fix issues with fakeroot.

Unfortunately, all the hacks have to be repeated again.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Andreas Naumann <dev@andin.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/acl/acl.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index cbe5e93961..b38cc4c0c3 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -37,4 +37,13 @@ endef
 
 ACL_POST_INSTALL_STAGING_HOOKS += ACL_FIX_LIBTOOL_LA_LIBDIR
 
+HOST_ACL_DEPENDENCIES = host-attr
+HOST_ACL_CONF_OPTS = --enable-gettext=no
+HOST_ACL_INSTALL_OPTS = \
+	prefix=$(HOST_DIR)/usr \
+	exec_prefix=$(HOST_DIR)/usr \
+	PKG_DEVLIB_DIR=$(HOST_DIR)/usr/lib \
+	install-dev install-lib
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
