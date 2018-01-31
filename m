From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:47:43 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] webkitgtk: Add missing
 libtasn1 dependency
Message-ID: <20180131123645.5EF7888170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03c1972f7366a29b38dd3e65d0a0bf498915c9dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Nowadays libtasn1 is always required and if not present the CMake
configuration step would fail.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d052ed473dfbee1eabe9eca1185cea5d3e743b9f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bfe344419b..93f286bb39 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index d15382c0c5..2513963a90 100644
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
