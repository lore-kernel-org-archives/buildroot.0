From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:57:18 +0200
Subject: [Buildroot] [PATCH] package/libxml2: remove helper script from
 target
Message-ID: <20200605225719.13836-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/libxml2/libxml2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index ea6a8c1f6d..a0efe041a5 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -49,6 +49,12 @@ else
 LIBXML2_CONF_OPTS += --without-iconv
 endif
 
+define LIBXML2_INSTALL_TARGET_POST
+	rm -f $(TARGET_DIR)/usr/lib/xml2Conf.sh
+endef
+
+LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_INSTALL_TARGET_POST
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
2.26.2
