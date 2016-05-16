From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 May 2016 22:38:22 +0200
Subject: [Buildroot] [git commit branch/next] uboot-tools: bump to version
	2016.05
Message-ID: <20160516204045.7526F818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81813b13b48496b454b0071422968823af0291cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to version 2016.05 and also remove patch
003-tools-env-bug-config-structs-must-be-defined-in-tool.patch, as it is
upstreamed now.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ug-config-structs-must-be-defined-in-tool.patch | 58 ----------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 3 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/package/uboot-tools/0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch b/package/uboot-tools/0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch
deleted file mode 100644
index 380e8cc..0000000
--- a/package/uboot-tools/0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 43cb65b7a00e4759427a6e4b8a02039e43dab5a5 Mon Sep 17 00:00:00 2001
-From: Andreas Fenkart <andreas.fenkart@digitalstrom.com>
-Date: Fri, 25 Mar 2016 14:52:19 +0100
-Subject: [PATCH] tools: env: bug: config structs must be defined in tools
- library
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fw_senten/fw_printenv can be compiled as a tools library, excluding the
-fw_env_main object.
-
-Fixes build error when linking with libubootenv:
-	fw_env.c:(.text+0x94): undefined reference to `common_args'
-
-Backported from: 43cb65b7a00e4759427a6e4b8a02039e43dab5a5
-
-Reported-by: Stefano Babic <sbabic@denx.de>
-Signed-off-by: Andreas Fenkart <andreas.fenkart@digitalstrom.com>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- tools/env/fw_env.c      | 4 ++++
- tools/env/fw_env_main.c | 4 ----
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
-index 5c7505c..1420ac5 100644
---- a/tools/env/fw_env.c
-+++ b/tools/env/fw_env.c
-@@ -35,6 +35,10 @@
- 
- #include "fw_env.h"
- 
-+struct common_args common_args;
-+struct printenv_args printenv_args;
-+struct setenv_args setenv_args;
-+
- #define DIV_ROUND_UP(n, d)	(((n) + (d) - 1) / (d))
- 
- #define min(x, y) ({				\
-diff --git a/tools/env/fw_env_main.c b/tools/env/fw_env_main.c
-index 3bec5b9..3706d8f 100644
---- a/tools/env/fw_env_main.c
-+++ b/tools/env/fw_env_main.c
-@@ -49,10 +49,6 @@ static struct option long_options[] = {
- 	{NULL, 0, NULL, 0}
- };
- 
--struct common_args common_args;
--struct printenv_args printenv_args;
--struct setenv_args setenv_args;
--
- void usage_printenv(void)
- {
- 
--- 
-2.8.2
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 747d133..2076b3b 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e49337262ecac44dbdeac140f2c6ebd1eba345e0162b0464172e7f05583ed7bb  u-boot-2016.03.tar.bz2
+sha256  87d02275615aaf0cd007b54cbe9fbadceef2bee7c79e6c323ea1ae8956dcb171  u-boot-2016.05.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d1ebd6f..987e89b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2016.03
+UBOOT_TOOLS_VERSION = 2016.05
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
