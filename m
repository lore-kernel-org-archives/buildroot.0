From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 01 Mar 2017 17:04:21 -0000
Subject: [Buildroot] [git commit] gqrx: remove audio backend dependencies
Message-ID: <20170301170420.BFF02800CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af0cc55f322f40a93655f9688993d8397acd6da2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the gnuradio gr-audio option selects an audio backend by
default, it is no longer needed to depends on BR2_PACKAGE_ALSA_LIB or
BR2_PACKAGE_PORTAUDIO in the qgrx package.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gqrx/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 5f7a561..1dc40c6 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -2,13 +2,12 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
 
-comment "gqrx needs qt5, gnuradio, fftw's single precision, alsa-lib or portaudio"
+comment "gqrx needs qt5, gnuradio, fftw's single precision"
 	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
-		!(BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO) || !BR2_PACKAGE_QT5
+		!BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_GQRX
 	bool "gqrx"
-	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO # gr-audio
 	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
 	depends on BR2_PACKAGE_GNURADIO
 	depends on BR2_PACKAGE_QT5
