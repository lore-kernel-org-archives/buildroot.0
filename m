From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 13 Feb 2017 17:13:19 +0100
Subject: [Buildroot] [PATCH 2/2] gqrx: suppress audio backend dependencies
In-Reply-To: <20170213161319.25131-1-gwenj@trabucayre.com>
References: <20170213161319.25131-1-gwenj@trabucayre.com>
Message-ID: <20170213161319.25131-2-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Now gr-audio selects an audio backend by default. Consequently, it is no more
needed to depends on BR2_PACKAGE_ALSA_LIB or BR2_PACKAGE_PORTAUDIO.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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
-- 
2.10.2
