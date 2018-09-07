From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:50 -0000
Subject: [Buildroot] [git commit] perl-data-optlist: new package
Message-ID: <20180907111457.9A5CF7F950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=701c3ab2059d121da333b45630604cf5418ef2fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/perl-data-optlist/Config.in              | 12 ++++++++++++
 package/perl-data-optlist/perl-data-optlist.hash |  6 ++++++
 package/perl-data-optlist/perl-data-optlist.mk   | 14 ++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 46c0f06637..60b2f2da1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -485,6 +485,7 @@ F:	package/perl-appconfig/
 F:	package/perl-astro-suntime/
 F:	package/perl-class-std/
 F:	package/perl-class-std-fast/
+F:	package/perl-data-optlist/
 F:	package/perl-data-uuid/
 F:	package/perl-date-manip/
 F:	package/perl-dbi/
diff --git a/package/Config.in b/package/Config.in
index 858b781251..c9bc7bec42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-cbc/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
+	source "package/perl-data-optlist/Config.in"
 	source "package/perl-data-uuid/Config.in"
 	source "package/perl-date-manip/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
diff --git a/package/perl-data-optlist/Config.in b/package/perl-data-optlist/Config.in
new file mode 100644
index 0000000000..0393e65645
--- /dev/null
+++ b/package/perl-data-optlist/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_DATA_OPTLIST
+	bool "perl-data-optlist"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_PARAMS_UTIL
+	select BR2_PACKAGE_PERL_SUB_INSTALL
+	help
+	  parse and validate simple name/value option pairs
+
+	  https://github.com/rjbs/Data-OptList
+
+comment "perl-data-optlist needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-data-optlist/perl-data-optlist.hash b/package/perl-data-optlist/perl-data-optlist.hash
new file mode 100644
index 0000000000..93df006486
--- /dev/null
+++ b/package/perl-data-optlist/perl-data-optlist.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    f9236c9ea5607134ad8a2b3dc901c4c5 Data-OptList-0.110.tar.gz
+sha256 366117cb2966473f2559f2f4575ff6ae69e84c69a0f30a0773e1b51a457ef5c3 Data-OptList-0.110.tar.gz
+
+# computed by scancpan
+sha256 73c7bd4c8e4adc474f9dae32b9aa08f6ce27327940751dd6e8373404beabdffa LICENSE
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
new file mode 100644
index 0000000000..ef643cf845
--- /dev/null
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-data-optlist
+#
+################################################################################
+
+PERL_DATA_OPTLIST_VERSION = 0.110
+PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
+PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_DATA_OPTLIST_DEPENDENCIES = perl-params-util perl-sub-install
+PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
+PERL_DATA_OPTLIST_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
