From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 15 Jan 2019 07:59:32 -0600
Subject: [Buildroot] [PATCH] package/glib-networking: bump to 2.58.0
Message-ID: <1547560772-53599-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 2.56.1 (when tested in a namespace sandbox that restricted what
the build could see on the host system), it was discovered that the
glib-networking build would check in /etc for the Certificate Authority
files. The newer version of this package no longer tests the build time
location of the Certificate Authority and resolves these build failures.

Fixes:
http://autobuild.buildroot.net/results/8f8/8f83be0c21c21c07d5a7330f3626b739b1970625
(and others http://autobuild.buildroot.net/?reason=glib-networking-2.56.1)

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/glib-networking/glib-networking.hash | 6 +++---
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 59e3fa4..d959175 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.56/glib-networking-2.56.1.sha256sum
-sha256	df47b0e0a037d2dcf6b1846cbdf68dd4b3cc055e026bb40c4a55f19f29f635c8	glib-networking-2.56.1.tar.xz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.58/glib-networking-2.58.0.sha256sum
+sha256  bdfa0255e031b8ee003cc283002536b77ee76450105f1dc6ab066b9bf4330068 glib-networking-2.58.0.tar.xz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 2852f90..325cbcf 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.56
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
+GLIB_NETWORKING_VERSION_MAJOR = 2.58
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
-- 
1.9.1
