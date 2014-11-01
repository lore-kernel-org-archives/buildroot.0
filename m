From: Karoly Kasza <kaszak@gmail.com>
Date: Sat,  1 Nov 2014 17:35:55 +0100
Subject: [Buildroot] [PATCH 1/1] xinetd: change to snapshot.debian.org and
	add hash
Message-ID: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xinetd.org seems down quite some time, so change to snapshot.debian.org.
Also add hash.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/xinetd/xinetd.hash |    4 ++++
 package/xinetd/xinetd.mk   |    3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 package/xinetd/xinetd.hash

diff --git a/package/xinetd/xinetd.hash b/package/xinetd/xinetd.hash
new file mode 100644
index 0000000..f656422
--- /dev/null
+++ b/package/xinetd/xinetd.hash
@@ -0,0 +1,4 @@
+# From snapshot.debian.org dsc file
+sha1	168d54aeb181e271e68f4c53847c3e6b2574dba6				xinetd_2.3.15.orig.tar.gz
+sha256	bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3	xinetd_2.3.15.orig.tar.gz
+
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 1fb91b5..7060f0c 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 XINETD_VERSION = 2.3.15
-XINETD_SITE = http://www.xinetd.org
+XINETD_SOURCE = xinetd_$(XINETD_VERSION).orig.tar.gz
+XINETD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/x/xinetd
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
-- 
1.7.10.4
