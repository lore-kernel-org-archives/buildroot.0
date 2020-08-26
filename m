From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 26 Aug 2020 11:30:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: select LIBERATION fonts
 by default when GNURADIO_QTGUI is enabled
In-Reply-To: <20200826093028.870724-1-gwenj@trabucayre.com>
References: <20200826093028.870724-1-gwenj@trabucayre.com>
Message-ID: <20200826093028.870724-2-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

qtgui option is used to display graph. All plot has legend and configuration options
with text. Without font available no text is not displayed.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 1 +
 package/gnuradio/gnuradio.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 2282f799da..a47c7b20d0 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -141,6 +141,7 @@ config BR2_PACKAGE_GNURADIO_QTGUI
 	select BR2_PACKAGE_GNURADIO_ANALOG
 	select BR2_PACKAGE_GNURADIO_FFT
 	select BR2_PACKAGE_GNURADIO_FILTER
+	select BR2_PACKAGE_LIBERATION # runtime
 	select BR2_PACKAGE_PYTHON_PYQT5
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
 	select BR2_PACKAGE_QT5BASE_GUI # runtime
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 0a818cfc24..d4b6984102 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -137,7 +137,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_QTGUI),y)
-GNURADIO_DEPENDENCIES += qt5base python-pyqt5 qwt
+GNURADIO_DEPENDENCIES += liberation qt5base python-pyqt5 qwt
 GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=OFF
-- 
2.26.2
