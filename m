From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:13 -0400
Subject: [Buildroot] [PATCH v2 22/25] usb_modeswitch_data: install udev
	rules in /usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-23-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 .../usb_modeswitch_data/0002-fix-udev-rules-location.patch  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/usb_modeswitch_data/0002-fix-udev-rules-location.patch

diff --git a/package/usb_modeswitch_data/0002-fix-udev-rules-location.patch b/package/usb_modeswitch_data/0002-fix-udev-rules-location.patch
new file mode 100644
index 0000000..3735af3
--- /dev/null
+++ b/package/usb_modeswitch_data/0002-fix-udev-rules-location.patch
@@ -0,0 +1,13 @@
+diff --git a/Makefile b/Makefile
+index cd42a6f..1b1ff29 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,7 +3,7 @@ VERS        = 20150115
+ RM          = /bin/rm -f
+ PREFIX      = $(DESTDIR)/usr
+ ETCDIR      = $(DESTDIR)/etc
+-RULESDIR    = $(DESTDIR)/lib/udev/rules.d
++RULESDIR    = $(DESTDIR)/usr/lib/udev/rules.d
+ 
+ 
+ .PHONY:     clean
-- 
2.1.0
