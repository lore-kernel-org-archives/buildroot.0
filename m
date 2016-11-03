From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Nov 2016 06:58:38 -0300
Subject: [Buildroot] [PATCH 12/14] gst1-validate: bump to version 1.10.0
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1478167120-3285-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It now requires json-glib as dependency so adjust.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-validate/Config.in          | 1 +
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
index a9bb2aa..2022d38 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GST1_VALIDATE
 	bool "gst1-validate"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_PYTHON_PYEXPAT
 	# cairo is autodetected but needs PNG support
 	select BR2_PACKAGE_CAIRO_PNG if BR2_PACKAGE_CAIRO
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 09061f4..f08e1b7 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.3.tar.xz.sha256sum
-sha256 4525a4fb5b85b8a49674e00d652bee9ac62c56241c148abbff23efa50a224e34  gst-validate-1.8.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.0.tar.xz.sha256sum
+sha256 a99a5cd1dfa5d021dd0197b32b04a20348479c097ebeb1f4c36161d70048a176  gst-validate-1.10.0.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 372e5d6..94595a6 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.8.3
+GST1_VALIDATE_VERSION = 1.10.0
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
@@ -15,6 +15,7 @@ GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
 GST1_VALIDATE_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
+	json-glib \
 	host-python \
 	python \
 	$(if $(BR2_PACKAGE_CAIRO),cairo)
-- 
2.7.3
