From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Sep 2012 20:28:34 +0200
Subject: [Buildroot] [git commit] cvs: needs MMU support
Message-ID: <20120925195159.CBE9499701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cf7d4d79aa4ceb2b26540b90b4d21b46e713cee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

  http://autobuild.buildroot.org/results/33ac8387a7b27d7b90c23a5f772292921534f8da/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cvs/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index f9d5955..2308144 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_CVS
 	bool "cvs"
 	depends on BR2_USE_WCHAR
+	# needs fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_NCURSES
 	help
 	  Concurrent Versions System - source code revision control tools.
