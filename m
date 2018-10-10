From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 12:14:45 +0200
Subject: [Buildroot] [PATCH 1/2] scancpan: generate a conventional comment
Message-ID: <20181010101446.30160-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index e16a18303..2e7e94627 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -696,6 +696,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{config BR2_PACKAGE_${brname}};
         say {$fh} qq{\tbool "${fsname}"};
         say {$fh} qq{\tdepends on !BR2_STATIC_LIBS} if $need_dlopen{$distname};
+        say {$fh} qq{\t# runtime} if scalar @{$deps_runtime{$distname}} > 0;
         foreach my $dep (sort @{$deps_runtime{$distname}}) {
             my $brdep = brname( fsname( $dep ) );
             say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
-- 
2.17.1
