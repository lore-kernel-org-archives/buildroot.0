From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Wed, 15 May 2013 12:39:13 +0200
Subject: [Buildroot] [PATCH] aespipe: new package
Message-ID: <519365D1.7090705@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Ziegler <ziggo@zaebos.net>
---
 package/Config.in          |  1 +
 package/aespipe/Config.in  |  9 +++++++++
 package/aespipe/aespipe.mk | 11 +++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/aespipe/Config.in
 create mode 100644 package/aespipe/aespipe.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..e0f0cf4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -649,6 +649,7 @@ endmenu
 endmenu
 
 menu "Miscellaneous"
+source "package/aespipe/Config.in"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
diff --git a/package/aespipe/Config.in b/package/aespipe/Config.in
new file mode 100644
index 0000000..ccc94c2
--- /dev/null
+++ b/package/aespipe/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_AESPIPE
+	bool "aespipe"
+	help
+	  aespipe program is AES encrypting or decrypting pipe. It reads from
+	  standard input and writes to standard output. It can be used to
+	  create and restore encrypted tar or cpio archives. It can be used to
+	  encrypt and decrypt loop-AES compatible encrypted disk images.
+
+	  http://koti.tnnet.fi/jari.ruusu/linux/
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
new file mode 100644
index 0000000..6d1b5d5
--- /dev/null
+++ b/package/aespipe/aespipe.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# aespipe 
+#
+#############################################################
+AESPIPE_VERSION = 2.4c
+AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
+AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe/
+AESPIPE_LICENSE = GPL
+
+$(eval $(autotools-package))
-- 
1.8.1.2


-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
