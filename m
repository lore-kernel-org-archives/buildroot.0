From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:38:10 +0200
Subject: [Buildroot] [git commit] libsoup: security bump to version 2.62.3
Message-ID: <20180907111604.87C0A7FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91d65f300016517eee95cc7f0bdf719a124a2af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-12910: The get_cookies function in soup-cookie-jar.c in
libsoup 2.63.2 allows attackers to have unspecified impact via an empty
hostname.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 6e1ff428af..666bbc278b 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.56/libsoup-2.56.1.sha256sum
-sha256	c32a46d77b4da433b51d8fd09a57a44b198e03bdc93e5219afcc687c7948eac3  libsoup-2.56.1.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.62/libsoup-2.62.3.sha256sum
+sha256	d312ade547495c2093ff8bda61f9b9727a98cfdae339f3263277dd39c0451172  libsoup-2.62.3.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index a3ce686aa7..95bd682010 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.56
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
+LIBSOUP_VERSION_MAJOR = 2.62
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).3
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
