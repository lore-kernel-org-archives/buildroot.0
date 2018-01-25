From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 25 Jan 2018 22:42:02 +0200
Subject: [Buildroot] [PATCH 1/2] webkitgtk: Add missing libtasn1 dependency
Message-ID: <20180125204203.14165-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nowadays libtasn1 is always required and if not present the CMake
configuration step would fail.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index c4437d1584..31794ed2a4 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ebe682ebb6..7b364cf467 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
-	libxml2 libxslt sqlite webp
+	libtasn1 libxml2 libxslt sqlite webp
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_GEOLOCATION=OFF \
-- 
2.16.1
