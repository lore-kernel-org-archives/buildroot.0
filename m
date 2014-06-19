From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Thu, 19 Jun 2014 23:42:38 +0200
Subject: [Buildroot] [PATCH v2 3/3] cairo: add freetype dependency for
	freetype support
In-Reply-To: <1403214158-16862-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1403214158-16862-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1403214158-16862-4-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/cairo/cairo.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 789dfa7..263e0e9 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -55,6 +55,13 @@ else
 	CAIRO_CONF_OPT += --disable-directfb
 endif
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+	CAIRO_CONF_OPT += --enable-ft
+	CAIRO_DEPENDENCIES += freetype
+else
+	CAIRO_CONF_OPT += --disable-ft
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 	CAIRO_CONF_OPT += --enable-glesv2
 	CAIRO_DEPENDENCIES += libgles
-- 
2.0.0
