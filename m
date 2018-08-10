From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:55 -0700
Subject: [Buildroot] [PATCH 11/18] perl-json-maybexs: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-12-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                                |  1 +
 package/perl-json-maybexs/Config.in              |  6 ++++++
 package/perl-json-maybexs/perl-json-maybexs.hash |  6 ++++++
 package/perl-json-maybexs/perl-json-maybexs.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-json-maybexs/Config.in
 create mode 100644 package/perl-json-maybexs/perl-json-maybexs.hash
 create mode 100644 package/perl-json-maybexs/perl-json-maybexs.mk

diff --git a/package/Config.in b/package/Config.in
index 13a1b60588..40964d3406 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ menu "Perl libraries/modules"
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
-- 
2.14.4
