From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 19:07:53 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-keyboard:
	Fix compile error
Message-ID: <20150418170843.54F6580E0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f866eb24b807a2a9055fda7561e835452dca8ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lnx_kbd.c: In function 'OpenKeyboard':
lnx_kbd.c:194:8: error: implicit declaration of function 'getpgid' [-Werror=implicit-function-declaration]
        rc = tcsetpgrp(pInfo->fd, getpgid(0));
        ^
lnx_kbd.c:194:8: warning: nested extern declaration of 'getpgid' [-Wnested-externs]
cc1: some warnings being treated as errors

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-keyboard.mk                 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
