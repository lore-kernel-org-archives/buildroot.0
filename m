From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:44 +0200
Subject: [Buildroot] [git commit] package/perl-file-listing: New package
Message-ID: <20150419114640.3DF737FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e6e868a09c4ba033e5f828747034741cdb78677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/perl-file-listing/Config.in              |    7 +++++++
 package/perl-file-listing/perl-file-listing.hash |    3 +++
 package/perl-file-listing/perl-file-listing.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f091923..883f7e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-encode-locale/Config.in"
+	source "package/perl-file-listing/Config.in"
 	source "package/perl-file-util/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
diff --git a/package/perl-file-listing/Config.in b/package/perl-file-listing/Config.in
new file mode 100644
index 0000000..85f8e2e
--- /dev/null
+++ b/package/perl-file-listing/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_FILE_LISTING
+	bool "perl-file-listing"
+	select BR2_PACKAGE_PERL_HTTP_DATE
+	help
+	  Module to parse directoy listings
+
+	  https://github.com/gisle/file-listing
diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
new file mode 100644
index 0000000..1549c5a
--- /dev/null
+++ b/package/perl-file-listing/perl-file-listing.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    83f636b477741f3a014585bb9cc079a6 File-Listing-6.04.tar.gz
+sha256 1e0050fcd6789a2179ec0db282bf1e90fb92be35d1171588bd9c47d52d959cf5 File-Listing-6.04.tar.gz
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
new file mode 100644
index 0000000..a9d8ced
--- /dev/null
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-file-listing
+#
+################################################################################
+
+PERL_FILE_LISTING_VERSION = 6.04
+PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
+PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_FILE_LISTING_DEPENDENCIES = perl-http-date
+PERL_FILE_LISTING_LICENSE = Artistic or GPLv1+
+PERL_FILE_LISTING_LICENSE_FILES = README
+
+$(eval $(perl-package))
