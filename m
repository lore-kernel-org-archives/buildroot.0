From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:15:18 +0200
Subject: [Buildroot] [git commit] package/udisks/udisks.mk: fix alphabetic
 ordering of dependencies
Message-ID: <20200902161639.AC0CF85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ec86b7440f8cc4070282d0c4091caba145d775f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes the upcoming udisks2 version bump patch easier to
read, and also fixes the udisks.mk, so it follows Buildroot's package
guidelines.

Host packages are placed on top of the dependency list, followed by
target dependencies.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
