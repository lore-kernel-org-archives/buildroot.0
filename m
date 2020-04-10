From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 10 Apr 2020 17:01:11 +0200
Subject: [Buildroot] [PATCH] package/gr-osmosdr: bump to 0.2.0
Message-ID: <20200410150111.15360-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Since, gr-osmosdr is python3 only, drop everything related to python2.
python-cheetah is no more mandatory, so drop this too.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gr-osmosdr/Config.in       | 1 +
 package/gr-osmosdr/gr-osmosdr.hash | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index 1e80137f35..3d12540c7d 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GR_OSMOSDR
 	bool "gr-osmosdr"
 	depends on BR2_PACKAGE_GNURADIO
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_GNURADIO_BLOCKS
 	select BR2_PACKAGE_GNURADIO_FFT
 	select BR2_PACKAGE_GNURADIO_FILTER
diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index 4a1e56abae..64959c8e74 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 48f92dc02b86ce6d299b35db249f2c8099bb45326c979b6225a020a4188e4204 gr-osmosdr-46698a67e7e06419eefaf45c95129c0c12669045.tar.gz
+sha256 9812429d97bc54f0a8917b880ca9e7e2421c66aeaac8ce5608161a8ae7007122 gr-osmosdr-0.2.0.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index fcc817fe85..c5d6ddc2e2 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = 46698a67e7e06419eefaf45c95129c0c12669045
-GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,$(GR_OSMOSDR_VERSION))
+GR_OSMOSDR_VERSION = 0.2.0
+GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,v$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
 
 # gr-osmosdr prevents doing an in-source-tree build
 GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD = NO
 
-GR_OSMOSDR_DEPENDENCIES = gnuradio host-python-cheetah
+GR_OSMOSDR_DEPENDENCIES = gnuradio host-python3
 
 GR_OSMOSDR_CONF_OPTS = \
 	-DENABLE_DEFAULT=OFF \
@@ -24,7 +24,7 @@ GR_OSMOSDR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GR_OSMOSDR_PYTHON),y)
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
-GR_OSMOSDR_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
+GR_OSMOSDR_DEPENDENCIES += python3
 else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
-- 
2.20.1
