From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 14 Mar 2012 10:40:59 +0000
Subject: [Buildroot] [PATCH] fbdump: Make fbdump available only to
	x86/x86_64/arm architectures
Message-ID: <1331721659-27360-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fbdump uses the ioperm() syscall which is only implemented in
x86/x86_64. The rest of the architectures map ioperm() to
sys_ni_syscall which is the default function for the unimplemented
syscalls. Moreover, ARM has its own ioperm() implementation
in uClibc.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/fbdump/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
index fb4aee6..1129134 100644
--- a/package/fbdump/Config.in
+++ b/package/fbdump/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_FBDUMP
 	bool "fbdump (Framebuffer Capture Tool)"
+	depends on BR_i386 || BR2_x86_64 || BR2_arm
 	help
 	  fbdump is a simple tool to capture snapshots from the Linux kernel
 	  framebuffer  device and write them out as a PPM file. Currently,
 	  most packed-pixel framebuffer formats and the vga16 framebuffer
 	  are supported.
-
-- 
1.7.1
