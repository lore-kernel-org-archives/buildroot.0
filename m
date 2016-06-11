From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:53:53 +0200
Subject: [Buildroot] [git commit] gnuradio: add gr-ctrlport support
Message-ID: <20160611135436.3E1A480266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0baae8da885d70d0f60566e704780c1202a2b59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gr-ctrlport is a gnuradio module to create distributed control applications.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/Config.in   | 5 +++++
 package/gnuradio/gnuradio.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index d7d2347..f51b9b2 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -41,6 +41,11 @@ config BR2_PACKAGE_GNURADIO_BLOCKS
 	help
 	  GNU Radio basic block library
 
+config BR2_PACKAGE_GNURADIO_CTRLPORT
+	bool "ctrlport support"
+	help
+	  GNU Radio ctrlport block
+
 config BR2_PACKAGE_GNURADIO_FEC
 	bool "gr-fec support"
 	select BR2_PACKAGE_GNURADIO_BLOCKS
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 8f771fc..b193569 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -76,6 +76,12 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_CHANNELS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_CTRLPORT),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_CTRLPORT=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_CTRLPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_DIGITAL),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_DIGITAL=ON
 else
