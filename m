From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] smartmontools: bump to version
	5.40
Message-ID: <20110117202414.03D1782879@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=47f8a98c5bdd3713e0ddac66b4154004cf20c9c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/smartmontools/Config.in        |    4 ++++
 package/smartmontools/smartmontools.mk |    7 +++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/smartmontools/Config.in b/package/smartmontools/Config.in
index a1541d7..18320f0 100644
--- a/package/smartmontools/Config.in
+++ b/package/smartmontools/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SMARTMONTOOLS
 	bool "smartmontools"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Control and monitor storage systems using S.M.A.R.T.
 
 	  http://smartmontools.sourceforge.net/
+
+comment "smartmontools requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index d768b34..d982863 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -3,9 +3,8 @@
 # smartmontools
 #
 #############################################################
-SMARTMONTOOLS_VERSION:=5.33
-SMARTMONTOOLS_SOURCE:=smartmontools-$(SMARTMONTOOLS_VERSION).tar.gz
-SMARTMONTOOLS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
-SMARTMONTOOLS_DIR:=$(BUILD_DIR)/smartmontools-$(SMARTMONTOOLS_VERSION)
+
+SMARTMONTOOLS_VERSION = 5.40
+SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
 
 $(eval $(call AUTOTARGETS,package,smartmontools))
-- 
1.7.3.4
