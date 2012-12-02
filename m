From: Stephan Hoffmann <sho@relinux.de>
Date: Sun,  2 Dec 2012 18:13:32 +0100
Subject: [Buildroot] [PATCH] skeleton: add /etc/nsswitch.conf
Message-ID: <1354468412-29281-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Toolchain Linaro 2012_09 and possibly other glibc based ones
rely on the existence of nsswitch.conf. If it's missing names
from /etc/hosts are not resolved and thus "localhost" is not
known.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 system/skeleton/etc/nsswitch.conf |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 system/skeleton/etc/nsswitch.conf

diff --git a/system/skeleton/etc/nsswitch.conf b/system/skeleton/etc/nsswitch.conf
new file mode 100644
index 0000000..d81e2f0
--- /dev/null
+++ b/system/skeleton/etc/nsswitch.conf
@@ -0,0 +1,17 @@
+# /etc/nsswitch.conf
+#
+# Example configuration of GNU Name Service Switch functionality.
+# If you have the `glibc-doc-reference' and `info' packages installed, try:
+# `info libc "Name Service Switch"' for information about this file.
+
+passwd:         files
+group:          files
+shadow:         files
+hosts:          files dns
+networks:       files
+
+protocols:      files
+services:       files
+ethers:         files
+rpc:            files
+
-- 
1.7.0.4
