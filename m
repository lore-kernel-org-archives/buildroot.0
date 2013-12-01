From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 20:54:41 +0100
Subject: [Buildroot] [git commit] strace: disable unsupported nios2 arch
Message-ID: <20131201201520.CE01D9BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8bad3ae49387a85bc7997fec2da14801a3b76e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/88f330254a83fbc105a74e76df586672d2c369c4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 0959ec5..ded51ba 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !BR2_arc
+	depends on !BR2_arc && !BR2_nios2
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
