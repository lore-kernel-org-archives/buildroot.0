From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Apr 2017 23:11:57 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libsamplerate: security
	bump to version 0.1.9
Message-ID: <20170425211748.A83318275B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35f735cd5a2f23d297f1b6d9f09bf4273104a082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

libsamplerate is relicensed under the 2 clause BSD license.

Fixes CVE-2017-7697 - In libsamplerate before 0.1.9, a buffer over-read
occurs in the calc_output_single function in src_sinc.c via a crafted audio
file.

For more details, see:
https://blogs.gentoo.org/ago/2017/04/11/libsamplerate-global-buffer-overflow-in-calc_output_single-src_sinc-c/

[Peter: add CVE info]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bcdaf4ca8482f0ecb02ee828ce0d3b16f724e9eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsamplerate/libsamplerate.hash | 2 +-
 package/libsamplerate/libsamplerate.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsamplerate/libsamplerate.hash b/package/libsamplerate/libsamplerate.hash
index a495108..a303f0b 100644
--- a/package/libsamplerate/libsamplerate.hash
+++ b/package/libsamplerate/libsamplerate.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06	libsamplerate-0.1.8.tar.gz
+sha256  0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1  libsamplerate-0.1.9.tar.gz
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 28fd644..802b5b1 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSAMPLERATE_VERSION = 0.1.8
+LIBSAMPLERATE_VERSION = 0.1.9
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
 LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
-LIBSAMPLERATE_LICENSE = Dual GPLv2+ / libsamplerate commercial use license
+LIBSAMPLERATE_LICENSE = BSD-2c
 LIBSAMPLERATE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
