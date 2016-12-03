From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Dec 2016 13:17:37 +0100
Subject: [Buildroot] [PATCH 4/6] package/aubio: add jack2 optional dependency
In-Reply-To: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
References: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480767459-17230-4-git-send-email-romain.naour@gmail.com>
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
index ed00088..7aac6e5 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -15,7 +15,6 @@ AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas \
 	--disable-avcodec \
-	--disable-jack \
 	--disable-fftw3 \
 	--disable-fftw3f
 
@@ -33,4 +32,11 @@ else
 AUBIO_CONF_OPTS += --disable-samplerate
 endif
 
+ifeq ($(BR2_PACKAGE_JACK2),y)
+AUBIO_DEPENDENCIES += jack2
+AUBIO_CONF_OPTS += --enable-jack
+else
+AUBIO_CONF_OPTS += --disable-jack
+endif
+
 $(eval $(waf-package))
-- 
2.5.5
