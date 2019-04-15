From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 15 Apr 2019 14:03:50 -0400
Subject: [Buildroot] [PATCH v2 1/2] package/pkgconf: bump to version 1.6.1
Message-ID: <20190415180351.67142-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Add a hash for the license file.

Tested against:
  - libsoup
  - X11r7
  - dbus-glib
  - atk

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
v1 -> v2:
  - Clean up commit message (Thomas)
  - Use the original URL as the https certificate is now fixed.
  - Remove AUTORECONF = YES because the https certificate is now fixed.

 package/pkgconf/pkgconf.hash | 3 ++-
 package/pkgconf/pkgconf.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
index 7ea7ff57a8..45848af943 100644
--- a/package/pkgconf/pkgconf.hash
+++ b/package/pkgconf/pkgconf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	d3468308553c94389dadfd10c4d1067269052b5364276a9d24a643c88485f715	pkgconf-1.5.3.tar.xz
+sha256	22b9ee38438901f9d60f180e5182821180854fa738fd071f593ea26a81da208c	pkgconf-1.6.1.tar.xz
+sha256	07ee94b50a41ee3fc4e13a9b9c60b26fc28488494c465639f7e5f07a3952ec04	COPYING
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index e3c73fd405..1851ecfca4 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKGCONF_VERSION = 1.5.3
+PKGCONF_VERSION = 1.6.1
 PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
-- 
2.20.1
