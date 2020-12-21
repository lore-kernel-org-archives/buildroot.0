From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:28:20 +0100
Subject: [Buildroot] [git commit] package/perl-devel-cycle: new package
Message-ID: <20201221091743.BE6A58812E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37faba7436c3e7b174955c04e272e8e56be743eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-devel-cycle/Config.in             |  6 ++++++
 package/perl-devel-cycle/perl-devel-cycle.hash |  6 ++++++
 package/perl-devel-cycle/perl-devel-cycle.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9406f30cd5..a8a1306b1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2510,6 +2510,7 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
+F:	package/perl-devel-cycle/
 F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-lwp-protocol-https/
diff --git a/package/Config.in b/package/Config.in
index dc7139a49a..691fafceb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -739,6 +739,7 @@ menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-dbd-mysql/Config.in"
 	source "package/perl-dbi/Config.in"
+	source "package/perl-devel-cycle/Config.in"
 	source "package/perl-devel-globaldestruction/Config.in"
 	source "package/perl-devel-stacktrace/Config.in"
 	source "package/perl-devel-stacktrace-ashtml/Config.in"
diff --git a/package/perl-devel-cycle/Config.in b/package/perl-devel-cycle/Config.in
new file mode 100644
index 0000000000..7561f65fb2
--- /dev/null
+++ b/package/perl-devel-cycle/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_DEVEL_CYCLE
+	bool "perl-devel-cycle"
+	help
+	  Find memory cycles in objects.
+
+	  https://metacpan.org/release/Devel-Cycle
diff --git a/package/perl-devel-cycle/perl-devel-cycle.hash b/package/perl-devel-cycle/perl-devel-cycle.hash
new file mode 100644
index 0000000000..e7a93fde91
--- /dev/null
+++ b/package/perl-devel-cycle/perl-devel-cycle.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  3d9a963da87b17398fab9acbef63f277  Devel-Cycle-1.12.tar.gz
+sha256  fd3365c4d898b2b2bddbb78a46d507a18cca8490a290199547dab7f1e7390bc2  Devel-Cycle-1.12.tar.gz
+
+# computed by scancpan
+sha256  e47dfab3e7e9d20fe6313169ead2736ab97f1388003eee033dd934278649034d  README
diff --git a/package/perl-devel-cycle/perl-devel-cycle.mk b/package/perl-devel-cycle/perl-devel-cycle.mk
new file mode 100644
index 0000000000..0599e1c3a5
--- /dev/null
+++ b/package/perl-devel-cycle/perl-devel-cycle.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-devel-cycle
+#
+################################################################################
+
+PERL_DEVEL_CYCLE_VERSION = 1.12
+PERL_DEVEL_CYCLE_SOURCE = Devel-Cycle-$(PERL_DEVEL_CYCLE_VERSION).tar.gz
+PERL_DEVEL_CYCLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
+PERL_DEVEL_CYCLE_LICENSE = Artistic or GPL-1.0+
+PERL_DEVEL_CYCLE_LICENSE_FILES = README
+PERL_DEVEL_CYCLE_DISTNAME = Devel-Cycle
+
+$(eval $(perl-package))
