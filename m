From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:21:02 +0200
Subject: [Buildroot] [git commit] scancpan: generate a conventional comment
Message-ID: <20181010191957.A0BB4826E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd4d596f3d7640e37858725974a78b4f2f5da8cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 066882c08f..01f3abdc85 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -698,7 +698,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{\tdepends on !BR2_STATIC_LIBS} if $need_dlopen{$distname};
         foreach my $dep (sort @{$deps_runtime{$distname}}) {
             my $brdep = brname( fsname( $dep ) );
-            say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
+            say {$fh} qq{\tselect BR2_PACKAGE_${brdep} # runtime};
         }
         say {$fh} qq{\thelp};
         say {$fh} qq{\t  ${abstract}\n} if $abstract;
