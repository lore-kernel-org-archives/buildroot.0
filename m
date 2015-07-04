From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:14:37 +0200
Subject: [Buildroot] [git commit] package/openvmtools: bump to version 9.10.2
Message-ID: <20150704121445.543C28082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d242d23b762ff8e6838ed5a1e9be4b7f06a0526
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvmtools/openvmtools.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 57271c8..40a7dac 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION = stable-9.10.0
+OPENVMTOOLS_VERSION = stable-9.10.2
 OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
 OPENVMTOOLS_SUBDIR = open-vm-tools
 OPENVMTOOLS_LICENSE = LGPLv2.1
@@ -45,6 +45,13 @@ else
 OPENVMTOOLS_CONF_OPTS += --without-pam
 endif
 
+# configure needs execution permission
+define OPENVMTOOLS_PRE_CONFIGURE_CHMOD
+	chmod 0755 $(@D)/$(OPENVMTOOLS_SUBDIR)/configure
+endef
+
+OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_CHMOD
+
 # symlink needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
 # defined in lib/misc/hostinfoPosix.c
 # /sbin/shutdown needed for Guest OS restart/shutdown from hypervisor
