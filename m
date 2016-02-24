From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 24 Feb 2016 11:26:29 -0300
Subject: [Buildroot] [PATCH v2 1/4] attr: add host variant
In-Reply-To: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1456323992-27845-2-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

This is required for host-libcap for extended attributes support, which
leads to capabilities support as well.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.4.10
