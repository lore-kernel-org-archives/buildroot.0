From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 28 Jul 2017 07:59:49 -0400
Subject: [Buildroot] [PATCH 1/1] libpng: bump version to 1.6.31
Message-ID: <20170728115949.8204-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sourceforge doesn't host the latest version and doesn't seem
to be updated.  Change the URL to osl.osuosl.org, which does
host the latest version.

While we are at it, add a hash for the License file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpng/libpng.hash | 7 ++++---
 package/libpng/libpng.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 279420a70..65efaa128 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,5 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.29/
-sha1 7dbe6a5088b938545fc0857c507d4e0cf5d9023e  libpng-1.6.29.tar.xz
 # Locally computed:
-sha256 4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239  libpng-1.6.29.tar.xz
+sha256 232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41  libpng-1.6.31.tar.xz
+
+# License file
+sha256 434a58adb33d5a3af601ee74e444eaf4bad89453d55c42965a3270e988d71745  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c82c4efff..d84d4833b 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.29
+LIBPNG_VERSION = 1.6.31
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
-LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
+LIBPNG_SITE = https://ftp-osl.osuosl.org/pub/libpng/src/libpng${LIBPNG_SERIES}
 LIBPNG_LICENSE = Libpng
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
-- 
2.13.3
