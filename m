From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 29 Aug 2014 10:51:53 +0200
Subject: [Buildroot] [PATCH] support/script/scancpan: don't generate the
	trailing slash in <PKG>_SITE variable
Message-ID: <1409302313-12483-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The trailing slash was removed in all packages, so don't generate it.
See http://git.buildroot.net/buildroot/commit/?id=c7f4b964718bc5a3329bb730f59e24091ecbc7a2

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 50d9bab..e738a83 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -636,6 +636,7 @@ while (my ($distname, $dist) = each %dist) {
         # the scheme is not used, because the job is done by the BR download infrastructure
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
         my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
+        $directories =~ s|/$||;
         my $dependencies = join q{ }, qw( = perl ),
                                       map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
                                       map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
-- 
1.9.1
