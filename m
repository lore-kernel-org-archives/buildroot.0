From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Oct 2017 14:18:58 +0200
Subject: [Buildroot] [PATCH] wget: add optional zlib support
Message-ID: <20171027121858.9638-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 4cb48dce67..6a356c2c2f 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -30,4 +30,11 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 WGET_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WGET_CONF_OPTS += --with-zlib
+WGET_DEPENDENCIES += zlib
+else
+WGET_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
