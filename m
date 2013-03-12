From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 12 Mar 2013 22:17:05 +0100
Subject: [Buildroot] [PATCH] libv4l: depends on jpeg so must select it
Message-ID: <1363123025-8481-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Fixes http://autobuild.buildroot.net/results/3053854fccd65bc5b28384f2a2039a33abeeea47

The introduction of the error message for the jpeg virtual package exposes
this kind of error.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Perhaps it would be nice to add this type of check to the generic package
infrastructure: if a package is built, it should always be selected. Of
course, that makes it impossible to do a quick build of a package without
reconfiguring, but we can add another make variable that bypasses the check.
---
 package/libv4l/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 1e5eec6..cb0f43c 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_JPEG
 	help
 	  libv4l is an accompanying collection of libraries that adds a thin
 	  abstraction layer on top of video4linux2 (V4L2) devices.
-- 
1.7.10.4
