From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:22:49 +0200
Subject: [Buildroot] [git commit] package/aubio: bump to version 0.4.5
Message-ID: <20170504212253.3A91982306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8c044e1bd788d18410b981ff08635c4b2b9de4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since aubio 0.4.4, the libsamplerate support require fftw
single precision mode [1].

[1] https://github.com/aubio/aubio/commit/8be88e77f5c275fdf4efc99ae182d14940948786

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aubio/aubio.hash | 4 ++--
 package/aubio/aubio.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index e447847..b4233ae 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,2 +1,2 @@
-# From https://aubio.org/pub/aubio-0.4.3.tar.bz2.sha256
-sha256 b62cdb073c0c64ae301917fa162969d42cba45e478bdf1e74490bd87e9cceaab  aubio-0.4.3.tar.bz2
+# From https://aubio.org/pub/aubio-0.4.5.tar.bz2.sha256
+sha256 70c2804e6f4fbf0ebc0fb9ac8cc9d465ef4a4d438311c074c9a7364e98827af6  aubio-0.4.5.tar.bz2
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index f8be19f..2a09ebb 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUBIO_VERSION = 0.4.3
+AUBIO_VERSION = 0.4.5
 AUBIO_SITE = https://aubio.org/pub
 AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
 AUBIO_LICENSE = GPL-3.0+
@@ -26,7 +26,8 @@ else
 AUBIO_CONF_OPTS += --disable-sndfile
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+# Could not compile aubio in double precision mode with libsamplerate
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)
 AUBIO_DEPENDENCIES += libsamplerate
 AUBIO_CONF_OPTS += --enable-samplerate
 else
