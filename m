From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 23:39:55 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/linux-tools:
 selftests depend on !static
Message-ID: <20191106223600.A84B38E944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b439be342c194b10ff08a73901d26fbe8595fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

The indirect dependency through kmod was not tracked.

Detected with randconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0c768dbbd90639c03588df15ffee0ddd127f6e41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 1c660f76f5..ab8cc3891c 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -82,6 +82,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	depends on BR2_USE_MMU  # bash
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_NCURSES
@@ -103,9 +104,9 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	  This is very much a use at your risk option and may not work
 	  for every setup or every architecture.
 
-comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
+comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LINUX_TOOLS_TMON
 	bool "tmon"
