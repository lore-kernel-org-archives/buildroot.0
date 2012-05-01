From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 21:59:07 +0200
Subject: [Buildroot] [git commit] xf86-input-vmmouse: Make
	xf86-input-vmmouse available only to x86/x86_64 architectures
Message-ID: <20120501195941.86F3B96C42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07f41187cc8667c92ea5b27d51ddfc0311fcd0f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xf86-input-vmmouse source code fails to compile intentionally on any
architecture but x86/x86_64. The following error is printed when compiling for a
different architecture:

vmmouse_proto.h:62:2: error: #error The vmmouse protocol is only supported on
x86 architectures.
vmmouse_proto.c:117:2: error: #error "VMMouse is only supported on x86 and
x86-64.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
index 377e7e4..b2284cd 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
 	bool "xf86-input-vmmouse"
+	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
