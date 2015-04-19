From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:40:53 +0200
Subject: [Buildroot] [git commit] perl-digest-hmac: New package
Message-ID: <20150419094110.95CD87FF00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7553eac7a8a289964f2307f905a3c5d3990c872b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |    1 +
 package/perl-digest-hmac/Config.in             |    6 ++++++
 package/perl-digest-hmac/perl-digest-hmac.hash |    3 +++
 package/perl-digest-hmac/perl-digest-hmac.mk   |   14 ++++++++++++++
 4 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 34b6017..e8dd4cb 100644
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
