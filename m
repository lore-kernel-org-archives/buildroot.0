From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:36:18 +0200
Subject: [Buildroot] [git commit] scancpan: adjust package name
Message-ID: <20150723203819.197FB7FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e9d322a111ba776f54d87fb523cd37d3cf793ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

underscore is not allowed in BR package name.
this problem was found with the Perl module DB_File
which must give the BR package perl-db-file.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-db-file/Config.in       |    2 +-
 package/perl-db-file/perl-db-file.mk |    2 +-
 support/scripts/scancpan             |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/perl-db-file/Config.in b/package/perl-db-file/Config.in
index 18daec3..37bc5da 100644
--- a/package/perl-db-file/Config.in
+++ b/package/perl-db-file/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_PERL_DB_FILE
 
 	  https://metacpan.org/release/DB_File
 
-comment "perl-db_file needs a toolchain w/ dynamic library"
+comment "perl-db-file needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-db-file/perl-db-file.mk b/package/perl-db-file/perl-db-file.mk
index 1501926..46b87ae 100644
--- a/package/perl-db-file/perl-db-file.mk
+++ b/package/perl-db-file/perl-db-file.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# perl-db_file
+# perl-db-file
 #
 ################################################################################
 
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index d2e0563..c7180c8 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -607,6 +607,7 @@ say scalar keys %dist, q{ packages fetched.} unless $quiet;
 # Buildroot package name: lowercase
 sub fsname {
     my $name = shift;
+    $name =~ s|_|-|g;
     return q{perl-} . lc $name;
 }
 
