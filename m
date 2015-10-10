From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:17 +0200
Subject: [Buildroot] [PATCH v3 12/37] package/efl: add libcurl dependency
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-13-git-send-email-romain.naour@openwide.fr>
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
index f8600e4..1e5485f 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
+	select BR2_PACKAGE_LIBCURL # eina_module, runtime dependency
 	select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 2a7083e..32a684f 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -12,7 +12,8 @@ EFL_LICENSE_FILES = COPYING
 
 EFL_INSTALL_STAGING = YES
 
-EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev zlib
+EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg libcurl lua udev \
+	zlib
 
 # regenerate the configure script:
 # https://phab.enlightenment.org/T2718
-- 
2.4.3
