From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Mon,  3 Feb 2014 22:22:53 +0100
Subject: [Buildroot] [PATCH 1/1] Fix alioth.debian URLs that are broken
Message-ID: <1391462573-13068-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inspired by a patch from Martin Bark <martin@barkynet.com>, this fixes
autobuild issues related to packages not downloading from alioth.debian
URLs. This patches is meant to be "temporary" until the URLs are fixed
by debain.

Fixes:
  http://autobuild.buildroot.org/results/8c3/8c34649a7f98f60f14cff8b32fa2f8e82b1afeb6
  http://autobuild.buildroot.org/results/7e3/7e34e73e40fdb0e04bd63fa889f9bc14f7e30536

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/axel/axel.mk                   | 2 +-
 package/libhid/libhid.mk               | 2 +-
 package/ltrace/ltrace.mk               | 2 +-
 package/minicom/minicom.mk             | 2 +-
 package/sane-backends/sane-backends.mk | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index a83001f..ea97d75 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -5,7 +5,7 @@
 ################################################################################

 AXEL_VERSION = 2.4
-AXEL_SITE = https://alioth.debian.org/frs/download.php/file/3015
+AXEL_SITE = http://sources.buildroot.net/
 AXEL_LICENSE = GPLv2+
 AXEL_LICENSE_FILES = COPYING

diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 97aab5d..1b9b895 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -5,7 +5,7 @@
 ################################################################################

 LIBHID_VERSION = 0.2.16
-LIBHID_SITE = http://alioth.debian.org/frs/download.php/file/1958
+LIBHID_SITE = http://sources.buildroot.net/
 LIBHID_DEPENDENCIES = libusb-compat libusb
 LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index b42c252..99c1af6 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################

 LTRACE_VERSION = 0.7.3
-LTRACE_SITE = http://alioth.debian.org/frs/download.php/file/3947
+LTRACE_SITE = http://sources.buildroot.net/
 LTRACE_SOURCE = ltrace-$(LTRACE_VERSION).tar.bz2
 LTRACE_DEPENDENCIES = libelf
 LTRACE_CONF_OPT = --disable-werror
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index e0a7cee..d72a40d 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -5,7 +5,7 @@
 ################################################################################

 MINICOM_VERSION = 2.7
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3977/
+MINICOM_SITE = http://sources.buildroot.net/
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index e2adc1a..52c5aa7 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -5,7 +5,7 @@
 ################################################################################

 SANE_BACKENDS_VERSION = 1.0.22
-SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/3503
+SANE_BACKENDS_SITE = http://sources.buildroot.net/
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config

 ifeq ($(BR2_PACKAGE_LIBUSB),y)
--
1.8.3.2
