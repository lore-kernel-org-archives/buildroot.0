From: Will Newton <will.newton@gmail.com>
Date: Fri, 24 May 2013 14:46:46 +0100
Subject: [Buildroot] [PATCH] weston: Add make dependency on cairo.
Message-ID: <CAFbHwiSv5n4gR-TgmcvFvEiRPdSy-PxeMb0k+nG3OQxWU16=9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's already a config dependency, make sure we build it too.

Signed-off-by: Will Newton <will.newton@linaro.org>
---
 package/weston/weston.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 4e7cada..b6827db 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,8 @@ WESTON_SOURCE = weston-$(WAYLAND_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING

-WESTON_DEPENDENCIES = wayland libxkbcommon pixman libpng jpeg mtdev udev
+WESTON_DEPENDENCIES = wayland libxkbcommon pixman libpng \
+    jpeg mtdev udev cairo
 WESTON_CONF_OPT = \
     --disable-egl \
     --disable-xwayland \
--
1.8.1.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-weston-Add-make-dependency-on-cairo.patch
Type: application/octet-stream
Size: 925 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130524/b01d813e/attachment.obj>
