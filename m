From: Sergi Granell <xerpi.g.12@gmail.com>
Date: Fri, 15 Jul 2016 12:50:51 +0200
Subject: [Buildroot] [PATCH] package/weston: Add demo clients install option
Message-ID: <1468579851-415-1-git-send-email-xerpi.g.12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/weston/Config.in | 3 +++
 package/weston/weston.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 0812279..9349317 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -104,4 +104,7 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 comment "XWayland support needs libepoxy and X.org enabled"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
 
+config BR2_PACKAGE_WESTON_DEMO_CLIENTS
+	bool "demo clients"
+
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index dfcb9ac..31c9281 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -142,4 +142,10 @@ else
 WESTON_CONF_OPTS += --disable-junit-xml
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
+WESTON_CONF_OPTS += --enable-demo-clients-install
+else
+WESTON_CONF_OPTS += --disable-demo-clients-install
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
