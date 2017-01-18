From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jan 2017 13:19:41 +1100
Subject: [Buildroot] [git commit] perl: fix static build with gdbm + gettext
Message-ID: <20170118022055.A4DBD81829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c9fe3c1c87a19ece72658fed21b41f30fd5f98d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see http://autobuild.buildroot.org/results/d1f/d1f133ca3693b6653eed4fc513effc0bbdcfd9c9/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-static-build-with-gdbm-gettext.patch    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

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
