From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:25 +0200
Subject: [Buildroot] [PATCH v4 09/35] package/efl/libefl: add libblkid
	dependency
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-10-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

util-linux libblkid is listed as an dependency in the README:
https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n478

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename to libefl
---
 package/efl/libefl/Config.in | 1 +
 package/efl/libefl/libefl.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 29aef05..5c65744 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	default y
 	help
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index b26f848..c7ecf51 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -46,6 +46,11 @@ else
 LIBEFL_CONF_OPTS += --disable-libmount
 endif
 
+# libblkid is part of required tools, see EFL's README.
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+LIBEFL_DEPENDENCIES += util-linux
+endif
+
 # If fontconfig is disabled, this is going to make general font
 # searching not work, and only some very direct 'load /path/file.ttf'
 # will work alongside some old-school ttf file path searching. This
-- 
2.4.3
