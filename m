From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 19:50:31 +0100
Subject: [Buildroot] [git commit] olsr: add missing dependency on
	host-bison/host-flex
Message-ID: <20130325191507.4CC5D9B2D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=280d3093cb6917d052ece893f576ba29cce47ebe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/19e8426d749411f7a8625a849b024f3811b06729/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/olsr/olsr.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
