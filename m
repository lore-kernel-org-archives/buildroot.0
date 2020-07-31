From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:33 +0200
Subject: [Buildroot] [PATCH 08/15] package/util-linux: select SELinux module
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-9-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select the fstools SELinux module to be compiled in the policy for the
relevant binaries of util-linux.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/util-linux/util-linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6c8f295eedd9..4779fe766544 100644
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
-- 
2.26.2
