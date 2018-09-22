From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 23 Sep 2018 02:53:30 +0300
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <20180922235333.85642-1-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
Message-ID: <20180922235333.85642-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The woff2 dependency is used to support Web fonts in WOFF2 format.
This is a Web-facing feature that Web sites expect WebKit to support,
and it is recommended to be unconditionally enabled. While it is
possible to disable the feature at build time, upstream only recommends
doing so if the target system cannot provide a woff2 package.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index df2aeef3d9..96a7ab0c94 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WOFF2
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index eccd9bbae5..f28417ac73 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
-	libtasn1 libxml2 libxslt sqlite webp
+	libtasn1 libxml2 libxslt sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_GEOLOCATION=OFF \
@@ -22,6 +22,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
+	-DENABLE_WOFF2=ON \
 	-DPORT=GTK \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF
-- 
2.19.0
