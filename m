From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:24 +0200
Subject: [Buildroot] [RFC 14/37] package/efl: add libblkid dependency
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-15-git-send-email-romain.naour@openwide.fr>
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
index 1b26509..9f204d6 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_EFL_RECOMMENDED_CONFIG
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	default y
 	help
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 66914dc..5ee3622 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -40,6 +40,11 @@ else
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
