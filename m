From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:18:12 +0200
Subject: [Buildroot] [git commit] package/xkeyboard-config: bump to version
 2.27
Message-ID: <20190714102157.AE38A80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1052b1afb66cf74ee0f76470d440616da0895f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop host-intltool dependency, not needed since
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/commit/e8026f673ec49c109212acc4c35b492b3e30f48f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 6 +-----
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 4 ++--
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 56ea0e5251..dfe4405067 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,7 +1,3 @@
-# From https://lists.x.org/archives/xorg-announce/2018-February/002833.html
-md5 875cbd09ab8394277fd16070326abbae  xkeyboard-config-2.23.1.tar.bz2
-sha1 184c9ce35f4fa44188acbf549f80d36407697ac3  xkeyboard-config-2.23.1.tar.bz2
-sha256 2a4bbc05fea22151b7a7c8ac2655d549aa9b0486bedc7f5a68c72716343b02f3  xkeyboard-config-2.23.1.tar.bz2
-sha512 d651bb89c265e58abe8bba4af6683364a8023cb73af7d00f401f33960e44fa94a7d8a8fdd2483d6703d1c261ca72ae5f2b53f543cfb70b2f571cfe9dcb80c3ba  xkeyboard-config-2.23.1.tar.bz2
 # Locally computed
+sha256 2a4bbc05fea22151b7a7c8ac2655d549aa9b0486bedc7f5a68c72716343b02f3  xkeyboard-config-2.27.tar.bz2
 sha256 6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 9a8838dde1..d1b9586588 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.23.1
+XKEYBOARD_CONFIG_VERSION = 2.27
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
@@ -14,6 +14,6 @@ XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 XKEYBOARD_CONFIG_INSTALL_STAGING = YES
 
 XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
-XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
+XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-xapp_xkbcomp
 
 $(eval $(autotools-package))
