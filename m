From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:25:43 +0200
Subject: [Buildroot] [git commit] support/script/scancpan: populates
	Config.in with homepage
Message-ID: <20140622172750.585C39D04E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0bf13117aa2fb3cfa3607a076f029bd3d47da2d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index d8723f3..4be4754 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -577,6 +577,7 @@ while (my ($distname, $dist) = each %dist) {
     mkdir $dirname unless -d $dirname;
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
         my $abstract = $dist->{abstract};
+        my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
         say qq{write ${cfgname}} unless $quiet;
         open my $fh, q{>}, $cfgname;
         say {$fh} qq{config BR2_PACKAGE_${brname}};
@@ -585,8 +586,9 @@ while (my ($distname, $dist) = each %dist) {
             my $brdep = brname( fsname( $dep ) );
             say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
         }
-        say {$fh} qq{\thelp} if $abstract;
-        say {$fh} qq{\t  ${abstract}} if $abstract;
+        say {$fh} qq{\thelp};
+        say {$fh} qq{\t  ${abstract}\n} if $abstract;
+        say {$fh} qq{\t  ${homepage}};
         close $fh;
     }
     if ($force || !-f $mkname) {
