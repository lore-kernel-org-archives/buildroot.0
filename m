From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:13:19 +0200
Subject: [Buildroot] [git commit] package/gnuradio: add option to enable
 gr-dtc support
Message-ID: <20200606211258.14C1F8442D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c878facaf807dd6f1ab5ad50dc8a3667c3d146dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gr-dtv provides support for a series of gnuradio blocks for digital
television standards.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
