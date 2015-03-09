From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Mar 2015 10:28:20 -0300
Subject: [Buildroot] [PATCH] quagga: bump to version 0.99.24.1
Message-ID: <1425907700-15318-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the need to autoreconf and a zebra crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/quagga.hash | 2 +-
 package/quagga/quagga.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
index 172ff97..ba293c4 100644
--- a/package/quagga/quagga.hash
+++ b/package/quagga/quagga.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	eca9eeb75005c8c403d48747c93456389e837e07dfc06ce08f70602c32dd4041	quagga-0.99.24.tar.xz
+sha256	6fd6baadb136a801c29c1dd72d0fe69da9f19ae498e87bff7057778361e43b14	quagga-0.99.24.1.tar.xz
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 4a12ab3..2c0a6a9 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 0.99.24
+QUAGGA_VERSION = 0.99.24.1
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
 QUAGGA_CONF_OPTS = --program-transform-name=''
-# Upstream missed some bits when packaging it
-QUAGGA_AUTORECONF = YES
 
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BABELD),--enable-babeld,--disable-babeld)
-- 
2.0.5
