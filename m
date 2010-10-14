From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:53:39 +0200
Subject: [Buildroot] [git commit master 1/1] ng-spice-rework: mark as
	deprecated
Message-ID: <20101014185421.85DFA8CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfc76fde1ddcf9205e9cd4f20ff2feb32f52a8e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It hasn't been updated since it got added (in 2008), and it doesn't
build for me, so mark it as deprecated.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                           |    2 +-
 package/ng-spice-rework/Config.in |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1d062e9..19fff54 100644
--- a/CHANGES
+++ b/CHANGES
@@ -56,7 +56,7 @@
 	xdriver-xf86-video-{vmware,voodeo,wsfb,xgi,xgixp},
 	xkeyboard-config, xlib_libX11, xstroke, xterm, xvkbd, zlib
 
-	Deprecated packages: hotplug, lzma
+	Deprecated packages: hotplug, lzma, ng-spice-rework
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
diff --git a/package/ng-spice-rework/Config.in b/package/ng-spice-rework/Config.in
index a82f439..de5d091 100644
--- a/package/ng-spice-rework/Config.in
+++ b/package/ng-spice-rework/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NG_SPICE_REWORK
 	bool "ng-spice-rework"
+	depends on BR2_DEPRECATED
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-- 
1.7.1
