From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:22:11 +0100
Subject: [Buildroot] [git commit] package/aubio: add jack2 optional
	dependency
Message-ID: <20161204152218.20BB981D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3909197ace8db3f6e61c5e025fb43266968b3435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
