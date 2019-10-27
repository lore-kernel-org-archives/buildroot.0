From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:08:47 +0100
Subject: [Buildroot] [git commit] package/linux-zigbee: use official tarball
Message-ID: <20191027090233.2571E88EED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e90abe97a8c496242a41a686bff0683854fd71b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball instead of using git
- Add linux-zigbee.hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-zigbee/linux-zigbee.hash | 3 +++
 package/linux-zigbee/linux-zigbee.mk   | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/linux-zigbee/linux-zigbee.hash b/package/linux-zigbee/linux-zigbee.hash
new file mode 100644
index 0000000000..f337038855
--- /dev/null
+++ b/package/linux-zigbee/linux-zigbee.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	92fbefdf18d45147c2b78ca2ce2d899d4d1da5a3391a4ff6c51a5b14c6d6f87c	lowpan-tools-0.3.1.tar.gz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
diff --git a/package/linux-zigbee/linux-zigbee.mk b/package/linux-zigbee/linux-zigbee.mk
index 8d3248f2e1..53089e160c 100644
--- a/package/linux-zigbee/linux-zigbee.mk
+++ b/package/linux-zigbee/linux-zigbee.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-LINUX_ZIGBEE_VERSION = v0.3.1
-LINUX_ZIGBEE_SITE = git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee
+LINUX_ZIGBEE_VERSION = 0.3.1
+LINUX_ZIGBEE_SOURCE = lowpan-tools-$(LINUX_ZIGBEE_VERSION).tar.gz
+LINUX_ZIGBEE_SITE = \
+	http://downloads.sourceforge.net/project/linux-zigbee/linux-zigbee-sources/$(LINUX_ZIGBEE_VERSION)
 LINUX_ZIGBEE_LICENSE = GPL-2.0
 LINUX_ZIGBEE_LICENSE_FILES = COPYING
 LINUX_ZIGBEE_DEPENDENCIES = libnl host-pkgconf host-flex host-bison
