From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Jan 2016 07:57:46 -0300
Subject: [Buildroot] [PATCH] midori: enable optional gcr support
Message-ID: <1452077866-23181-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only used/useful with the gtk3 backend though.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/midori/midori.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 197f51a..7927400 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -40,6 +40,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 MIDORI_CONF_OPTS += -DUSE_GTK3=ON -DHALF_BRO_INCOM_WEBKIT2=ON
 MIDORI_DEPENDENCIES += libgtk3
+# Only useful with gtk3
+ifeq ($(BR2_PACKAGE_GCR),y)
+MIDORI_DEPENDENCIES += gcr
+endif
 else
 MIDORI_CONF_OPTS += -DUSE_GTK3=OFF
 MIDORI_DEPENDENCIES += libgtk2
-- 
2.4.10
