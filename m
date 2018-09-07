From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:45 -0000
Subject: [Buildroot] [git commit] perl-date-manip: new package
Message-ID: <20180907111452.D7A317FF08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce9255381a144678c0e7672e98e45a585e4a5153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-date-manip/Config.in            |  6 ++++++
 package/perl-date-manip/perl-date-manip.hash |  6 ++++++
 package/perl-date-manip/perl-date-manip.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc2ce25eea..ab25a63677 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -485,6 +485,7 @@ F:	package/perl-appconfig/
 F:	package/perl-astro-suntime/
 F:	package/perl-class-std/
 F:	package/perl-data-uuid/
+F:	package/perl-date-manip/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index f5ad068b6f..461a004ef3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-data-uuid/Config.in"
+	source "package/perl-date-manip/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
diff --git a/package/perl-date-manip/Config.in b/package/perl-date-manip/Config.in
new file mode 100644
index 0000000000..cbfb5c5b30
--- /dev/null
+++ b/package/perl-date-manip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_DATE_MANIP
+	bool "perl-date-manip"
+	help
+	  Date manipulation routines
+
+	  https://metacpan.org/release/Date-Manip
diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
new file mode 100644
index 0000000000..f02f657822
--- /dev/null
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b41b0d476fd7eae3ce81324386266a85 Date-Manip-6.72.tar.gz
+sha256 38f4dd9d94b41092ca7b9da2ef72c3bb8b8c8bff6da14d785c612f3cc7a94da6 Date-Manip-6.72.tar.gz
+
+# computed by scancpan
+sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
new file mode 100644
index 0000000000..a5e1609a88
--- /dev/null
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-date-manip
+#
+################################################################################
+
+PERL_DATE_MANIP_VERSION = 6.72
+PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
+PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
+PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
+PERL_DATE_MANIP_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
