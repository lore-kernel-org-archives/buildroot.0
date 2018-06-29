From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jun 2018 08:57:59 +0300
Subject: [Buildroot] [PATCH] alsa-utils: bat needs fftw single precision
Message-ID: <9349ba14bbc58c62f1824ef2742479972060e732.1530251879.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the configure check for fftw fails, and alsabat does not link
with libfftw. We can not select a config choice, so depend on single
precision instead.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/alsa-utils/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 1a48fc0315ef..9f4f1d2d3726 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -76,7 +76,10 @@ config BR2_PACKAGE_ALSA_UTILS_ASEQNET
 
 config BR2_PACKAGE_ALSA_UTILS_BAT
 	bool "bat"
-	select BR2_PACKAGE_FFTW
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+comment "bat needs fftw in single precision"
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
 
 config BR2_PACKAGE_ALSA_UTILS_IECSET
 	bool "iecset"
-- 
2.18.0
