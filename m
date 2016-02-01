From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Mon,  1 Feb 2016 12:37:27 -0300
Subject: [Buildroot] [PATCH] package: aespipe: add host variant
Message-ID: <1454341047-14412-1-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 package/Config.in.host         |  1 +
 package/aespipe/Config.in.host | 10 ++++++++++
 package/aespipe/aespipe.mk     |  1 +
 3 files changed, 12 insertions(+)
 create mode 100644 package/aespipe/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 8e6b870..1c691a3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/aespipe/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
diff --git a/package/aespipe/Config.in.host b/package/aespipe/Config.in.host
new file mode 100644
index 0000000..29f6232
--- /dev/null
+++ b/package/aespipe/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_AESPIPE
+	bool "host aespipe"
+	depends on BR2_USE_MMU # fork()
+	help
+	  aespipe program is AES encrypting or decrypting pipe. It reads from
+	  standard input and writes to standard output. It can be used to
+	  create and restore encrypted tar or cpio archives. It can be used to
+	  encrypt and decrypt loop-AES compatible encrypted disk images.
+
+	  http://koti.tnnet.fi/jari.ruusu/linux/
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index a220688..c567092 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -10,3 +10,4 @@ AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.0
