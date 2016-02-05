From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Thu,  4 Feb 2016 22:12:52 -0300
Subject: [Buildroot] [PATCH v2] package: aespipe: add host variant
Message-ID: <1454634772-19009-1-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having the host version may allow post-image scripts to encrypt the
resulting image with aespipe (and decrypt it in the update tool on the
target).

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 package/Config.in.host         | 1 +
 package/aespipe/Config.in.host | 9 +++++++++
 package/aespipe/aespipe.mk     | 1 +
 3 files changed, 11 insertions(+)
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
index 0000000..43b5bcf
--- /dev/null
+++ b/package/aespipe/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_AESPIPE
+	bool "host aespipe"
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
