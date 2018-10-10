From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:06:09 +0200
Subject: [Buildroot] [git commit] scancpan: remove run-time dependencies
Message-ID: <20181010070555.CE99481E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f7441ab41a6c29075b30fc06c1fc082976b24d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 632e7aa95c..066882c08f 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -717,8 +717,7 @@ while (my ($distname, $dist) = each %dist) {
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
         my ($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
         $directories =~ s|/$||;
-        my @dependencies = ( map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
-                             map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} ) );
+        my @dependencies = map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} );
         my $dependencies = join qq{ \\\n\t}, @dependencies;
         $dependencies = qq{\\\n\t} . $dependencies if scalar @dependencies > 1;
         my @host_dependencies = map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
