From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:15 +0200
Subject: [Buildroot] [git commit] perl: remove libintl static linking
	handling
Message-ID: <20170704233520.62F388013D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee557967abde5d12f7ae09701045eb282be52d2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the patch
that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-static-build-with-gdbm-gettext.patch    | 20 --------------------
 1 file changed, 20 deletions(-)

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
