From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:28 +0200
Subject: [Buildroot] [PATCH 05/12 v8] package/eudev: libgudev is no longer
	provided by eudev
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <a29ab343be244bbe3a7d1b12c63486ea7f64784d.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgudev is now provided by the the eponym package libgudev.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/eudev.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 0fe96e8..6c61660 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -42,13 +42,6 @@ else
 EUDEV_CONF_OPTS += --disable-hwdb
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-EUDEV_CONF_OPTS += --enable-gudev
-EUDEV_DEPENDENCIES += libglib2
-else
-EUDEV_CONF_OPTS += --disable-gudev
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 EUDEV_CONF_OPTS += --enable-selinux
 EUDEV_DEPENDENCIES += libselinux
-- 
2.7.4
