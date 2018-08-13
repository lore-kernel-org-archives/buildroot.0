From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 11:46:44 +0200
Subject: [Buildroot] [git commit branch/next] perl-number-bytes-human: new
 package
Message-ID: <20180813094337.E1C298A437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1c0bc1f56518f1db52365aca195c50d73ceeaab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                  |  1 +
 package/Config.in                                           |  1 +
 package/perl-number-bytes-human/Config.in                   |  6 ++++++
 .../perl-number-bytes-human/perl-number-bytes-human.hash    |  6 ++++++
 package/perl-number-bytes-human/perl-number-bytes-human.mk  | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 91659b364b..3b55b679c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -492,6 +492,7 @@ F:	package/perl-file-slurp/
 F:	package/perl-io-interface/
 F:	package/perl-json-maybexs/
 F:	package/perl-module-runtime/
+F:	package/perl-number-bytes-human/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 4a6fd22238..feaa289aa0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -718,6 +718,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-net-telnet/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
+	source "package/perl-number-bytes-human/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-timedate/Config.in"
diff --git a/package/perl-number-bytes-human/Config.in b/package/perl-number-bytes-human/Config.in
new file mode 100644
index 0000000000..ca43873d49
--- /dev/null
+++ b/package/perl-number-bytes-human/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_NUMBER_BYTES_HUMAN
+	bool "perl-number-bytes-human"
+	help
+	  Convert byte count to human readable format
+
+	  https://metacpan.org/release/Number-Bytes-Human
diff --git a/package/perl-number-bytes-human/perl-number-bytes-human.hash b/package/perl-number-bytes-human/perl-number-bytes-human.hash
new file mode 100644
index 0000000000..af7a6b65a1
--- /dev/null
+++ b/package/perl-number-bytes-human/perl-number-bytes-human.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    43d2c86a55924aa71535a41de0311efd Number-Bytes-Human-0.11.tar.gz
+sha256 5fc79c49b0b40df780479c43696381343e2b6ad1fe52859f60bc65b66ebe6f2c Number-Bytes-Human-0.11.tar.gz
+
+# computed by scancpan
+sha256 d42143fe4b63cb5d488d65a44e6c55769b098ea447462ff33316b33a837b7cf9 README
diff --git a/package/perl-number-bytes-human/perl-number-bytes-human.mk b/package/perl-number-bytes-human/perl-number-bytes-human.mk
new file mode 100644
index 0000000000..e10c550eed
--- /dev/null
+++ b/package/perl-number-bytes-human/perl-number-bytes-human.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-number-bytes-human
+#
+################################################################################
+
+PERL_NUMBER_BYTES_HUMAN_VERSION = 0.11
+PERL_NUMBER_BYTES_HUMAN_SOURCE = Number-Bytes-Human-$(PERL_NUMBER_BYTES_HUMAN_VERSION).tar.gz
+PERL_NUMBER_BYTES_HUMAN_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FE/FERREIRA
+PERL_NUMBER_BYTES_HUMAN_LICENSE = Artistic or GPL-1.0+
+PERL_NUMBER_BYTES_HUMAN_LICENSE_FILES = README
+
+$(eval $(perl-package))
