From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 12 Jun 2019 08:42:09 +0200
Subject: [Buildroot] [PATCH 4/4] package: remove non-conventional
 prefix/suffix from tarball-fetched packages
In-Reply-To: <20190612064209.23619-1-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
Message-ID: <20190612064209.23619-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While most projects name their tarball <name>-<version>, where
<version> is just the version number, some other projects add some
prefix and/or suffix to their version number.

In Buildroot, we currently encode the full version (with its
prefix/suffix) in the <pkg>_VERSION variable. However, that doesn't
work well to match version numbers with the release-monitoring.org
website, which filters such prefixes/suffixes.

This commit therefore removes the prefix/suffix from tarball-fetched
packages (and the special spidev case, which downloads just one
file). The name of the files being downloaded does not change.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 package/libcuefile/libcuefile.mk       | 4 ++--
 package/libevent/libevent.mk           | 5 +++--
 package/lshw/lshw.mk                   | 3 ++-
 package/mksh/mksh.mk                   | 4 ++--
 package/zynq-boot-bin/zynq-boot-bin.mk | 4 ++--
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
index 66b589b193..891c1eec37 100644
--- a/package/libcuefile/libcuefile.mk
+++ b/package/libcuefile/libcuefile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCUEFILE_VERSION = r475
+LIBCUEFILE_VERSION = 475
 LIBCUEFILE_SITE = http://files.musepack.net/source
-LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
+LIBCUEFILE_SOURCE = libcuefile_r$(LIBCUEFILE_VERSION).tar.gz
 LIBCUEFILE_INSTALL_STAGING = YES
 LIBCUEFILE_LICENSE = GPL-2.0+
 LIBCUEFILE_LICENSE_FILES = COPYING
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index e0c0b2517d..1d4cd2651f 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.1.10-stable
-LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)
+LIBEVENT_VERSION = 2.1.10
+LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
+LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 4195c073e2..3e8cee2e2e 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LSHW_VERSION = B.02.18
+LSHW_VERSION = 02.18
 LSHW_SITE = http://ezix.org/software/files
+LSHW_SOURCE = lshw-B.$(LSHW_VERSION).tar.gz
 LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 4fa0e020af..3347dd66cb 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MKSH_VERSION = R55
-MKSH_SOURCE = mksh-$(MKSH_VERSION).tgz
+MKSH_VERSION = 55
+MKSH_SOURCE = mksh-R$(MKSH_VERSION).tgz
 MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
 # For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
 MKSH_LICENSE = MirOS, ISC
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
index c56203fb68..deba5f4096 100644
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
+ZYNQ_BOOT_BIN_VERSION = 2015.1
 ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
-ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/$(ZYNQ_BOOT_BIN_VERSION)/tools
+ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/xilinx-v$(ZYNQ_BOOT_BIN_VERSION)/tools
 ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
 
 HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
-- 
2.21.0
