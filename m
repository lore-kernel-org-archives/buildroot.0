From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Feb 2018 13:05:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsamplerate: add optional
 dependency to alsa-lib
Message-ID: <20180204120527.26926-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure summary without this patch and without alsa-lib built before:

  Extra tools required for testing and examples :
[...]
    Have ALSA : ................... no

and with this patch

  Extra tools required for testing and examples :
[...]
    Have ALSA : ................... yes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsamplerate/libsamplerate.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 76e93f913e..c107650cb4 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -12,6 +12,10 @@ LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
 LIBSAMPLERATE_LICENSE = BSD-2-Clause
 LIBSAMPLERATE_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIBSAMPLERATE_DEPENDENCIES += alsa-lib
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LIBSAMPLERATE_DEPENDENCIES += libsndfile
 endif
-- 
2.11.0
