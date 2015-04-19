From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:14 +0200
Subject: [Buildroot] [PATCH 01/20] perl-digest-hmac: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                              |    1 +
 package/perl-digest-hmac/Config.in             |    6 ++++++
 package/perl-digest-hmac/perl-digest-hmac.hash |    3 +++
 package/perl-digest-hmac/perl-digest-hmac.mk   |   14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/perl-digest-hmac/Config.in
 create mode 100644 package/perl-digest-hmac/perl-digest-hmac.hash
 create mode 100644 package/perl-digest-hmac/perl-digest-hmac.mk

diff --git a/package/Config.in b/package/Config.in
index 86d9435..33456e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-file-util/Config.in"
+	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
diff --git a/package/perl-digest-hmac/Config.in b/package/perl-digest-hmac/Config.in
new file mode 100644
index 0000000..733a53d
--- /dev/null
+++ b/package/perl-digest-hmac/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_DIGEST_HMAC
+	bool "perl-digest-hmac"
+	help
+	  Digest::HMAC - Keyed-Hashing for Message Authentication
+
+	  https://github.com/gisle/digest-hmac
diff --git a/package/perl-digest-hmac/perl-digest-hmac.hash b/package/perl-digest-hmac/perl-digest-hmac.hash
new file mode 100644
index 0000000..018e4eb
--- /dev/null
+++ b/package/perl-digest-hmac/perl-digest-hmac.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e6a5d6f552da16eacb5157ea4369ff9d Digest-HMAC-1.03.tar.gz
+sha256 3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96da4a59 Digest-HMAC-1.03.tar.gz
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
new file mode 100644
index 0000000..97ec43e
--- /dev/null
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-digest-hmac
+#
+################################################################################
+
+PERL_DIGEST_HMAC_VERSION = 1.03
+PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
+PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DIGEST_HMAC_DEPENDENCIES = perl
+PERL_DIGEST_HMAC_LICENSE = Artistic or GPLv1+
+PERL_DIGEST_HMAC_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4
