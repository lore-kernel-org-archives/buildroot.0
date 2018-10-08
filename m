From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:11:41 +0200
Subject: [Buildroot] [git commit] perl-module-build-tiny: new package
Message-ID: <20181008101250.546AD8E2C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49258af1e2cb88330a8e4c337f112b38d35fe17c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the host variant is added, which is needed as a build dependency
of perl-apache-logformat-compiler.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-build-tiny/perl-module-build-tiny.hash |  6 ++++++
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
new file mode 100644
index 0000000000..357c238dd3
--- /dev/null
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    2332c90c17454107fea3f2614e11a3a9 Module-Build-Tiny-0.039.tar.gz
+sha256 7d580ff6ace0cbe555bf36b86dc8ea232581530cbeaaea09bccb57b55797f11c Module-Build-Tiny-0.039.tar.gz
+
+# computed by scancpan
+sha256 09fd2bc0428920c455f10c5a6c52e2bb4615114e88966c75ce27a07af028c36b LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
new file mode 100644
index 0000000000..890fdc7355
--- /dev/null
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-module-build-tiny
+#
+################################################################################
+
+PERL_MODULE_BUILD_TINY_VERSION = 0.039
+PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
+PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = host-perl-extutils-config host-perl-extutils-helpers host-perl-extutils-installpaths
+PERL_MODULE_BUILD_TINY_LICENSE = Artistic or GPL-1.0+
+PERL_MODULE_BUILD_TINY_LICENSE_FILES = LICENSE
+
+$(eval $(host-perl-package))
