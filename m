From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:05:53 +0200
Subject: [Buildroot] [git commit] scancpan: sort license in hash file
Message-ID: <20181010070555.C0C3781E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4fd962c46ee5c56ce79ca91eb818674aa5ac064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

now, the output is reproductible

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index f7b707676d..64599f4305 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -767,10 +767,12 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{# retrieved by scancpan from ${mirror}/};
         say {$fh} qq{md5    ${md5} ${filename}};
         say {$fh} qq{sha256 ${sha256} ${filename}};
-        if (scalar keys %{$license_files{$distname}}) {
+        my %license_files =  %{$license_files{$distname}};
+        if (scalar keys %license_files) {
             say {$fh} q{};
             say {$fh} qq{# computed by scancpan};
-            while (my ($license, $digest) = each %{$license_files{$distname}}) {
+            foreach my $license (sort keys %license_files) {
+                my $digest = $license_files{$license};
                 say {$fh} qq{sha256 ${digest} ${license}};
             }
         }
