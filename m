From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 22:03:06 +0100
Subject: [Buildroot] [git commit] util-linux: add findfs option
Message-ID: <20160214210631.8D24F80057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5dc580b158f4790197843de1b2128025f83a0c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the findfs utility option for util-linux package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Cc: Zheng Yi <yzheng@techyauld.com>
[Thomas: respect alphabetic ordering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     | 5 +++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index df89f99..3f9a7db 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -91,6 +91,11 @@ config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 	help
 	  Low-level format a floppy disk
 
+config BR2_PACKAGE_UTIL_LINUX_FINDFS
+	bool "findfs"
+	help
+	  Find a filesystem by label or UUID
+
 config BR2_PACKAGE_UTIL_LINUX_FSCK
 	bool "fsck"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f6e5d62..7342174 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -73,6 +73,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_FINDFS),--enable-findfs,--disable-findfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
