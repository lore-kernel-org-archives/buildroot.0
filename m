From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:12 -0400
Subject: [Buildroot] [PATCH v2 21/25] usb_modeswitch: fix udev location
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-22-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/usb_modeswitch/0001-fix-udev-location.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/usb_modeswitch/0001-fix-udev-location.patch

diff --git a/package/usb_modeswitch/0001-fix-udev-location.patch b/package/usb_modeswitch/0001-fix-udev-location.patch
new file mode 100644
index 0000000..1ae78a2
--- /dev/null
+++ b/package/usb_modeswitch/0001-fix-udev-location.patch
@@ -0,0 +1,13 @@
+diff --git a/Makefile b/Makefile
+index 1e77765..f9c8d58 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,7 +9,7 @@ PREFIX      = $(DESTDIR)/usr
+ ETCDIR      = $(DESTDIR)/etc
+ SYSDIR      = $(ETCDIR)/systemd/system
+ UPSDIR      = $(ETCDIR)/init
+-UDEVDIR     = $(DESTDIR)/lib/udev
++UDEVDIR     = $(DESTDIR)/usr/lib/udev
+ SBINDIR     = $(PREFIX)/sbin
+ MANDIR      = $(PREFIX)/share/man/man1
+ VPATH       = jimtcl
-- 
2.1.0
