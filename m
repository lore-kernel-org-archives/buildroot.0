From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:46:46 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: revert the removal of
	0001-drop-configh-from-tools.patch
Message-ID: <20170604074652.AEAB482A14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28fed0d861e8ef73eda53a0d2cb3ff65cb1b4674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001-drop-configh-from-tools.patch is not upstream, instead it
must be rebased on top of 2017.05 release since the code was moved by
[1].

Fixes:
http://autobuild.buildroot.net/results/949/94910513d1b14e3b02ec4aed34de89d1b1d7a12a

[1] http://git.denx.de/?p=u-boot.git;a=commit;h=9d80b49a671c9922931adcd823aab0ed319a42d1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc:  Fabio Estevam <festevam@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uboot-tools/0001-drop-configh-from-tools.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/uboot-tools/0001-drop-configh-from-tools.patch b/package/uboot-tools/0001-drop-configh-from-tools.patch
new file mode 100644
index 0000000..f19cebe
--- /dev/null
+++ b/package/uboot-tools/0001-drop-configh-from-tools.patch
@@ -0,0 +1,47 @@
+From 216832de3bc3e6ef093305c6d07f464f7606f2d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 4 Aug 2015 22:13:20 +0200
+Subject: [PATCH] drop configh from tools
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We need to build u-boot tools without a board configuration for the target.
+fw_env just uses config.h to define the default environment of the created
+image, so it really isn't mandatory.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[J??rg Krause: update for version 2015.07]
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+[Romain: update for version 2017.05
+    after commit 9d80b49a671c9922931adcd823aab0ed319a42d1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ tools/env/fw_env_private.h | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/tools/env/fw_env_private.h b/tools/env/fw_env_private.h
+index 0c27da0..e550463 100644
+--- a/tools/env/fw_env_private.h
++++ b/tools/env/fw_env_private.h
+@@ -5,17 +5,6 @@
+  * SPDX-License-Identifier:	GPL-2.0+
+  */
+ 
+-/* Pull in the current config to define the default environment */
+-#include <linux/kconfig.h>
+-
+-#ifndef __ASSEMBLY__
+-#define __ASSEMBLY__ /* get only #defines from config.h */
+-#include <config.h>
+-#undef	__ASSEMBLY__
+-#else
+-#include <config.h>
+-#endif
+-
+ /*
+  * To build the utility with the static configuration
+  * comment out the next line.
+-- 
+2.9.4
+
