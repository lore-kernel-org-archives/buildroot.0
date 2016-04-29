From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 29 Apr 2016 10:12:13 +0200
Subject: [Buildroot] [PATCH 2/3] gnuradio: add gr-ctrlport support
In-Reply-To: <1461917534-27882-1-git-send-email-gwenj@trabucayre.com>
References: <1461917534-27882-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1461917534-27882-2-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-ctrlport is a gnuradio module to create distributed control applications.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 5 +++++
 package/gnuradio/gnuradio.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 3cbc9b2..dc29dfc 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -43,6 +43,11 @@ config BR2_PACKAGE_GNURADIO_BLOCKS
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
-- 
2.7.3
