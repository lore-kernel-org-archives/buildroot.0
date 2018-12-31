From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:19 +0100
Subject: [Buildroot] [PATCH v3 06/17] package/alsa-utils: use the new
 fftw-single package
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-utils/alsa-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 4ce4aace46..b5c36e0a46 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -41,7 +41,7 @@ endif
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_BAT),y)
 ALSA_UTILS_CONF_OPTS += --enable-bat
 # Analysis support requires fftw single precision
-ALSA_UTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),fftw)
+ALSA_UTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single)
 else
 ALSA_UTILS_CONF_OPTS += --disable-bat
 endif
-- 
2.20.1
