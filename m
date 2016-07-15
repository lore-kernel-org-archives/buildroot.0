From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:37:04 +0200
Subject: [Buildroot] [git commit] package/weston: Add demo clients install
	option
Message-ID: <20160715173708.CA25B82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c7e22c7994c99dbdc45bf6fcf17f457bea1bbdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergi Granell <xerpi.g.12@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/Config.in | 5 +++++
 package/weston/weston.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 0812279..c1eb7da 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -104,4 +104,9 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 comment "XWayland support needs libepoxy and X.org enabled"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
 
+config BR2_PACKAGE_WESTON_DEMO_CLIENTS
+	bool "demo clients"
+	help
+	  This enables the installation of Weston's demo clients.
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
