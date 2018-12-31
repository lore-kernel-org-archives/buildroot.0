From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:22 +0100
Subject: [Buildroot] [PATCH v3 09/17] package/gqrx: remove unneeded fftw
 dependency
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-10-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Thanks to the new fftw package organization, gnuradio already selects
the appropriate fftw precision, and there is no need to propagate the
"depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE" that used to be present
in the gnuradio package.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gqrx/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 1dc40c6d24..94ccb60d44 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -2,13 +2,11 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
 
-comment "gqrx needs qt5, gnuradio, fftw's single precision"
-	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
-		!BR2_PACKAGE_QT5
+comment "gqrx needs qt5, gnuradio"
+	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_GQRX
 	bool "gqrx"
-	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
 	depends on BR2_PACKAGE_GNURADIO
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_INSTALL_LIBSTDCPP # boost
-- 
2.20.1
