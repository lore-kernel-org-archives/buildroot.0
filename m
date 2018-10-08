From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  8 Oct 2018 21:36:46 +0200
Subject: [Buildroot] [PATCH 8/8] perl-type-tiny: new package
In-Reply-To: <20181008193646.13046-1-francois.perrad@gadz.org>
References: <20181008193646.13046-1-francois.perrad@gadz.org>
Message-ID: <20181008193646.13046-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/perl-type-tiny/Config.in           |  7 +++++++
 package/perl-type-tiny/perl-type-tiny.hash |  7 +++++++
 package/perl-type-tiny/perl-type-tiny.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-type-tiny/Config.in
 create mode 100644 package/perl-type-tiny/perl-type-tiny.hash
 create mode 100644 package/perl-type-tiny/perl-type-tiny.mk

diff --git a/package/Config.in b/package/Config.in
index 500266433..9fb6fe02b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -760,6 +760,7 @@ menu "Perl libraries/modules"
 	source "package/perl-time-parsedate/Config.in"
 	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
+	source "package/perl-type-tiny/Config.in"
 	source "package/perl-uri/Config.in"
 	source "package/perl-www-form-urlencoded/Config.in"
 	source "package/perl-www-robotrules/Config.in"
diff --git a/package/perl-type-tiny/Config.in b/package/perl-type-tiny/Config.in
new file mode 100644
index 000000000..ae853efba
--- /dev/null
+++ b/package/perl-type-tiny/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_TYPE_TINY
+	bool "perl-type-tiny"
+	select BR2_PACKAGE_PERL_EXPORTER_TINY
+	help
+	  tiny, yet Moo(se)-compatible type constraint
+
+	  https://metacpan.org/release/Type-Tiny
diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
new file mode 100644
index 000000000..a9e028f87
--- /dev/null
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -0,0 +1,7 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    fad12549fe5b904173e18a05e82e5166 Type-Tiny-1.004002.tar.gz
+sha256 e52c7e9593052aed157a15d473b5c25a1dbb3454bf3cd6913df94cc9bb2be707 Type-Tiny-1.004002.tar.gz
+
+# computed by scancpan
+sha256 0caa5aef37fdb3eddc52419d193df594550c621b84f5990830482f9f8226adde COPYRIGHT
+sha256 c614dadb36b02257ab492e3d4341e52f3f03fe8147cafd2b7da03b3b5c0361e9 LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
new file mode 100644
index 000000000..05259fed7
--- /dev/null
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-type-tiny
+#
+################################################################################
+
+PERL_TYPE_TINY_VERSION = 1.004002
+PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
+PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
+PERL_TYPE_TINY_DEPENDENCIES = perl-exporter-tiny
+PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
+PERL_TYPE_TINY_LICENSE_FILES = COPYRIGHT LICENSE
+
+$(eval $(perl-package))
-- 
2.17.1
