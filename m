From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 11:37:32 +0200
Subject: [Buildroot] [git commit] tstools: uses fork() therefore needs MMU
Message-ID: <20140517093855.5B58F9CC52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0821b7521e5103ff71042d33b4e0f613e64914be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/4f6/4f611e085a3e21319a98f5383adf2caac77a0bd6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tstools/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index 24d4403..6712b0f 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TSTOOLS
 	bool "tstools"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  This is a set of cross-platform command line tools for
 	  working with MPEG data
@@ -18,3 +19,4 @@ config BR2_PACKAGE_TSTOOLS
 
 comment "tstools needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+	depends on BR2_USE_MMU
