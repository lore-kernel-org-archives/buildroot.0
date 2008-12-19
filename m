From: Dan Lykowski <lykowdk@gmail.com>
Date: Fri, 19 Dec 2008 15:45:48 -0800
Subject: [Buildroot] [PATCH] Fixes problem with pkg-config and building xorg
	drivers
Message-ID: <494C322C.8070903@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add this file to your xserver package directory.

If you have  PKG_CONFIG_ALLOW_SYSTEM_CFLAGS  or 
PKG_CONFIG_ALLOW_SYSTEM_LIBS defined
pkg-config will substitute sysroot for every instance of /usr/include, 
/usr/lib/, etc.

When calling pkg-config xorg-xserver it would return a mangled path to 
/usr/include/pixman-1.
This patch copies what is done in xserver-1.5.

Dan Lykowski
Dynon Avionics
-------------- next part --------------
A non-text attachment was scrubbed...
Name: xserver_xorg-server-1.4-pkgconfig-fix.patch
Type: text/x-diff
Size: 317 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081219/a7fc0cc8/attachment.bin 
