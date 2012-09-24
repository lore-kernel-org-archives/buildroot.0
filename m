From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Sep 2012 18:13:40 +0200
Subject: [Buildroot] [PATCH] cvs: needs MMU support
Message-ID: <1348503220-19839-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

  http://autobuild.buildroot.org/results/33ac8387a7b27d7b90c23a5f772292921534f8da/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cvs/Config.in |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
