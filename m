From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 12:01:24 +0200
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.19.16
Message-ID: <20160614100338.C576F80809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=627d8316a8fe97ec9ee2bed2414e20f84962c86a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove fetching upstream patch to fix build with GCC 6 - it's included in the
update.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 3 +--
 package/mpd/mpd.mk   | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index f817a3a..cc2cebc 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  0cb9a223894b038ce966ce6d651d9b3ea3bdc7d7b9bec8d1e9e7e091cbc29b8b  mpd-0.19.15.tar.xz
-sha256  cb9a31889a3d01f373ad154dc4c0d13ca866d69bc02b3acd9f18727a756e78cb  aa5d05eaa4d482aa8f8df954335d0aba151eeff9.patch
+sha256  58ecbff4b07ec42a6f31bdbbb3c3eb51317978e4a0ea3071f6ae6127848a03d6  mpd-0.19.16.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 9b054ff..75f8bb4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).15
+MPD_VERSION = $(MPD_VERSION_MAJOR).16
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
@@ -13,9 +13,6 @@ MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
 
-# Fix GCC 6 issue (https://bugs.musicpd.org/view.php?id=4524)
-MPD_PATCH = https://github.com/MaxKellermann/MPD/commit/aa5d05eaa4d482aa8f8df954335d0aba151eeff9.patch
-
 # Some options need an explicit --disable or --enable
 
 # Zeroconf support depends on libdns_sd from avahi.
