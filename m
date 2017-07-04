From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:12 +0200
Subject: [Buildroot] [PATCH 092/100] perl: remove libintl static linking
	handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-93-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the patch
that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-static-build-with-gdbm-gettext.patch    | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 package/perl/0001-fix-static-build-with-gdbm-gettext.patch

diff --git a/package/perl/0001-fix-static-build-with-gdbm-gettext.patch b/package/perl/0001-fix-static-build-with-gdbm-gettext.patch
deleted file mode 100644
index ca6bf01..0000000
--- a/package/perl/0001-fix-static-build-with-gdbm-gettext.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-fix static build with gdbm + gettext
-
-see doc http://perldoc.perl.org/ExtUtils/MakeMaker.html#LIBS
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-index: b/ext/GDBM_File/Makefile.PL
-===================================================================
---- a/ext/GDBM_File/Makefile.PL
-+++ b/ext/GDBM_File/Makefile.PL
-@@ -2,7 +2,7 @@ use ExtUtils::MakeMaker;
- use ExtUtils::Constant 0.11 'WriteConstants';
- WriteMakefile(
-     NAME => 'GDBM_File',
--    LIBS => ["-lgdbm", "-ldbm"],
-+    LIBS => ["-lgdbm -lintl", "-lgdbm", "-ldbm"],
-     XSPROTOARG => '-noprototypes', 		# XXX remove later?
-     VERSION_FROM => 'GDBM_File.pm',
-     realclean => {FILES=> 'const-c.inc const-xs.inc'},
-
-- 
2.9.4
