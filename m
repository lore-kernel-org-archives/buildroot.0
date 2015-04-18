From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 18:39:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-keyboard:
	Fix compile error
Message-ID: <1429375169-23279-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lnx_kbd.c: In function 'OpenKeyboard':
lnx_kbd.c:194:8: error: implicit declaration of function 'getpgid' [-Werror=implicit-function-declaration]
        rc = tcsetpgrp(pInfo->fd, getpgid(0));
        ^
lnx_kbd.c:194:8: warning: nested extern declaration of 'getpgid' [-Wnested-externs]
cc1: some warnings being treated as errors

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk  |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index 209f44a..eb2d582 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -10,5 +10,6 @@ XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individu
 XDRIVER_XF86_INPUT_KEYBOARD_LICENSE = MIT
 XDRIVER_XF86_INPUT_KEYBOARD_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_KEYBOARD_CONF_OPTS = --disable-selective-werror
 
 $(eval $(autotools-package))
-- 
1.7.10.4
