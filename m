From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 13:08:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/libpciaccess: Add optional support
	for zlib
In-Reply-To: <1413716896-15085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413716896-15085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413716896-15085-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/libpciaccess.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 010707e..f27925d 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -11,4 +11,11 @@ LIBPCIACCESS_LICENSE = MIT
 LIBPCIACCESS_LICENSE_FILES = COPYING
 LIBPCIACCESS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBPCIACCESS_CONF_OPTS += --with-zlib
+LIBPCIACCESS_DEPENDENCIES += zlib
+else
+LIBPCIACCESS_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
