From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 19:43:44 +0100
Subject: [Buildroot] [PATCH] olsr: add missing dependency on
	host-bison/host-flex
Message-ID: <1364237024-25856-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/19e8426d749411f7a8625a849b024f3811b06729/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 97088f3..fff7b34 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -15,6 +15,7 @@ OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
 OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
 OLSR_LICENSE = BSD-3c LGPLv2.1+
 OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
+OLSR_DEPENDENCIES = host-flex host-bison
 
 define OLSR_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
-- 
1.7.9.5
