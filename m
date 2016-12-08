From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2016 00:04:57 +0100
Subject: [Buildroot] [git commit] rpm: add optional dependencies on elfutils
	and binutils
Message-ID: <20161208230509.861517FA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b9fcd7062a5d39603fffb61b3e8e2c0b1932321
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since these are detected by the configure script, we should explicit
their dependencies in rpm.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/rpm.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index accb625..2e829d7 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -65,6 +65,16 @@ else
 RPM_CONF_OPTS += --without-selinux
 endif
 
+# For the elfutils and binutils dependencies, there are no
+# configuration options to explicitly enable/disable them.
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+RPM_DEPENDENCIES += elfutils
+endif
+
+ifeq ($(BR2_PACKAGE_BINUTILS),y)
+RPM_DEPENDENCIES += binutils
+endif
+
 # RPM, when using NLS, requires GNU gettext's _nl_msg_cat_cntr, which is not
 # provided in musl.
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
