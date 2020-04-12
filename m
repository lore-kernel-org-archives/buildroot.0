From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 16:52:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/openipmi: bump version to 2.0.28
Message-ID: <20200412145219.1439893-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/cminyard/openipmi/commit/d1dd570cf77cb2c63bc32bef12d5353e3a197146

Added md5 hash provided by upstream, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ine-include-in-ipmi_serial_bmc_emu.c.patch | 31 -------------------
 package/openipmi/openipmi.hash                |  5 +--
 package/openipmi/openipmi.mk                  |  4 +--
 3 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch

diff --git a/package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch b/package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch
deleted file mode 100644
index 112d63854c..0000000000
--- a/package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6a051666b50ae1df24b24312a7a56a03e343c15d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 16 Aug 2019 09:48:21 +0300
-Subject: [PATCH] sample: fix readline include in ipmi_serial_bmc_emu.c
-
-Bundled editline has been removed. Use the readline headers instead. Fix
-the build when editline is not installed on host.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to openipmi-developer at lists.sourceforge.net (moderated)
-
- sample/ipmi_serial_bmc_emu.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sample/ipmi_serial_bmc_emu.c b/sample/ipmi_serial_bmc_emu.c
-index e0ae0197688b..1b8bb9ac201f 100644
---- a/sample/ipmi_serial_bmc_emu.c
-+++ b/sample/ipmi_serial_bmc_emu.c
-@@ -42,7 +42,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <sys/select.h>
--#include <editline/readline.h>
-+#include <readline/readline.h>
- 
- #define _GNU_SOURCE
- #include <getopt.h>
--- 
-2.23.0.rc1
-
diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index 756ea539f1..2ec9dd31af 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,7 +1,8 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1 043738af9e1aaa6ae4f372d4af7870683e68faf8 OpenIPMI-2.0.27.tar.gz
+sha1 be0c87743a38e2fa00586df931f021c0b480385b OpenIPMI-2.0.28.tar.gz
+md5 ba37f08e306062ec73c7ed2a2bd4d5f4 OpenIPMI-2.0.28.tar.gz
 # Locally computed
-sha256	f3b1fafaaec2e2bac32fec5a86941ad8b8cb64543470bd6d819d7b166713d20b	OpenIPMI-2.0.27.tar.gz
+sha256	8e8b1de2a9a041b419133ecb21f956e999841cf2e759e973eeba9a36f8b40996	OpenIPMI-2.0.28.tar.gz
 sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
 sha256	185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e	COPYING.BSD
 sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index ca8fa77342..3240b89894 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.27
-OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
+OPENIPMI_VERSION = 2.0.28
+OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
-- 
2.25.0
