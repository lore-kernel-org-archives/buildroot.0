From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:24:48 +0200
Subject: [Buildroot] [git commit] package/wayland: switch to https
Message-ID: <20200610212348.0524B8232C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ce6ebfad684d6b98dc87bbd67ccceef29b4db51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--2020-06-07 20:39:28--  http://wayland.freedesktop.org/releases/wayland-1.18.0.tar.xz
Resolving wayland.freedesktop.org (wayland.freedesktop.org)... 35.227.58.183
Connecting to wayland.freedesktop.org (wayland.freedesktop.org)|35.227.58.183|:80... connected.
HTTP request sent, awaiting response... 308 Permanent Redirect
2020-06-07 20:39:29 ERROR 308: Permanent Redirect.

Fixes:
 - http://autobuild.buildroot.org/results/f3af97ad46830568ee3ad710fe45329f7626c27b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland/Config.in  | 2 +-
 package/wayland/wayland.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index 32718fc2b2..c22d9c7ef5 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_WAYLAND
 	  to talk to its clients as well as a library implementation
 	  of the protocol.
 
-	  http://wayland.freedesktop.org/
+	  https://wayland.freedesktop.org/
 
 comment "wayland needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index a3031bafa8..1b19272715 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WAYLAND_VERSION = 1.18.0
-WAYLAND_SITE = http://wayland.freedesktop.org/releases
+WAYLAND_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
