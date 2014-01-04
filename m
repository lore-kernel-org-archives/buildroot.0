From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Jan 2014 10:39:33 +0100
Subject: [Buildroot] [git commit] wmctrl: fix comment (typo and visibility)
Message-ID: <20140104094010.1D3BA9C3A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c71f876fc694d3f4efa0a6228d8464fbb3a924f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wmctrl/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
index 334f47d..e0342b7 100644
--- a/package/wmctrl/Config.in
+++ b/package/wmctrl/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_WMCTRL
 
 	  http://tomas.styblo.name/wmctrl/
 
-comment "libglib2 needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_MMU
+comment "wmctrl needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
