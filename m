From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  2 Dec 2013 09:00:03 +0100
Subject: [Buildroot] [PATCH 2/2] package: unification of name
	<pkg>_VERSION_MINOR variable
In-Reply-To: <1385971203-11645-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1385971203-11645-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1385971203-11645-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently there are two different names of the minor version variable:
<PKG>_MINOR_VERSION and <PKG>_VERSION_MINOR
This patch unifies them to <PKG>_VERSION_MINOR

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/glib-networking/glib-networking.mk |    4 ++--
 package/json-glib/json-glib.mk             |    4 ++--
 package/libsoup/libsoup.mk                 |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index aa84d79..405fbc2 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 GLIB_NETWORKING_VERSION_MAJOR = 2.36
-GLIB_NETWORKING_MINOR_VERSION = 2
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).$(GLIB_NETWORKING_MINOR_VERSION)
+GLIB_NETWORKING_VERSION_MINOR = 2
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).$(GLIB_NETWORKING_VERSION_MINOR)
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 65425bd..f0f4397 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 JSON_GLIB_VERSION_MAJOR = 0.14
-JSON_GLIB_MINOR_VERSION = 2
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).$(JSON_GLIB_MINOR_VERSION)
+JSON_GLIB_VERSION_MINOR = 2
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).$(JSON_GLIB_VERSION_MINOR)
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPLv2.1+
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index c94eb06..e618ffe 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.43
-LIBSOUP_MINOR_VERSION = 1
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).$(LIBSOUP_MINOR_VERSION)
+LIBSOUP_VERSION_MINOR = 1
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).$(LIBSOUP_VERSION_MINOR)
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
-- 
1.7.9.5
