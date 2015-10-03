From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 14:19:57 +0200
Subject: [Buildroot] [git commit] targetcli-fb: bump version
Message-ID: <20151003122242.2FF9E8180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9829b82caf2b5d5479da5f1c16a474466ab104d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add new dependency to python-six.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/targetcli-fb/Config.in       |    1 +
 package/targetcli-fb/targetcli-fb.mk |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index ee241ef..b655938 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_TARGETCLI_FB
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
+	select BR2_PACKAGE_PYTHON_SIX
 	help
 	  targetcli-fb is a command-line interface for configuring the
 	  LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index b5f2fbe..0a64c46 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-TARGETCLI_FB_VERSION = v2.1.fb37
+TARGETCLI_FB_VERSION = v2.1.fb41
 TARGETCLI_FB_SITE = $(call github,agrover,targetcli-fb,$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb
+TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target $(TARGET_DIR)/etc/init.d/S50target
