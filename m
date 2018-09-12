From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 22:59:29 +0200
Subject: [Buildroot] [git commit] perl-package-stash: new package
Message-ID: <20180912210051.780F4873EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2da3b2e0cd470964236e268ffb0109e1eb8390d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/perl-package-stash/Config.in               |  8 ++++++++
 package/perl-package-stash/perl-package-stash.hash |  6 ++++++
 package/perl-package-stash/perl-package-stash.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 06df040b84..1441fbd7b3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -505,6 +505,7 @@ F:	package/perl-mime-tools/
 F:	package/perl-module-implementation/
 F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
+F:	package/perl-package-stash/
 F:	package/perl-params-util/
 F:	package/perl-sub-install/
 F:	package/perl-sys-cpu/
diff --git a/package/Config.in b/package/Config.in
index 8b710ef1e8..583e86a94c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -727,6 +727,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-telnet/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-number-bytes-human/Config.in"
+	source "package/perl-package-stash/Config.in"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-sub-install/Config.in"
diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
new file mode 100644
index 0000000000..755850f7b6
--- /dev/null
+++ b/package/perl-package-stash/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_PACKAGE_STASH
+	bool "perl-package-stash"
+	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS
+	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
+	help
+	  routines for manipulating stashes
+
+	  http://metacpan.org/release/Package-Stash
diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
new file mode 100644
index 0000000000..4d9b202879
--- /dev/null
+++ b/package/perl-package-stash/perl-package-stash.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    7e47a8261312e1cf3d12bd2007916b66 Package-Stash-0.37.tar.gz
+sha256 06ab05388f9130cd377c0e1d3e3bafeed6ef6a1e22104571a9e1d7bfac787b2c Package-Stash-0.37.tar.gz
+
+# computed by scancpan
+sha256 b4e0637ed96008ddcbf7e0ddeb73967df3d0b4dc62a6b7fdb86eac37018cb12e LICENSE
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
new file mode 100644
index 0000000000..28dad5ea35
--- /dev/null
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-package-stash
+#
+################################################################################
+
+PERL_PACKAGE_STASH_VERSION = 0.37
+PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
+PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
+PERL_PACKAGE_STASH_DEPENDENCIES = perl-dist-checkconflicts perl-module-implementation
+PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
+PERL_PACKAGE_STASH_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
