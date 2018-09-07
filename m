From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:48 -0000
Subject: [Buildroot] [git commit] perl-json-maybexs: new package
Message-ID: <20180907111454.B7F897FF08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb3f80f2dea6f71719f521f511c47f049b02493e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/perl-json-maybexs/Config.in              |  6 ++++++
 package/perl-json-maybexs/perl-json-maybexs.hash |  6 ++++++
 package/perl-json-maybexs/perl-json-maybexs.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed5ca12991..e88f951274 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -490,6 +490,7 @@ F:	package/perl-dbi/
 F:	package/perl-device-serialport/
 F:	package/perl-file-slurp/
 F:	package/perl-io-interface/
+F:	package/perl-json-maybexs/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index ac145b3a0f..32a567ca23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -699,6 +699,7 @@ menu "Perl libraries/modules"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-interface/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
+	source "package/perl-json-maybexs/Config.in"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
diff --git a/package/perl-json-maybexs/Config.in b/package/perl-json-maybexs/Config.in
new file mode 100644
index 0000000000..1db82c3684
--- /dev/null
+++ b/package/perl-json-maybexs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_JSON_MAYBEXS
+	bool "perl-json-maybexs"
+	help
+	  Use Cpanel::JSON::XS with a fallback to JSON::XS and JSON::PP
+
+	  https://metacpan.org/release/JSON-MaybeXS
diff --git a/package/perl-json-maybexs/perl-json-maybexs.hash b/package/perl-json-maybexs/perl-json-maybexs.hash
new file mode 100644
index 0000000000..c8bf172aaa
--- /dev/null
+++ b/package/perl-json-maybexs/perl-json-maybexs.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    db61fb5515f8e2f19709a317e26dde42 JSON-MaybeXS-1.004000.tar.gz
+sha256 59bda02e8f4474c73913723c608b539e2452e16c54ed7f0150c01aad06e0a126 JSON-MaybeXS-1.004000.tar.gz
+
+# computed by scancpan
+sha256 d972e00126c5337e88d81d64fc349a3f4c54841075f4180a1145441d30c86f83 README
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
new file mode 100644
index 0000000000..b4eaccddcb
--- /dev/null
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-json-maybexs
+#
+################################################################################
+
+PERL_JSON_MAYBEXS_VERSION = 1.004000
+PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
+PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
+PERL_JSON_MAYBEXS_LICENSE_FILES = README
+
+$(eval $(perl-package))
