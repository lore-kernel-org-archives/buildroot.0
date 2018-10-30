From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:57:04 +0100
Subject: [Buildroot] [git commit] kconfig: Add missing patch
Message-ID: <20181030201012.D85EB83239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=775087fab0da126ebd0c2c094d1cbb7274898af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

which was specified, but not added during last update.

Fixes: 6eacea5ae0 ("support/kconfig: bump to kconfig from Linux 4.17-rc2")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/patches/17-backport-kecho.patch | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

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
