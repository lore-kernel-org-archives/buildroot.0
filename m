From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Mar 2013 17:04:24 -0300
Subject: [Buildroot] [PATCH] smartmontools: bump to version 6.1
Message-ID: <1363723464-21293-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/smartmontools/Config.in        | 1 +
 package/smartmontools/smartmontools.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/smartmontools/Config.in b/package/smartmontools/Config.in
index 18320f0..dd8197f 100644
--- a/package/smartmontools/Config.in
+++ b/package/smartmontools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SMARTMONTOOLS
 	bool "smartmontools"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  Control and monitor storage systems using S.M.A.R.T.
 
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 5736771..850001a 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SMARTMONTOOLS_VERSION = 6.0
+SMARTMONTOOLS_VERSION = 6.1
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPLv2+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
1.8.1.5
