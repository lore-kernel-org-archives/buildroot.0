From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 26 Aug 2020 11:30:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/gnuradio: GNURADIO_QTGUI option
 require GNURADIO_ANALOG
Message-ID: <20200826093028.870724-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index cd31ce8864..2282f799da 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -138,6 +138,7 @@ config BR2_PACKAGE_GNURADIO_QTGUI
 	bool "gr-qtgui"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_GNURADIO_ANALOG
 	select BR2_PACKAGE_GNURADIO_FFT
 	select BR2_PACKAGE_GNURADIO_FILTER
 	select BR2_PACKAGE_PYTHON_PYQT5
-- 
2.26.2
