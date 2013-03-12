From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Mar 2013 22:31:31 +0100
Subject: [Buildroot] [git commit] libv4l: depends on jpeg so must select it
Message-ID: <20130312213138.8BEB89B061@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=196c716bc61582f1ccf03dc834cbb929c553e9aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3053854fccd65bc5b28384f2a2039a33abeeea47

The introduction of the error message for the jpeg virtual package exposes
this kind of error.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
