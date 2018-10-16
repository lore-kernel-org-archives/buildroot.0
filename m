From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 16 Oct 2018 21:55:04 +0200
Subject: [Buildroot] [PATCH 2/3] perl: fix the generated subdirectory
 Makefiles
In-Reply-To: <20181016195505.30438-1-francois.perrad@gadz.org>
References: <20181016195505.30438-1-francois.perrad@gadz.org>
Message-ID: <20181016195505.30438-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...the-generated-subdirectory-Makefiles.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch

diff --git a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
new file mode 100644
index 000000000..71560c5e0
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
-- 
2.17.1
