From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 16:32:58 +0200
Subject: [Buildroot] [git commit] perl-gd: fix broken patches
Message-ID: <20140719143303.1A7A29D22E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9dd0c99811f5ea3c07c124c8830b2498dd120d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

in each patch, the 3 trailing lines are lost

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-gd/perl-gd-01-getoptions.patch |    3 +++
 package/perl-gd/perl-gd-02-lgd.patch        |    3 +++
 package/perl-gd/perl-gd-03-force.patch      |    3 +++
 3 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/perl-gd/perl-gd-01-getoptions.patch b/package/perl-gd/perl-gd-01-getoptions.patch
index 7bd7f4f..74f055b 100644
--- a/package/perl-gd/perl-gd-01-getoptions.patch
+++ b/package/perl-gd/perl-gd-01-getoptions.patch
@@ -38,3 +38,6 @@ Index: b/Makefile.PL
 -			"lib_xpm_path=s"  => \$lib_xpm_path,
 -			"lib_zlib_path=s" => \$lib_zlib_path,
 -		       );
+ unless ($result) {
+   print STDERR <<END;
+ Usage: perl Makefile.PL [options]
diff --git a/package/perl-gd/perl-gd-02-lgd.patch b/package/perl-gd/perl-gd-02-lgd.patch
index bc6cdfc..4a69c2a 100644
--- a/package/perl-gd/perl-gd-02-lgd.patch
+++ b/package/perl-gd/perl-gd-02-lgd.patch
@@ -23,3 +23,6 @@ Index: b/Makefile.PL
    @$LIBS         = split /\s+/,$libs;
  
 -  push @$LIBS,"-lgd";
+   push @$LIBPATH,"-L$libdir";
+   ($$lib_gd_path = $libdir) =~ s!/[^/]+$!!;
+   $$options      = $features;
diff --git a/package/perl-gd/perl-gd-03-force.patch b/package/perl-gd/perl-gd-03-force.patch
index 3524865..0a121a9 100644
--- a/package/perl-gd/perl-gd-03-force.patch
+++ b/package/perl-gd/perl-gd-03-force.patch
@@ -27,3 +27,6 @@ Index: b/Makefile.PL
 +    my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
 +    @LIBPATH = (@LIBPATH,@libs64);
 +  }
+ }
+ 
+ #############################################################################################
