From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Dec 2016 13:17:35 +0100
Subject: [Buildroot] [PATCH 2/6] package/aubio: add libsndfile optional
	dependency
In-Reply-To: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
References: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480767459-17230-2-git-send-email-romain.naour@gmail.com>
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
index aa4ddd0..e1694ab 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -16,9 +16,15 @@ AUBIO_CONF_OPTS = \
 	--disable-atlas \
 	--disable-samplerate \
 	--disable-avcodec \
-	--disable-sndfile \
 	--disable-jack \
 	--disable-fftw3 \
 	--disable-fftw3f
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+AUBIO_DEPENDENCIES += libsndfile
+AUBIO_CONF_OPTS += --enable-sndfile
+else
+AUBIO_CONF_OPTS += --disable-sndfile
+endif
+
 $(eval $(waf-package))
-- 
2.5.5
