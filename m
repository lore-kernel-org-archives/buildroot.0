From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:39 -0000
Subject: [Buildroot] [git commit] usb_modeswitch_data: add patch to fix
	parallel installation
Message-ID: <20120903200537.E908C800BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbe5b5b7cbb9e6acb6c4984bb5d9a5fe14b73032
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../usb_modeswitch_data-fix-parallel-install.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch b/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
new file mode 100644
index 0000000..ba30499
--- /dev/null
+++ b/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
@@ -0,0 +1,17 @@
+Properly create the directory before creating it so that parallel
+install work fine.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -22,6 +22,7 @@
+ 	install -D --mode=644 40-usb_modeswitch.rules $(RULESDIR)/40-usb_modeswitch.rules
+ 
+ db-install:
++	install -d $(PREFIX)/share/usb_modeswitch
+ 	install --mode=644 -t $(PREFIX)/share/usb_modeswitch ./usb_modeswitch.d/*
+ 
+ db-install-packed:
