From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Sep 2014 22:49:56 +0200
Subject: [Buildroot] [git commit] xapp_xdpyinfo: depends on MMU
Message-ID: <20140911205338.631EC9D640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27c706afe2e41d3a130e69d3293aae7acd87c8b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes http://autobuild.buildroot.net/results/2da/2dada0264409d8fa6befedbc02c0de77c605a5fa/

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdpyinfo/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index 6584ae1..8527903 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XDPYINFO
 	bool "xdpyinfo"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
