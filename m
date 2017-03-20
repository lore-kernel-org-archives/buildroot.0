From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Mar 2017 22:36:41 +0200
Subject: [Buildroot] [PATCH] libv4l: drop -lrt workaround
Message-ID: <0adbe5c3ad4320e08603e514825b1222416f1846.1490042201.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libv4l adds the -lrt flag since upstream commit 3dcb945bfcab
("v4l2-compliance: Explicitely link against rt library").

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libv4l/libv4l.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4fec14f3841c..c14bedb7deb8 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -53,8 +53,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
-# clock_gettime is used, which is provided by librt for glibc < 2.17
-LIBV4L_LIBS += -lrt
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 LIBV4L_DEPENDENCIES += gettext
 endif
-- 
2.11.0
