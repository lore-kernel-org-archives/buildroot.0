From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Dec 2012 16:32:16 -0800
Subject: [Buildroot] [git commit] skeleton: add /etc/nsswitch.conf
Message-ID: <20121203010304.648BF996F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c52ff1acfb2953f1ac40cdce4387b7d1d8cef14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Toolchain Linaro 2012_09 and possibly other glibc based ones
rely on the existence of nsswitch.conf. If it's missing names
from /etc/hosts are not resolved and thus "localhost" is not
known.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/skeleton/etc/nsswitch.conf |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

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
