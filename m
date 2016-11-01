From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:30:47 +0100
Subject: [Buildroot] [git commit] lttng-modules: bump to version 2.8.3
Message-ID: <20161101143108.D6E16818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83676c3117130ae6e738105937aed12a4a7715a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LTTng-modules, starting from v2.8, has a mechanism to be built directly
into a Linux kernel image, that is, not as loadable kernel modules. For
this the `CONFIG_LTTNG_CLOCK_PLUGIN_TEST` and `CONFIG_LTTNG` Make
variables were introduced. They need to be explicitly set to `m` here to
build the project as loadable kernel modules.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-modules/lttng-modules.hash | 5 +++--
 package/lttng-modules/lttng-modules.mk   | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 2d50287..ce725ec 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,2 +1,3 @@
-# from http://lttng.org/files/lttng-tools/lttng-modules-2.7.1.tar.bz2.sha1
-sha1  38c42ec89b4966c7a4cc04aea75f5841634d8d66  lttng-modules-2.7.1.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.8.3.tar.bz2.{md5,sha1}
+md5   424354c4834d20235dacd9a1fd7653b6  lttng-modules-2.8.3.tar.bz2
+sha1  862705784a54962f70226004f1fd0bf77f73f10f  lttng-modules-2.8.3.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 5d0c422..9ecf572 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.7.1
+LTTNG_MODULES_VERSION = 2.8.3
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
+LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
 $(eval $(kernel-module))
 $(eval $(generic-package))
