From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun, 26 Dec 2010 10:45:37 -0600
Subject: [Buildroot] [PATCH] jpeg: don't add prefix to binaries
Message-ID: <5898a721f72fb7143c3d747bc451dacc6eaad4f7.1293381926.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/jpeg/jpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 6dd4334..6baa64b 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -9,6 +9,7 @@ JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
 JPEG_INSTALL_TARGET = YES
 JPEG_LIBTOOL_PATCH = NO
+JPEG_CONF_OPT = --program-prefix=
 
 define JPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
-- 
1.7.3.2
