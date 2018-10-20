From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 19:30:01 +0200
Subject: [Buildroot] [git commit] perl: fix the generated subdirectory
 Makefiles
Message-ID: <20181020172849.278D883C69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=516dbcda80a8f1fd2eec035b7e8967e0115603d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-the-generated-subdirectory-Makefiles.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
new file mode 100644
index 0000000000..71560c5e0c
--- /dev/null
+++ b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
@@ -0,0 +1,30 @@
+From 30ae4c9e2ac6cd27138ebf124cbda9232c56bdf7 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Tue, 16 Oct 2018 21:20:12 +0200
+Subject: [PATCH] fix the generated subdirectory Makefiles
+
+all variables used by BR must be propagated
+
+similar to https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/commit/98e8532fffe5afa8186329acc44fb957427f1823
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
+index d579256e86..48642e98fa 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
+@@ -703,7 +703,7 @@ END
+         }
+         if ($self->{PARENT}) {
+             $self->{PARENT}->{CHILDREN}->{$newclass} = $self;
+-            foreach my $opt (qw(POLLUTE PERL_CORE LINKTYPE LD OPTIMIZE)) {
++            foreach my $opt (qw(POLLUTE PERL_CORE LINKTYPE AR FULL_AR CC CCFLAGS OPTIMIZE LD LDDLFLAGS LDFLAGS PERL_ARCHLIB DESTDIR )) {
+                 if (exists $self->{PARENT}->{$opt}
+                     and not exists $self->{$opt})
+                     {
+-- 
+2.17.1
+
