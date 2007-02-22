From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 22 Feb 2007 11:37:45 +0100
Subject: [Buildroot] Building Xorg for arm926t softfloat fails with error at
	linux_vm86.c
Message-ID: <80b317760702220237j2bd115d8tf1de6985a8887601@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank !
if I remember correctly, you should add
#define XF86INT10_BUILD       X86EMU_GENERIC
in the file build_arm/xc/config/cf/host.def

the patch for package/xorg/xorg-config.patch is :
[snip]
--- a/package/xorg/xorg-config.patch    2007-02-09 15:55:37.000000000 +0100
+++ b/package/xorg/xorg-config.patch    2007-02-22 11:33:27.000000000 +0100
@@ -1,6 +1,7 @@
 --- xc/config/cf/host.def~     Thu May 12 15:28:01 MDT 2005
 +++ xc/config/cf/host.def      Thu May 12 15:28:01 MDT 2005
-@@ -0,0 +1,45 @@
+@@ -0,0 +1,46 @@
++#define XF86INT10_BUILD       X86EMU_GENERIC
 +#define KDriveXServer         YES
 +#define TinyXServer           YES
 +#define XfbdevServer          YES
[snip]

regards,
Richard Genoud
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070222/21971630/attachment.html 
