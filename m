From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:11 +0200
Subject: [Buildroot] [PATCH 03/13] scancpan: sort license files
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

so, the output is reproductible

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 20ab27caa..f7b707676 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -724,7 +724,7 @@ while (my ($distname, $dist) = each %dist) {
         my $license = brlicense( ref $dist->{license} eq 'ARRAY'
                                ? join q{ or }, @{$dist->{license}}
                                : $dist->{license} );
-        my $license_files = join q{ }, keys %{$license_files{$distname}};
+        my $license_files = join q{ }, sort keys %{$license_files{$distname}};
         if ($license_files && (!$license || $license eq q{unknown})) {
             push @info, qq{[$distname] undefined LICENSE, see $license_files};
             $license = q{???};
-- 
2.17.1
