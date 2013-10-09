From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:07:16 +0200
Subject: [Buildroot] [git commit] package/weston: requires host-pkgconf
Message-ID: <20131009210741.7A5F29B9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17a32d31cf7fdebe2656793302cbf65c91545200
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

weston's configure.ac uses PKG_CHECK_MODULES,
so it needs to depend on host-pkgconf.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5d2c829..38647bd 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,7 @@ WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-WESTON_DEPENDENCIES = wayland libxkbcommon pixman libpng \
+WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
 WESTON_CONF_OPT = \
 	--disable-egl \
