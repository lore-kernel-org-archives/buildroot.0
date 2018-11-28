From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:35 +0100
Subject: [Buildroot] [PATCH 05/11] gqrx: suppress fft depend since fft's
 precision is selected by gnuradio
In-Reply-To: <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-5-git-send-email-gwenj@trabucayre.com>
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
