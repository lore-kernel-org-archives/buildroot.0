From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Jan 2017 16:04:03 +0100
Subject: [Buildroot] [PATCH] perl: fix static build with gdbm + gettext
Message-ID: <20170117150403.11677-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.org/results/d1f/d1f133ca3693b6653eed4fc513effc0bbdcfd9c9/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-fix-static-build-with-gdbm-gettext.patch    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/perl/0001-fix-static-build-with-gdbm-gettext.patch

diff --git a/package/perl/0001-fix-static-build-with-gdbm-gettext.patch b/package/perl/0001-fix-static-build-with-gdbm-gettext.patch
new file mode 100644
index 0000000..ca6bf01
--- /dev/null
+++ b/package/perl/0001-fix-static-build-with-gdbm-gettext.patch
@@ -0,0 +1,20 @@
+fix static build with gdbm + gettext
+
+see doc http://perldoc.perl.org/ExtUtils/MakeMaker.html#LIBS
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+index: b/ext/GDBM_File/Makefile.PL
+===================================================================
+--- a/ext/GDBM_File/Makefile.PL
++++ b/ext/GDBM_File/Makefile.PL
+@@ -2,7 +2,7 @@ use ExtUtils::MakeMaker;
+ use ExtUtils::Constant 0.11 'WriteConstants';
+ WriteMakefile(
+     NAME => 'GDBM_File',
+-    LIBS => ["-lgdbm", "-ldbm"],
++    LIBS => ["-lgdbm -lintl", "-lgdbm", "-ldbm"],
+     XSPROTOARG => '-noprototypes', 		# XXX remove later?
+     VERSION_FROM => 'GDBM_File.pm',
+     realclean => {FILES=> 'const-c.inc const-xs.inc'},
+
-- 
2.9.3
