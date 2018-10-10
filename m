From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 17:56:35 +0200
Subject: [Buildroot] [V2 1/2] scancpan: generate a conventional comment
Message-ID: <20181010155636.6401-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index f226b3a7f..b27762d85 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -699,7 +699,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{\tdepends on !BR2_STATIC_LIBS} if $need_dlopen{$distname};
         foreach my $dep (sort @{$deps_runtime{$distname}}) {
             my $brdep = brname( fsname( $dep ) );
-            say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
+            say {$fh} qq{\tselect BR2_PACKAGE_${brdep} # runtime};
         }
         say {$fh} qq{\thelp};
         say {$fh} qq{\t  ${abstract}\n} if $abstract;
-- 
2.17.1
