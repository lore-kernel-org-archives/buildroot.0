From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:11 +0100
Subject: [Buildroot] [RFC v3 06/30] openswan: set LDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-7-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/openswan/openswan.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index ba36f7c..79f1409 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -12,7 +12,8 @@ OPENSWAN_LICENSE_FILES = COPYING LICENSE
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
 OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
 	USERCOMPILE="$(TARGET_CFLAGS) -fPIE" INC_USRLOCAL=/usr \
-	USE_KLIPS=false USE_MAST=false USE_NM=false
+	USE_KLIPS=false USE_MAST=false USE_NM=false \
+	LDFLAGS="$(TARGET_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 	OPENSWAN_DEPENDENCIES += libcurl
-- 
2.3.1
