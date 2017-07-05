From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  5 Jul 2017 22:46:53 +0300
Subject: [Buildroot] [PATCH 1/1] webkitgtk: select libgcrypt
In-Reply-To: <20170705194653.19890-1-aperez@igalia.com>
References: <20170705194653.19890-1-aperez@igalia.com>
Message-ID: <20170705194653.19890-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libgrcrypt is a direct dependency of WebKitGTK+, and as such it
should be selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 0754fe5123..47672045d9 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index cc8d960e47..ef20839f92 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -13,7 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
-	enchant harfbuzz icu jpeg libgtk3 libsecret libsoup \
+	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libxml2 libxslt sqlite webp
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
-- 
2.13.2
