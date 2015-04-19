From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:45 +0200
Subject: [Buildroot] [git commit] package/perl-mail-dkim: new package
Message-ID: <20150419114640.EF8E581940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbbc6e0b5ea25dae26f3cd2f9134ad1b2272c4f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/perl-mail-dkim/Config.in           |   13 +++++++++++++
 package/perl-mail-dkim/perl-mail-dkim.hash |    3 +++
 package/perl-mail-dkim/perl-mail-dkim.mk   |   12 ++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b80eb19..f758155 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -525,6 +525,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
+	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-mail-dkim/Config.in b/package/perl-mail-dkim/Config.in
new file mode 100644
index 0000000..3db54f3
--- /dev/null
+++ b/package/perl-mail-dkim/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PERL_MAIL_DKIM
+	bool "perl-mail-dkim"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
+	select BR2_PACKAGE_PERL_MAILTOOLS
+	select BR2_PACKAGE_PERL_NET_DNS
+	help
+	  Signs/verifies Internet mail with DKIM/DomainKey signatures
+
+	  https://metacpan.org/release/Mail-DKIM
+
+comment "perl-mail-dkim needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
new file mode 100644
index 0000000..b6bb545
--- /dev/null
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9ceb8a0397aff83928e7a9760b1b190f Mail-DKIM-0.40.tar.gz
+sha256 3c5ea0c3a2028a5a2c3b64bbcd6bd9de6a5fa5ee4e16046dd8875c4796aaa6f1 Mail-DKIM-0.40.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
new file mode 100644
index 0000000..7f00299
--- /dev/null
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-mail-dkim
+#
+################################################################################
+
+PERL_MAIL_DKIM_VERSION = 0.40
+PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
+PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JA/JASLONG
+PERL_MAIL_DKIM_DEPENDENCIES = perl perl-crypt-openssl-rsa perl-mailtools perl-net-dns
+
+$(eval $(perl-package))
