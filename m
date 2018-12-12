From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:33 +0100
Subject: [Buildroot] [PATCH v2 08/14] gqrx: suppress fft depend since fft's
 precision is selected by gnuradio
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-8-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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
2.19.2
