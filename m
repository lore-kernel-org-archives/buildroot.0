From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Jan 2014 15:51:57 -0300
Subject: [Buildroot] [PATCH] rng-tools: argp-standalone required for uclibc
	toolchains only
Message-ID: <1391021517-19634-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rng-tools/Config.in    | 2 +-
 package/rng-tools/rng-tools.mk | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index e6dcf9d..c50a8c0 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
-	select BR2_PACKAGE_ARGP_STANDALONE
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Daemon to use hardware random number generators.
 
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index ae0bf14..56858e7 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -6,8 +6,10 @@
 
 RNG_TOOLS_VERSION = 4
 RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 RNG_TOOLS_CONF_ENV = LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES = argp-standalone
+endif
 RNG_TOOLS_LICENSE = GPLv2
 RNG_TOOLS_LICENSE_FILES = COPYING
 
-- 
1.8.3.2
