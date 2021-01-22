From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 09:39:50 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/vlc: security
 bump version to 3.0.12
Message-ID: <20210122083922.13A5F88381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16d1d8f0074c2d9f49a63d6fbcebc32fff3d125b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Removed patch which was applied upstream, removed md5 hash.

Security Bulletin: https://www.videolan.org/security/sb-vlc3012.html
Fixes CVE-2020-26664: https://nvd.nist.gov/vuln/detail/CVE-2020-26664

Added CPE_ID, cpe:2.3:a:videolan:vlc_media_player is a valid CPE
identifier for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Avideolan%3Avlc_media_player&status=FINAL

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit de128d9ad62a96b8497992f439b5eeab4da9efc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 10 ++++------
 package/vlc/vlc.mk   |  4 +++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 7775e449f4..f404cbf335 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.sha256
-sha256  3e94a1acf33445e9da15d528aa48657aa26b912eaa2656b403d43860a8834919  vlc-3.0.11.tar.xz
-# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.sha1
-sha1  66d377a2f24b6b865d5c56530e10d84b8262b46c  vlc-3.0.11.tar.xz
-# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.md5
-md5  7e68f9e2d307eb7cc16e7345cda9e978  vlc-3.0.11.tar.xz
+# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha256
+sha256  eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879  vlc-3.0.12.tar.xz
+# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha1
+sha1  39ef414a07202ec6569acda4c5d91e8576d453bf  vlc-3.0.12.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ccaaa6cd6d..51c92f54c7 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.11
+VLC_VERSION = 3.0.12
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
+VLC_CPE_ID_VENDOR = videolan
+VLC_CPE_ID_NAME = vlc_media_player
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
 
