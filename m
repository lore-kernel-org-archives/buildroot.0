From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 14:58:26 +0100
Subject: [Buildroot] [git commit] package/perl-db-file: Berkeley DB 1.85
	compatibility API is not needed
Message-ID: <20151220141024.6F83B81D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=619280aea0b1ddd105e4bf79f8af81576183164b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is also compatible with Berkeley DB v2 or higher:
https://metacpan.org/source/PMQS/DB_File-1.835/Changes

1.50
    DB_File can now build with either DB 1.x or 2.x, but not both at
    the same time.

[Thomas: adjust Config.in help text accordingly.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-db-file/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/perl-db-file/Config.in b/package/perl-db-file/Config.in
index 37bc5da..f07e5df 100644
--- a/package/perl-db-file/Config.in
+++ b/package/perl-db-file/Config.in
@@ -2,9 +2,8 @@ config BR2_PACKAGE_PERL_DB_FILE
 	bool "perl-db-file"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_BERKELEYDB
-	select BR2_PACKAGE_BERKELEYDB_COMPAT185
 	help
-	  Perl5 access to Berkeley DB version 1.x
+	  Perl5 access to Berkeley DB version 1.x or 2.x.
 
 	  https://metacpan.org/release/DB_File
 
