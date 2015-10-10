From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:18 +0200
Subject: [Buildroot] [PATCH v3 13/37] package/efl: add libblkid dependency
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-14-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 1 +
 package/efl/efl.mk    | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1e5485f..aec02d0 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_EFL_RECOMMENDED_CONFIG
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	default y
 	help
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 32a684f..c30ce5d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -45,6 +45,11 @@ else
 EFL_CONF_OPTS += --disable-libmount
 endif
 
+# libblkid is part of required tools, see EFL's README.
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+EFL_DEPENDENCIES += util-linux
+endif
+
 # If fontconfig is disabled, this is going to make general font
 # searching not work, and only some very direct 'load /path/file.ttf'
 # will work alongside some old-school ttf file path searching. This
-- 
2.4.3
