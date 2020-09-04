From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:07:42 +0200
Subject: [Buildroot] [git commit] package/util-linux: select SELinux module
Message-ID: <20200904123951.C29F68185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8408634b9f0883ae299a0441554b93b1f20953b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the fstools SELinux module to be compiled in the policy for the
relevant binaries of util-linux.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/util-linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3aa51f24fb..4356b2b569 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -43,6 +43,10 @@ HOST_UTIL_LINUX_CONF_OPTS = \
 	--with-systemdsystemunitdir=no \
 	--without-python
 
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_CRAMFS)$(BR2_PACKAGE_UTIL_LINUX_FSCK)$(BR2_PACKAGE_UTIL_LINUX_LOSETUP),)
+UTIL_LINUX_SELINUX_MODULES = fstools
+endif
+
 # Prevent the installation from attempting to move shared libraries from
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
 # the same when merged usr is in use.
