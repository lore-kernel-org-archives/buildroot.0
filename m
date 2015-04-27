From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:33:22 +0200
Subject: [Buildroot] [git commit] package/dvdrw-tools: needs host-m4
Message-ID: <20150427213337.09D8F81D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=278cc758659d0583bbd11adec757c99d12c1359f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/b2b/b2b836b095251950e3229b66d6ca9faeaec45e72/
http://autobuild.buildroot.net/results/03b/03be24979d3ec4b08ebc7841ce1e2bcb05d26f97/
http://autobuild.buildroot.net/results/083/083ce6e998154a77dbaa16b3bed08570b745e587/
http://autobuild.buildroot.net/results/a51/a51da652314b01ae15f99708c5551f571247342b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvdrw-tools/dvdrw-tools.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dvdrw-tools/dvdrw-tools.mk b/package/dvdrw-tools/dvdrw-tools.mk
index 99923cf..24daac1 100644
--- a/package/dvdrw-tools/dvdrw-tools.mk
+++ b/package/dvdrw-tools/dvdrw-tools.mk
@@ -9,6 +9,7 @@ DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
 DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
 DVDRW_TOOLS_LICENSE = GPLv2
 DVDRW_TOOLS_LICENSE_FILES = LICENSE
+DVDRW_TOOLS_DEPENDENCIES = host-m4
 
 define DVDRW_TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -16,10 +17,10 @@ endef
 
 ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND),y)
 DVDRW_TOOLS_BACKEND = genisoimage
-DVDRW_TOOLS_DEPENDENCIES = cdrkit
+DVDRW_TOOLS_DEPENDENCIES += cdrkit
 else ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND),y)
 DVDRW_TOOLS_BACKEND = xorrisofs
-DVDRW_TOOLS_DEPENDENCIES = xorriso
+DVDRW_TOOLS_DEPENDENCIES += xorriso
 endif
 
 define DVDRW_TOOLS_INSTALL_TARGET_CMDS
