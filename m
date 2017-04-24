From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 24 Apr 2017 16:21:54 +0300
Subject: [Buildroot] [PATCH] binutils: arc: fix custom patch
Message-ID: <1493040114-32538-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes another brown-paper-bag issue that I've introduced by
my following patch:
toolchain: Bump ARC tools to arc-2017.03-rc1
(5f8ef7e25c5cc5c2e4ae4c8b6e8caa029ddf9a94)

arc-2017.03-rc1 differs a bit from 2.28. And so corresponding
of-the-tree patch should be updated appropriately.

Fixes target binutils build for arc:
http://autobuild.buildroot.net/results/f67/f67c905979870936d8050a505b61186be6dad85d//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 .../binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch b/package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch
index f54b1b3..9bb2341 100644
--- a/package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch
+++ b/package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch
@@ -17,8 +17,8 @@ index d4837d0..937da8a 100644
  	      && command_line.rpath == NULL)
  	    {
  	      path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+	        lib_path = NULL;
++	      if ((path) && (strlen (path) == 0))
++	        path = NULL;
  	      if (path
  		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-- 
2.7.4
