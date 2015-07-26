From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 20:58:30 +0200
Subject: [Buildroot] [PATCH 2/4] fbv: remove redundant --static flag to
	pkg-config
In-Reply-To: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1437937112-13269-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
from package .mk files.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/fbv/fbv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 5f7dc8c..d12b9f4 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -18,7 +18,7 @@ FBV_DEPENDENCIES += libpng
 
 # libpng in turn depends on other libraries
 ifeq ($(BR2_STATIC_LIBS),y)
-FBV_CONFIGURE_OPTS += "--libs=`$(PKG_CONFIG_HOST_BINARY) --libs libpng --static`"
+FBV_CONFIGURE_OPTS += "--libs=`$(PKG_CONFIG_HOST_BINARY) --libs libpng`"
 endif
 
 else
-- 
1.8.5.1
