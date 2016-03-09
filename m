From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 22:11:53 +0100
Subject: [Buildroot] [git commit] configs/qemu/x86: enable USB support
Message-ID: <20160309211235.0FC9C7FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bba75771fe1d6dc39f7ebc030b8b8bbf1d3a08ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're not trying to be minimal here, and qemu can bridge/emulate certain
usb devices, so enable the different controllers and at least usb
storage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/x86/linux-4.4.config | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/board/qemu/x86/linux-4.4.config b/board/qemu/x86/linux-4.4.config
index 4dcc995..9cd64f7 100644
--- a/board/qemu/x86/linux-4.4.config
+++ b/board/qemu/x86/linux-4.4.config
@@ -13,12 +13,17 @@ CONFIG_8139CP=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
 CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_DRM=y
-CONFIG_DRM_QXL=y
