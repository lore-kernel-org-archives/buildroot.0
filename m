From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:20:16 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] scancpan: update with
	MetaCPAN API v1
Message-ID: <20170625223454.C7B418189F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2882d39a312eb92e0d851c414c432a66b49238f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The API v0 is shutdown.
see https://bugs.busybox.net/show_bug.cgi?id=9951

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8710996bb7d69bd4fbbf59cd3c186a428334c187)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/scancpan | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index b6123de..32908f3 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -521,7 +521,7 @@ my %deps_runtime;       # name -> list of target dependencies
 my %deps_optional;      # name -> list of optional target dependencies
 my %license_files;      # name -> list of license files
 my %checksum;           # author -> list of checksum
-my $mcpan = MetaCPAN::API::Tiny->new();
+my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
 
 sub get_checksum {
@@ -538,7 +538,7 @@ sub get_checksum {
 
 sub get_manifest {
     my ($author, $distname, $version) = @_;
-    my $url = qq{http://api.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
+    my $url = qq{http://fastapi.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
     my $response = $ua->get($url);
     return $response->{content};
 }
