From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:22:24 +0200
Subject: [Buildroot] [git commit] perl-devel-stacktrace: new package
Message-ID: <20181008082259.6AD878E12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63dcf704b9efd437701f5478e1b0d127c8e3247d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                        |  1 +
 package/perl-devel-stacktrace/Config.in                  |  6 ++++++
 package/perl-devel-stacktrace/perl-devel-stacktrace.hash |  6 ++++++
 package/perl-devel-stacktrace/perl-devel-stacktrace.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2678ab016b..0a4322d578 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -683,6 +683,7 @@ menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-dbd-mysql/Config.in"
 	source "package/perl-dbi/Config.in"
+	source "package/perl-devel-stacktrace/Config.in"
 	source "package/perl-device-serialport/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
diff --git a/package/perl-devel-stacktrace/Config.in b/package/perl-devel-stacktrace/Config.in
new file mode 100644
index 0000000000..fe6e3e5d7a
--- /dev/null
+++ b/package/perl-devel-stacktrace/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_DEVEL_STACKTRACE
+	bool "perl-devel-stacktrace"
+	help
+	  An object representing a stack trace
+
+	  http://metacpan.org/release/Devel-StackTrace
diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
new file mode 100644
index 0000000000..1fcfb6438d
--- /dev/null
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    1eb6874d834f3d5d15fa626dd726df77 Devel-StackTrace-2.03.tar.gz
+sha256 7618cd4ebe24e254c17085f4b418784ab503cb4cb3baf8f48a7be894e59ba848 Devel-StackTrace-2.03.tar.gz
+
+# computed by scancpan
+sha256 e16dd93533bb65e25fad00d06e88840d9b5fd6bb80d551d8866126c52d89e1de LICENSE
diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
new file mode 100644
index 0000000000..da51fb6c19
--- /dev/null
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-devel-stacktrace
+#
+################################################################################
+
+PERL_DEVEL_STACKTRACE_VERSION = 2.03
+PERL_DEVEL_STACKTRACE_SOURCE = Devel-StackTrace-$(PERL_DEVEL_STACKTRACE_VERSION).tar.gz
+PERL_DEVEL_STACKTRACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
+PERL_DEVEL_STACKTRACE_LICENSE = Artistic-2.0
+PERL_DEVEL_STACKTRACE_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
