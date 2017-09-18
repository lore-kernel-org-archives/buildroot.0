From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Sep 2017 09:44:31 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libsoup: security bump to
	version 2.56.1
Message-ID: <20170918074221.B692D8103E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3284e172f40b9c82e4b19fa4513793a4728ab9cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-2885: stack based buffer overflow with HTTP Chunked Encoding

For more details, see
https://bugzilla.gnome.org/show_bug.cgi?id=785774

While we're at it, add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0f5398f0e61992bd836474b7350c16f00459d0a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoup/libsoup.hash | 6 ++++--
 package/libsoup/libsoup.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index b42cf2f..6e1ff42 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,2 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.56/libsoup-2.56.0.sha256sum
-sha256	d8216b71de8247bc6f274ec054c08547b2e04369c1f8add713e9350c8ef81fe5	libsoup-2.56.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.56/libsoup-2.56.1.sha256sum
+sha256	c32a46d77b4da433b51d8fd09a57a44b198e03bdc93e5219afcc687c7948eac3  libsoup-2.56.1.tar.xz
+# Locally calculated
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index f6e92f8..6eed005 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.56
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
