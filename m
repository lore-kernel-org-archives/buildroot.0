From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  7 Feb 2014 09:55:35 +0100
Subject: [Buildroot] [pkg-perl infra V5 6/8] perl: remove useless patch
In-Reply-To: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
References: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1391763337-30660-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Perl infrastructure uses a host version of Module-Build
(see previous commit "host-perl-module-build: new package").
The target version is never used, so no need to patch it.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl-fix-Module-Build.patch |   16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 package/perl/perl-fix-Module-Build.patch

diff --git a/package/perl/perl-fix-Module-Build.patch b/package/perl/perl-fix-Module-Build.patch
deleted file mode 100644
index 9101c11..0000000
--- a/package/perl/perl-fix-Module-Build.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/cpan/Module-Build/lib/Module/Build/Base.pm
-===================================================================
---- a/cpan/Module-Build/lib/Module/Build/Base.pm
-+++ b/cpan/Module-Build/lib/Module/Build/Base.pm
-@@ -460,7 +460,7 @@
-   my $proto = shift;
-   my $c     = ref($proto) ? $proto->{config} : 'Module::Build::Config';
- 
--  my $perl  = $^X;
-+  my $perl  = $ENV{RUN_PERL} || $^X;
-   my $perl_basename = File::Basename::basename($perl);
- 
-   my @potential_perls;
-- 
1.7.9.5
