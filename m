From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 14 Mar 2012 10:02:14 +0000
Subject: [Buildroot] [PATCH] fbdump: Make fbdump available only to
	x86/x86_64/arm architectures
Message-ID: <1331719334-12874-1-git-send-email-markos.chandras@imgtec.com>
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
 package/fbdump/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
index fb4aee6..2f8040f 100644
--- a/package/fbdump/Config.in
+++ b/package/fbdump/Config.in
@@ -1,3 +1,4 @@
+if BR2_i386 || BR2_x86_64 || BR2_arm
 config BR2_PACKAGE_FBDUMP
 	bool "fbdump (Framebuffer Capture Tool)"
 	help
@@ -5,4 +6,4 @@ config BR2_PACKAGE_FBDUMP
 	  framebuffer  device and write them out as a PPM file. Currently,
 	  most packed-pixel framebuffer formats and the vga16 framebuffer
 	  are supported.
-
+endif
-- 
1.7.1
