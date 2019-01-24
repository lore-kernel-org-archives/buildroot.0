From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:18:40 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/cc-tool: drop
 BR2_PACKAGE_BOOST_SIGNALS select
Message-ID: <20190124161854.835B98E4E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e151993986fbf4a04e8f03929087bc282c76b83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

cc-tool depends on signals2 not signals, indeed only signals2 is used
in src/data/progress_watcher.h and BOOST_SIGNALS defined in
m4/boost.m4 is never used in configure.ac.

There is no need to select any sort of BR2_PACKAGE_BOOST_SIGNALS2
option, as signals2 is a header-only boost library, and such
header-only boost libraries do not have any Config.in options, as they
are all always installed with the base boost library.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: tweak commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 024ed470adc684391ee12b8f762f5c0bf76d7e57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cc-tool/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index b2cf97969b..8145b676c9 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_CC_TOOL
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SIGNALS
 	help
 	  cc-tool provides support for Texas Instruments CC Debugger
 	  for Linux OS in order to program 8051-based System-On-Chip
