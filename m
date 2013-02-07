From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 13:51:57 +0100
Subject: [Buildroot] [git commit] coreutils: needs mmu
Message-ID: <20130207125214.9870D9A9F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69d9fc6b4e2508556c81443a062e298ad9a5daf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/bb975d928c08d31d0c1ecfb9519034865120b244/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/coreutils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index bfd6f26..c416ab1 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
