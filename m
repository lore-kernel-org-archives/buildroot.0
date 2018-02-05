From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 14:55:46 +0100
Subject: [Buildroot] [git commit] package/libsamplerate: add optional
 dependency to alsa-lib
Message-ID: <20180205135605.2F529883D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b679d7806767206f2c7bd7ff69b412bebb504f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure summary without this patch and without alsa-lib built before:

  Extra tools required for testing and examples :
[...]
    Have ALSA : ................... no

and with this patch

  Extra tools required for testing and examples :
[...]
    Have ALSA : ................... yes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
