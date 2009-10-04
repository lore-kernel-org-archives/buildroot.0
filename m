From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Oct 2009 22:20:28 +0200
Subject: [Buildroot] [git commit master] Makefile: update help text
Message-ID: <20091004202132.D3B1D77762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c48bbb8c0818a44d11b1e222af3ac5a0150d5a05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

get rid of the removed saveconfig/getconfig targets, and instead document
randconfig/defconfig/allyesconfig/allnoconfig.

Furthermore, get rid of the unused tags target.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 7fe30a7..a14c62d 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig xconfig config oldconfig randconfig \
-	defconfig allyesconfig allnoconfig release tags \
+	defconfig allyesconfig allnoconfig release \
 	source-check help
 
 # Strip quotes and then whitespaces
@@ -528,7 +528,6 @@ allyesconfig: $(CONFIG)/conf
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
-	#sed -i -e "s/^CONFIG_DEBUG.*/# CONFIG_DEBUG is not set/" .config
 
 allnoconfig: $(CONFIG)/conf
 	@mkdir -p $(CONFIG)/buildroot-config
@@ -584,11 +583,13 @@ help:
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
-	@echo '  xconfig		- interactive Qt-based configurator'
+	@echo '  xconfig                - interactive Qt-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
+	@echo '  randconfig             - New config with random answer to all options'
+	@echo '  defconfig              - New config with default answer to all options'
+	@echo '  allyesconfig           - New config where all options are accepted with yes'
+	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  configured             - make {uclibc/busybox/linux26}-config'
-	@echo '  saveconfig             - save current configuration under local/<project>'
-	@echo '  getconfig              - restore saved configuration from local/<project>'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
@@ -606,5 +607,5 @@ release: distclean
 	rm -rf $$OUT
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
-	menuconfig xconfig tags check test depend defconfig help
+	menuconfig xconfig check test depend defconfig help
 
-- 
1.6.3.3
