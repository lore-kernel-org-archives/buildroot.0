From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:23:18 +0200
Subject: [Buildroot] [git commit] perl-devel-stacktrace-ashtml: new package
Message-ID: <20181008082259.72EC38E12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6d0e0f380b5488f13eee88b69f1915f7dcd35ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/perl-devel-stacktrace-ashtml/Config.in             |  7 +++++++
 .../perl-devel-stacktrace-ashtml.hash                      |  6 ++++++
 .../perl-devel-stacktrace-ashtml.mk                        | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0a4322d578..e89899b83e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ menu "Perl libraries/modules"
 	source "package/perl-dbd-mysql/Config.in"
 	source "package/perl-dbi/Config.in"
 	source "package/perl-devel-stacktrace/Config.in"
+	source "package/perl-devel-stacktrace-ashtml/Config.in"
 	source "package/perl-device-serialport/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
diff --git a/package/perl-devel-stacktrace-ashtml/Config.in b/package/perl-devel-stacktrace-ashtml/Config.in
new file mode 100644
index 0000000000..001709a6aa
--- /dev/null
+++ b/package/perl-devel-stacktrace-ashtml/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_DEVEL_STACKTRACE_ASHTML
+	bool "perl-devel-stacktrace-ashtml"
+	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE
+	help
+	  Displays stack trace in HTML
+
+	  https://github.com/miyagawa/Devel-StackTrace-AsHTML
diff --git a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash
new file mode 100644
index 0000000000..4f31c6a1e4
--- /dev/null
+++ b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    4ec8bd92e4a765a7cabf402db9640412 Devel-StackTrace-AsHTML-0.15.tar.gz
+sha256 6283dbe2197e2f20009cc4b449997742169cdd951bfc44cbc6e62c2a962d3147 Devel-StackTrace-AsHTML-0.15.tar.gz
+
+# computed by scancpan
+sha256 ffecf60c52b85d56c928f5eac889b5044243c3907b810ef640c9f02fbce567ac LICENSE
diff --git a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
new file mode 100644
index 0000000000..4f1bc127e8
--- /dev/null
+++ b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-devel-stacktrace-ashtml
+#
+################################################################################
+
+PERL_DEVEL_STACKTRACE_ASHTML_VERSION = 0.15
+PERL_DEVEL_STACKTRACE_ASHTML_SOURCE = Devel-StackTrace-AsHTML-$(PERL_DEVEL_STACKTRACE_ASHTML_VERSION).tar.gz
+PERL_DEVEL_STACKTRACE_ASHTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
+PERL_DEVEL_STACKTRACE_ASHTML_DEPENDENCIES = perl-devel-stacktrace
+PERL_DEVEL_STACKTRACE_ASHTML_LICENSE = Artistic or GPL-1.0+
+PERL_DEVEL_STACKTRACE_ASHTML_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
