From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:28:46 +0100
Subject: [Buildroot] [git commit] package/gdk-pixbuf: fix license
Message-ID: <20210129082032.BA92E81530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fe19f1478d9d5c32848b7dfe5b6460e27adbe09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a7b51ed3013c919b293deb95299e33363fb9df70 forgot to update hash of
COPYING which now contains LGPL-2.1+

Here is an extract of
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/0a8882b1a1f5234f7de2177e41f9cb584b6d61f8:

"The vast majority of GdkPixbuf is released under the terms of the GNU
Lesser General Public License, version 2.1 or later.

The following files are released under the terms of the GNU Library
General Public License, version 2 or later:
[...]
The aggregate license of the GdkPixbuf project is the Lesser GPL v2.1 or
later."

Fixes:
 - http://autobuild.buildroot.org/results/292306061216471c258a89e61b54c0d05c757321

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 580cf47602..be7593aebf 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,4 +1,4 @@
 # From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.2.sha256sum
 sha256  83c66a1cfd591d7680c144d2922c5955d38b4db336d7cd3ee109f7bcf9afef15  gdk-pixbuf-2.42.2.tar.xz
 # Locally calculated
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 743ce2caa9..3560734841 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -8,7 +8,7 @@ GDK_PIXBUF_VERSION_MAJOR = 2.42
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
-GDK_PIXBUF_LICENSE = LGPL-2.0+
+GDK_PIXBUF_LICENSE = LGPL-2.1+
 GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_CPE_ID_VENDOR = gnome
 GDK_PIXBUF_INSTALL_STAGING = YES
