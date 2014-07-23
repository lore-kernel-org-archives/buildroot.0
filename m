From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 21:47:08 +0200
Subject: [Buildroot] [git commit] perl-path-tiny: new package
Message-ID: <20140723194747.C66319D2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e8d33238ec896cf0e838a86cdd0c4f412f22485
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/perl-path-tiny/Config.in         |    6 ++++++
 package/perl-path-tiny/perl-path-tiny.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b89a98e..40d8ba9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -439,6 +439,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
+	source "package/perl-path-tiny/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax-base/Config.in"
diff --git a/package/perl-path-tiny/Config.in b/package/perl-path-tiny/Config.in
new file mode 100644
index 0000000..f85e792
--- /dev/null
+++ b/package/perl-path-tiny/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_PATH_TINY
+	bool "perl-path-tiny"
+	help
+	  File path utility
+
+	  https://github.com/dagolden/Path-Tiny
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
new file mode 100644
index 0000000..9c20e74
--- /dev/null
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-path-tiny
+#
+################################################################################
+
+PERL_PATH_TINY_VERSION = 0.055
+PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
+PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN/
+PERL_PATH_TINY_DEPENDENCIES = perl
+PERL_PATH_TINY_LICENSE = Apache-2.0
+PERL_PATH_TINY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
