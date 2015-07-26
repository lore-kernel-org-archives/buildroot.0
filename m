From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:23 +0200
Subject: [Buildroot] [RFC 13/37] package/efl: add libcurl dependency
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-14-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 1 +
 package/efl/efl.mk    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index f24351a..1b26509 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
+	select BR2_PACKAGE_LIBCURL # eina_module, runtime dependency
 	select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 400afc8..66914dc 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -12,7 +12,8 @@ EFL_LICENSE_FILES = COPYING
 
 EFL_INSTALL_STAGING = YES
 
-EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev zlib
+EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg libcurl lua udev \
+	zlib
 
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
-- 
2.4.3
