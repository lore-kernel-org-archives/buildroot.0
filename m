From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 29 Oct 2018 00:09:50 +0100
Subject: [Buildroot] [PATCH 1/3] kconfig: Add missing patch
In-Reply-To: <20181028230952.27293-1-petr.vorel@gmail.com>
References: <20181028230952.27293-1-petr.vorel@gmail.com>
Message-ID: <20181028230952.27293-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

which was specified, but not added during last update.

Fixes: 6eacea5ae0 ("support/kconfig: bump to kconfig from Linux 4.17-rc2")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../kconfig/patches/17-backport-kecho.patch   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 support/kconfig/patches/17-backport-kecho.patch

diff --git a/support/kconfig/patches/17-backport-kecho.patch b/support/kconfig/patches/17-backport-kecho.patch
new file mode 100644
index 0000000000..9d13876616
--- /dev/null
+++ b/support/kconfig/patches/17-backport-kecho.patch
@@ -0,0 +1,26 @@
+This commit added kecho to scripts/Kbuild.include (and doc).
+Backported just Kbuild.include part to Makefile
+
+commit 5410ecc0def8955ab99810c5626cc7e156991896
+Author: Mike Frysinger <vapier@gentoo.org>
+Date:   Thu Nov 6 03:31:34 2008 -0500
+
+    kbuild: introduce $(kecho) convenience echo
+
+Index: kconfig/Makefile
+===================================================================
+--- kconfig.orig/Makefile
++++ kconfig/Makefile
+@@ -6,6 +6,12 @@
+ PHONY += xconfig gconfig menuconfig config syncconfig update-po-config \
+ 	localmodconfig localyesconfig
+ 
++# Easy method for doing a status message
++       kecho := :
++ quiet_kecho := echo
++silent_kecho := :
++kecho := $($(quiet)kecho)
++
+ ifdef KBUILD_KCONFIG
+ Kconfig := $(KBUILD_KCONFIG)
+ else
-- 
2.19.1
