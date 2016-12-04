From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:22:09 +0100
Subject: [Buildroot] [git commit] package/aubio: add libsamplerate optional
	dependency
Message-ID: <20161204152218.11D2980468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee586c356de65ffe10473fff471c1951208f6a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aubio/aubio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index e1694ab..ed00088 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -14,7 +14,6 @@ AUBIO_INSTALL_STAGING = YES
 AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas \
-	--disable-samplerate \
 	--disable-avcodec \
 	--disable-jack \
 	--disable-fftw3 \
@@ -27,4 +26,11 @@ else
 AUBIO_CONF_OPTS += --disable-sndfile
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+AUBIO_DEPENDENCIES += libsamplerate
+AUBIO_CONF_OPTS += --enable-samplerate
+else
+AUBIO_CONF_OPTS += --disable-samplerate
+endif
+
 $(eval $(waf-package))
