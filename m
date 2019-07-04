From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jul 2019 08:25:40 +0200
Subject: [Buildroot] [git commit] package/libsecret: fix build with NLS
Message-ID: <20190704062422.8FCA0817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bd1574aefb877e415e4a496d5c0394bad9759f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/1497d7c2485c4a107ab82c870d78744981efb6d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsecret/libsecret.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index adc7c508df..f5879fbf4e 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -9,7 +9,8 @@ LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).6
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
-LIBSECRET_DEPENDENCIES = libglib2 host-intltool
+LIBSECRET_DEPENDENCIES = libglib2 host-intltool $(TARGET_NLS_DEPENDENCIES)
+LIBSECRET_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 LIBSECRET_CONF_OPTS = \
 	--disable-manpages \
 	--disable-strict \
