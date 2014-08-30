From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 09:01:32 +0200
Subject: [Buildroot] [git commit branch/next] support/script/scancpan: don't
	generate the trailing slash in <PKG>_SITE variable
Message-ID: <20140830071153.35D629D573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56e7d0b886de1c6b2abe2da93f2bc19359a9316f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The trailing slash was removed in all packages, so don't generate it.
See http://git.buildroot.net/buildroot/commit/?id=c7f4b964718bc5a3329bb730f59e24091ecbc7a2

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/scancpan |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
