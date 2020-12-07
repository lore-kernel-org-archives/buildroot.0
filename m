From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  7 Dec 2020 11:04:38 +0100
Subject: [Buildroot] [PATCH 1/3] package/perl-devel-cycle: new package
Message-ID: <20201207100443.13727-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-devel-cycle/Config.in             |  6 ++++++
 package/perl-devel-cycle/perl-devel-cycle.hash |  6 ++++++
 package/perl-devel-cycle/perl-devel-cycle.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/perl-devel-cycle/Config.in
 create mode 100644 package/perl-devel-cycle/perl-devel-cycle.hash
 create mode 100644 package/perl-devel-cycle/perl-devel-cycle.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ab1e125f4..6cd52c07c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2509,6 +2509,7 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
+F:	package/perl-devel-cycle/
 F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-lwp-protocol-https/
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..9eddd3ec01 100644
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
-- 
2.26.2
