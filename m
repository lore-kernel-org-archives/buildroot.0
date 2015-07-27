From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:04:46 +0200
Subject: [Buildroot] [git commit] package/rtl8821au: bump version and remove
	debugging patch
Message-ID: <20150727210502.E759C7FED3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a069b5caed758050188e566ec5b9f35ae2116b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates rtl8821au to include an upstream commit which
disables debug output, unless a runtime insmod parameter debug=level
is passed when loading the module. This makes the old buildroot patch
to remove hardcoded debug defines unnecessary: as such, it has been
removed.

Signed-off-by: Christian Stewart <christian@paral.in>
Tested-by: Christian Stewart <christian@paral.in>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8821au/0001-disable-default-debug.patch |   24 --------------------
 package/rtl8821au/rtl8821au.mk                     |    2 +-
 2 files changed, 1 insertions(+), 25 deletions(-)

diff --git a/package/rtl8821au/0001-disable-default-debug.patch b/package/rtl8821au/0001-disable-default-debug.patch
deleted file mode 100644
index de6fc62..0000000
--- a/package/rtl8821au/0001-disable-default-debug.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Comment out the hardcoded debug defines. If extra debug is needed, we can add it
-as a define in the make flags.
-
-Signed-off-by: Christian Stewart <christian@paral.in>
-
-diff --git a/include/autoconf.h b/include/autoconf.h
---- a/include/autoconf.h
-+++ b/include/autoconf.h
-@@ -130,12 +130,12 @@
- /*
-  * Debug Related Config
-  */
--#define DBG	1
-+//#define DBG	1
- 
--#define CONFIG_DEBUG /* DBG_871X, etc... */
-+//#define CONFIG_DEBUG /* DBG_871X, etc... */
- //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_, _func_exit_ */
- 
--#define CONFIG_PROC_DEBUG
-+//#define CONFIG_PROC_DEBUG
- 
- 
- //#define DBG_TX
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index d218e3c..eddb18e 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d
+RTL8821AU_VERSION = fef8c9d67d076eee9dfb9e19cb7cb69815d5a207
 RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
 RTL8821AU_LICENSE_FILES = COPYING
