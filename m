From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 13 Nov 2012 08:51:47 +0000
Subject: [Buildroot] [PATCH v2] kexec: disable on avr32
Message-ID: <1352796707-9197-1-git-send-email-spdawson@gmail.com>
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
 v2: As suggested by Thomas Petazzoni, don't use a comment to indicate that
     the package is not available on avr32

 package/kexec/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 6f10b89..e59a07b 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
+	depends on !BR2_avr32
 	help
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
-- 
1.7.10.4
