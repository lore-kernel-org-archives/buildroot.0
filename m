From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:22:08 +0100
Subject: [Buildroot] [git commit] package/aubio: add libsndfile optional
	dependency
Message-ID: <20161204152218.05234817E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06d8abd0908524d6623958612e5ba8093ab5d921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
