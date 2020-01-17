From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 17 Jan 2020 12:02:31 +0100
Subject: [Buildroot] [PATCH v2 5/6] package/gr-osmosdr: add python3 support
In-Reply-To: <20200117110232.31336-1-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
Message-ID: <20200117110232.31336-5-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Gnuradio 3.8 support python2 and python3 and since gr-osmosdr support both two,
adapts dependencies

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gr-osmosdr/Config.in     | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index f26380371f..ee01f5add4 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -11,7 +11,7 @@ if BR2_PACKAGE_GR_OSMOSDR
 
 config BR2_PACKAGE_GR_OSMOSDR_PYTHON
 	bool "python support"
-	depends on BR2_PACKAGE_GNURADIO_PYTHON
+	depends on BR2_PACKAGE_GNURADIO_PYTHON || BR2_PACKAGE_GNURADIO_PYTHON3
 	help
 	  Enable Python support
 
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 98b6e25012..003f406602 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -22,7 +22,7 @@ GR_OSMOSDR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GR_OSMOSDR_PYTHON),y)
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
-GR_OSMOSDR_DEPENDENCIES += python
+GR_OSMOSDR_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
-- 
2.24.1
