From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:56:48 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/gdk-pixbuf:
 security bump to version 2.36.12
Message-ID: <20200828155322.3696086539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e79aed0f64ba042ea17a5771366c3ea0fdaded25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

- Fix CVE-2017-6312: Integer overflow in io-ico.c in gdk-pixbuf allows
  context-dependent attackers to cause a denial of service (segmentation
  fault and application crash) via a crafted image entry offset in an
  ICO file, which triggers an out-of-bounds read, related to compiler
  optimizations.
- Fix CVE-2017-6313: Integer underflow in the load_resources function in
  io-icns.c in gdk-pixbuf allows context-dependent attackers to cause a
  denial of service (out-of-bounds read and program crash) via a crafted
  image entry size in an ICO file.
- Fix CVE-2017-6314: The make_available_at_least function in io-tiff.c
  in gdk-pixbuf allows context-dependent attackers to cause a denial of
  service (infinite loop) via a large TIFF file.

Also update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4559143324412903ed5dd73a5de20cb4d280397)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 6 +++---
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 9cb947f195..8fa178b55c 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.10.sha256sum
-sha256 f8f6fa896b89475c73b6e9e8d2a2b062fc359c4b4ccb8e96470d6ab5da949ace  gdk-pixbuf-2.36.10.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.12.sha256sum
+sha256  fff85cf48223ab60e3c3c8318e2087131b590fd6f1737e42cb3759a3b427a334  gdk-pixbuf-2.36.12.tar.xz
 # Locally calculated
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index b7937a48e9..0266e04978 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).10
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).12
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.0+
