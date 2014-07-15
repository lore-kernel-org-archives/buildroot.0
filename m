From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:19:42 +0200
Subject: [Buildroot] [git commit] cairo: add freetype and gobject support
Message-ID: <20140715212002.ECDEF9D24C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1612fd39e11556f2f672f2f0e8444b025c56e2d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 789dfa7..a4c71b6 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -55,6 +55,20 @@ else
 	CAIRO_CONF_OPT += --disable-directfb
 endif
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+	CAIRO_CONF_OPT += --enable-ft
+	CAIRO_DEPENDENCIES += freetype
+else
+	CAIRO_CONF_OPT += --disable-ft
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+	CAIRO_CONF_OPT += --enable-gobject
+	CAIRO_DEPENDENCIES += libglib2
+else
+	CAIRO_CONF_OPT += --disable-gobject
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 	CAIRO_CONF_OPT += --enable-glesv2
 	CAIRO_DEPENDENCIES += libgles
