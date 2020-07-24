From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:26:00 -0700
Subject: [Buildroot] [PATCH v2 12/13] package/udisks/udisks.mk: alphabatize
 dependencies
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-13-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch makes the upcoming udisk2 version bump patch easier to read,
and also fixes the udisks.mk, so it follows Buildroot's package guidelines.

Host packages are placed on top of the dependency list, followed by target
dependencies.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/udisks/udisks.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index fe8932a92e..c6119a8b80 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -12,16 +12,16 @@ UDISKS_LICENSE_FILES = COPYING
 UDISKS_AUTORECONF = YES
 
 UDISKS_DEPENDENCIES = \
-	sg3_utils \
 	host-pkgconf \
-	udev \
 	dbus \
 	dbus-glib \
-	polkit \
-	parted \
-	lvm2 \
 	libatasmart \
-	libgudev
+	libgudev \
+	lvm2 \
+	parted \
+	polkit \
+	sg3_utils \
+	udev
 
 UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
 
-- 
2.26.2
