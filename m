From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:19:49 +0200
Subject: [Buildroot] [PACH v2 15/38] package/efl: add libblkid dependency
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1441747212-27421-16-git-send-email-romain.naour@openwide.fr>
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
index d12b499..eb15e98 100644
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
index 4543ce0..c28fe06 100644
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
