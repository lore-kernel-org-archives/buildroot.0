From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Jul 2015 22:25:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-input-synaptics:
	depends on libevdev
In-Reply-To: <1438374309-1902-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438374309-1902-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438374309-1902-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/05e/05ecfaf591e85a20071875ecd18068762193defa/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-input-synaptics/Config.in                    | 1 +
 .../x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index 6b5e5b6..ffe1a2a 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	bool "xf86-input-synaptics"
+	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index f180405..28663d1 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto mtdev
+XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto mtdev
 
 $(eval $(autotools-package))
-- 
2.1.4
