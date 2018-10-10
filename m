From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:14 +0200
Subject: [Buildroot] [PATCH 06/13] scancpan: remove run-time dependencies
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 632e7aa95..066882c08 100755
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
-- 
2.17.1
