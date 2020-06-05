From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri,  5 Jun 2020 15:24:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: add gr-dtv support
In-Reply-To: <20200605132432.1749068-1-gwenj@trabucayre.com>
References: <20200605132432.1749068-1-gwenj@trabucayre.com>
Message-ID: <20200605132432.1749068-2-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-dtv provide support for a serie of gnuradio blocks for
digital television standards.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 8 ++++++++
 package/gnuradio/gnuradio.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 01a396227f..07a33514d1 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -54,6 +54,14 @@ config BR2_PACKAGE_GNURADIO_CTRLPORT
 	help
 	  GNU Radio ctrlport block
 
+config BR2_PACKAGE_GNURADIO_DTV
+	bool "gr-dtv support"
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	select BR2_PACKAGE_GNURADIO_FEC
+	select BR2_PACKAGE_GNURADIO_FILTER
+	help
+	  various digital television standards blocks
+
 config BR2_PACKAGE_GNURADIO_FEC
 	bool "gr-fec support"
 	select BR2_PACKAGE_GNURADIO_BLOCKS
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 2820334996..0a818cfc24 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -93,6 +93,12 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_DIGITAL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_DTV),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_DTV=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_DTV=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_FEC),y)
 GNURADIO_DEPENDENCIES += gsl
 GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=ON
-- 
2.26.2
