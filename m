From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:50:34 +0200
Subject: [Buildroot] [git commit] busybox: add option to specify config
	fragments
Message-ID: <20150601220248.B987A81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73e8345c9873477c1998e1b9ed8e522031191250
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/Config.in  |    6 ++++++
 package/busybox/busybox.mk |    1 +
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index b4f949f..6847a60 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -20,6 +20,12 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 
 	  Most people will just use the default BusyBox configuration file.
 
+config BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES
+	string "Additional BusyBox configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main BusyBox configuration file.
+
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	bool "Show packages that are also provided by busybox"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1ce508a..090e174 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -46,6 +46,7 @@ ifndef BUSYBOX_CONFIG_FILE
 endif
 
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
+BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES))
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
