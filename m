From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 19:49:43 +0100
Subject: [Buildroot] [git commit] perl: remove useless patch
Message-ID: <20140210194347.BE78E9C93D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=661fdedef74e9922d8a02643fc3c7ea38d73aebb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Perl infrastructure uses a host version of Module-Build
(see previous commit "host-perl-module-build: new package").
The target version is never used, so no need to patch it.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl-fix-Module-Build.patch |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

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
