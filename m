From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Dec 2016 13:17:36 +0100
Subject: [Buildroot] [PATCH 3/6] package/aubio: add libsamplerate optional
	dependency
In-Reply-To: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
References: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480767459-17230-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.5.5
