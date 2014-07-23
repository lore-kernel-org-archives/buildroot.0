From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 21:45:55 +0200
Subject: [Buildroot] [git commit] perl-datetime-tiny: new package
Message-ID: <20140723194747.B20EC9D2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f3e393663311f1c864eb25bcead5fe499c86f58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/perl-datetime-tiny/Config.in             |    6 ++++++
 package/perl-datetime-tiny/perl-datetime-tiny.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 703fd3d..aa2f783 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -431,6 +431,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
diff --git a/package/perl-datetime-tiny/Config.in b/package/perl-datetime-tiny/Config.in
new file mode 100644
index 0000000..e84db8b
--- /dev/null
+++ b/package/perl-datetime-tiny/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_DATETIME_TINY
+	bool "perl-datetime-tiny"
+	help
+	  A datetime object with as little code as possible
+
+	  https://metacpan.org/release/DateTime-Tiny
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
new file mode 100644
index 0000000..8e691a8
--- /dev/null
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-datetime-tiny
+#
+################################################################################
+
+PERL_DATETIME_TINY_VERSION = 1.04
+PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
+PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK/
+PERL_DATETIME_TINY_DEPENDENCIES = perl
+PERL_DATETIME_TINY_LICENSE = Artistic or GPLv1+
+PERL_DATETIME_TINY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
