From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue,  8 Jul 2014 15:57:06 +0200
Subject: [Buildroot] [RFC 3/9] cairo: add freetype and gobject support
In-Reply-To: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1404827832-1101-4-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/cairo/cairo.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

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
-- 
2.0.1
