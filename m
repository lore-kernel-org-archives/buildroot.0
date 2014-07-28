From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 22:25:13 +0200
Subject: [Buildroot] [git commit] xapp_xconsole: Needs MMU
Message-ID: <20140728202918.28B709D28A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1756b3c5405df7afda438b50904d8b0690e9b2a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/be8/be89847832a2588dbda8dd921edb09b2af130e03/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xconsole/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/Config.in b/package/x11r7/xapp_xconsole/Config.in
index 7863afd..1aaa118 100644
--- a/package/x11r7/xapp_xconsole/Config.in
+++ b/package/x11r7/xapp_xconsole/Config.in
@@ -5,5 +5,6 @@ config BR2_PACKAGE_XAPP_XCONSOLE
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_USE_MMU # fork()
 	help
 	  xconsole - monitor system console messages with X
