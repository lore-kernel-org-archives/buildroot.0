From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:22:16 +0200
Subject: [Buildroot] [git commit] liberation: bump to version 2.00.1
Message-ID: <20150401212227.5F2018191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92988923db3650fe8731644ce48914be2cb9bc59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file and switch license.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liberation/liberation.hash |    2 ++
 package/liberation/liberation.mk   |    7 +++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
new file mode 100644
index 0000000..3432880
--- /dev/null
+++ b/package/liberation/liberation.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	7890278a6cd17873c57d9cd785c2d230d9abdea837e96516019c5885dd271504	liberation-fonts-ttf-2.00.1.tar.gz
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 815aeba..dfed086 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBERATION_VERSION = 1.06.0.20100721
+LIBERATION_VERSION = 2.00.1
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
-# Bump to 2.x changes license!!
-LIBERATION_LICENSE = GPLv2 with exceptions
-LIBERATION_LICENSE_FILES = License.txt
+LIBERATION_LICENSE = OFLv1.1
+LIBERATION_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_LIBERATION_MONO),y)
 define LIBERATION_INSTALL_MONO
