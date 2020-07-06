From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jul 2020 09:16:30 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libxml2: remove
 helper script from target
Message-ID: <20200712201453.2782185B06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a3c50ebf47daa300206888e64e9c5c23e667c33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 89a0b73aed88990b81ce67d65bc03cdd046558e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
