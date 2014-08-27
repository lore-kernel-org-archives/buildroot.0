From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Aug 2014 22:19:59 +0200
Subject: [Buildroot] [git commit] xapp_luit: needs MMU
Message-ID: <20140827202154.874079D55D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=779cb8be9e378158d4c3796391a514d3fb3b3b59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/13a/13a97461e3b6098e59cfcd829e6bcafa51e50bb4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_luit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
index aec83a0..3e314de 100644
--- a/package/x11r7/xapp_luit/Config.in
+++ b/package/x11r7/xapp_luit/Config.in
@@ -2,5 +2,6 @@ config BR2_PACKAGE_XAPP_LUIT
 	bool "luit"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
+	depends on BR2_USE_MMU # fork()
 	help
 	  Locale and ISO 2022 support for Unicode terminals
