From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 22:37:50 +0200
Subject: [Buildroot] [git commit] package/glib-networking: security bump to
 version 2.62.4
Message-ID: <20200601203817.3B9CB814C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f3d361f5ccbb43270f9e69bf6ac472698d3722e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2020-13645: In GNOME glib-networking through 2.64.2, the
  implementation of GTlsClientConnection skips hostname verification of
  the server's TLS certificate if the application fails to specify the
  expected server identity. This is in contrast to its intended
  documented behavior, to fail the certificate verification.
  Applications that fail to provide the server identity, including Balsa
  before 2.5.11 and 2.6.x before 2.6.1, accept a TLS certificate if the
  certificate is valid for any host.
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: bump to 2.62.4 rather than 2.64.3]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glib-networking/glib-networking.hash | 6 +++---
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 061b7af695..88649d842f 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.61/glib-networking-2.61.1.sha256sum
-sha256  a3acbe8953ba80e408bdc4a3e8c240fd9447181c7e800a175c3105604c38bad5 glib-networking-2.61.1.tar.xz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.62/glib-networking-2.62.4.sha256sum
+sha256  c18f289eec480fdce12044c0a06f77521edf9f460d16ad4213de61f2a3b294cf  glib-networking-2.62.4.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 39133371f5..e1d4823adc 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.61
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
+GLIB_NETWORKING_VERSION_MAJOR = 2.62
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).4
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
