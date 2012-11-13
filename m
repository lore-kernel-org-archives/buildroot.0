From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 13 Nov 2012 08:01:45 +0000
Subject: [Buildroot] [PATCH] kexec: disable on avr32
Message-ID: <1352793705-30377-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

kexec does not support the avr32 architecture; this results in autobuilder
failures such as the following.

  http://autobuild.buildroot.net/results/5f5e91c3eb622bce88402a9afc8a3e7bd5007136/build-end.log

This patch disables support for the kexec package on the avr32 architecture.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/kexec/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 6f10b89..98514d9 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
+	depends on !BR2_avr32
 	help
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
 
 	  http://www.kernel.org/pub/linux/kernel/people/horms/kexec-tools/
 
+comment "kexec is not supported on avr32"
+	depends on BR2_avr32
+
 config BR2_PACKAGE_KEXEC_ZLIB
 	bool "zlib support"
 	depends on BR2_PACKAGE_KEXEC
-- 
1.7.10.4
