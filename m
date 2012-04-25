From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 25 Apr 2012 16:49:02 +0100
Subject: [Buildroot] [PATCH v2] xf86-input-vmmouse: Make xf86-input-vmmouse
	available only to x86/x86_64 architectures
Message-ID: <1335368942-20039-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The xf86-input-vmmouse source code fails to compile intentionally on any
architecture but x86/x86_64. The following error is printed when compiling for a
different architecture:

vmmouse_proto.h:62:2: error: #error The vmmouse protocol is only supported on
x86 architectures.
vmmouse_proto.c:117:2: error: #error "VMMouse is only supported on x86 and
x86-64.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
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
-- 
1.7.1
