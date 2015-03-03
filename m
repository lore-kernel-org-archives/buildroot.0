From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:13 +0100
Subject: [Buildroot] [RFC v3 08/30] fbv: use TARGET_LDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-9-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/fbv/fbv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 8788b0e..d46bcac 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -12,7 +12,7 @@ FBV_LICENSE_FILES = COPYING
 
 ### image format dependencies and configure options
 FBV_DEPENDENCIES = # empty
-FBV_CONFIGURE_OPTS = # empty
+FBV_CONFIGURE_OPTS = --libs="$(TARGET_LDFLAGS)"
 ifeq ($(BR2_PACKAGE_FBV_PNG),y)
 FBV_DEPENDENCIES += libpng
 
-- 
2.3.1
