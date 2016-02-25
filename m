From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:24:14 +0100
Subject: [Buildroot] [git commit] attr: add host variant
Message-ID: <20160302202758.0D8937FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc739517e7b4f48e25354fc7c769a11c6d30e2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required for host-libcap for extended attributes support, which
leads to capabilities support as well.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/attr/attr.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index a66891b..e9963ba 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -26,6 +26,11 @@ ATTR_INSTALL_TARGET_OPTS = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
+HOST_ATTR_INSTALL_OPTS = \
+	prefix=$(HOST_DIR)/usr \
+	exec_prefix=$(HOST_DIR)/usr \
+	install-dev install-lib
+
 # The libdir variable in libattr.la is empty, so let's fix it. This is
 # probably due to attr not using automake, and not doing fully the
 # right thing with libtool.
@@ -37,3 +42,4 @@ endef
 ATTR_POST_INSTALL_STAGING_HOOKS += ATTR_FIX_LIBTOOL_LA_LIBDIR
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
