From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Jul 2019 08:22:33 +0200
Subject: [Buildroot] [git commit] package/libsecret: bump to version 0.18.8
Message-ID: <20190705062454.8A719813A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4e63afe2fccabc73ea72c564769cf1a8fd3217e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-intltool is not needed since version 0.18.7 and
https://github.com/GNOME/libsecret/commit/f25420d5aadc1449f78c9293d0b1ddf16f5d2eba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsecret/libsecret.hash | 4 ++--
 package/libsecret/libsecret.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index 808b1741f3..00fdfd06f6 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.6.sha256sum
-sha256	5efbc890ba41a323ffe0599cd260fd12bd8eb62a04aa1bd1b2762575d253d66f	libsecret-0.18.6.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.8.sha256sum
+sha256	3bfa889d260e0dbabcf5b9967f2aae12edcd2ddc9adc365de7a5cc840c311d15	libsecret-0.18.8.tar.xz
 
 # Hash for license file:
 sha256	a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b	COPYING
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index f5879fbf4e..c699e16d99 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 LIBSECRET_VERSION_MAJOR = 0.18
-LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).6
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).8
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
-LIBSECRET_DEPENDENCIES = libglib2 host-intltool $(TARGET_NLS_DEPENDENCIES)
+LIBSECRET_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
 LIBSECRET_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 LIBSECRET_CONF_OPTS = \
 	--disable-manpages \
