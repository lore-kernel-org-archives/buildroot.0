From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Aug 2015 15:04:43 -0300
Subject: [Buildroot] [PATCH] midori: depend on x11 backend for gtk3
Message-ID: <1440525883-29560-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mirror commit ba25711e for midori as well, otherwise gtk3 with non-X11
backends can trigger build failures. Fixes:
http://autobuild.buildroot.net/results/80ffdf54fd675fbff5a645784cd041cdf862154c/
http://autobuild.buildroot.net/results/1c049845ade60de223296c77c8a70869c4db64f0/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/midori/midori.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index ed2cdd8..197f51a 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -37,7 +37,7 @@ ifeq ($(BR2_PACKAGE_MIDORI_HTTPS),y)
 MIDORI_DEPENDENCIES += glib-networking
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 MIDORI_CONF_OPTS += -DUSE_GTK3=ON -DHALF_BRO_INCOM_WEBKIT2=ON
 MIDORI_DEPENDENCIES += libgtk3
 else
-- 
2.4.6
