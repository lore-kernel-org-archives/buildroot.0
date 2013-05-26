From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 22:42:37 +0200
Subject: [Buildroot] [git commit] aespipe: new package
Message-ID: <20130602212056.A849F9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1b9256d376dd74ec7441d701510995cde3e0042
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/aespipe/Config.in  |    9 +++++++++
 package/aespipe/aespipe.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6b6ce9d..de84d46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -652,6 +652,7 @@ endmenu
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
index 0000000..c901708
--- /dev/null
+++ b/package/aespipe/aespipe.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# aespipe
+#
+#############################################################
+
+AESPIPE_VERSION = 2.4c
+AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
+AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe/
+AESPIPE_LICENSE = GPL
+
+$(eval $(autotools-package))
