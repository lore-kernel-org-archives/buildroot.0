From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:45 +0200
Subject: [Buildroot] [git commit] package/perl-mailtools: new package
Message-ID: <20150419114640.E59EF81940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb81914e95dccc54141dc18122c053612b71e838
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/perl-mailtools/Config.in           |    7 +++++++
 package/perl-mailtools/perl-mailtools.hash |    3 +++
 package/perl-mailtools/perl-mailtools.mk   |   13 +++++++++++++
 4 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8e04222..b80eb19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -525,6 +525,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
+	source "package/perl-mailtools/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
diff --git a/package/perl-mailtools/Config.in b/package/perl-mailtools/Config.in
new file mode 100644
index 0000000..e02d3cb
--- /dev/null
+++ b/package/perl-mailtools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_MAILTOOLS
+	bool "perl-mailtools"
+	select BR2_PACKAGE_PERL_TIMEDATE
+	help
+	  Various e-mail related modules
+
+	  https://metacpan.org/release/MailTools
diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
new file mode 100644
index 0000000..b67867a
--- /dev/null
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    813ae849683367bb75e6be89e4e8cc46 MailTools-2.14.tar.gz
+sha256 4b7c7ef674b2ef75ea793f053cd067c6a4b33e58e3adf08a89c8ea4c56b3dff8 MailTools-2.14.tar.gz
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
new file mode 100644
index 0000000..5b11625
--- /dev/null
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-mailtools
+#
+################################################################################
+
+PERL_MAILTOOLS_VERSION = 2.14
+PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
+PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
+PERL_MAILTOOLS_DEPENDENCIES = perl perl-timedate
+PERL_MAILTOOLS_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
