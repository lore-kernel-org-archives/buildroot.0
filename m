From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:16:38 +0200
Subject: [Buildroot] [git commit] package/libxml2: remove helper script from
 target
Message-ID: <20200606201558.A000183D45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89a0b73aed88990b81ce67d65bc03cdd046558e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml2/libxml2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index ea6a8c1f6d..acbdfb7728 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -49,6 +49,11 @@ else
 LIBXML2_CONF_OPTS += --without-iconv
 endif
 
+define LIBXML2_CLEANUP_XML2CONF
+	rm -f $(TARGET_DIR)/usr/lib/xml2Conf.sh
+endef
+LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_CLEANUP_XML2CONF
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
