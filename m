From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:05:49 +0200
Subject: [Buildroot] [git commit] scancpan: sort license files
Message-ID: <20181010070555.B9C9281E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c3395a374eb7d710c9d407a48c12e98a65b00e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

so, the output is reproductible

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 20ab27caa1..f7b707676d 100755
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
