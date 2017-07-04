From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:36 +0200
Subject: [Buildroot] [PATCH 056/100] midori: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-57-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in | 1 -
 package/midori/midori.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 840d689..0c7f8ba 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBKITGTK
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Midori is a lightweight web browser based on WebKit
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 395e72e..1755f12 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -22,7 +22,7 @@ MIDORI_DEPENDENCIES = \
 	libxml2 \
 	sqlite \
 	webkitgtk \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 MIDORI_CONF_OPTS = \
-- 
2.9.4
