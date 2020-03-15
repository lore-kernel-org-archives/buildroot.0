From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Mar 2020 23:03:57 +0100
Subject: [Buildroot] [PATCH 1/1] utils/scancpan: use two spaces indentation
 in hash file
Message-ID: <20200315220357.474253-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/scancpan | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index dbd8dab6d3..327a58fc78 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -800,15 +800,15 @@ while (my ($distname, $dist) = each %dist) {
         say qq{write ${hashname}} unless $quiet;
         open my $fh, q{>}, $hashname;
         say {$fh} qq{# retrieved by scancpan from ${mirror}/};
-        say {$fh} qq{md5    ${md5} ${filename}};
-        say {$fh} qq{sha256 ${sha256} ${filename}};
+        say {$fh} qq{md5  ${md5}  ${filename}};
+        say {$fh} qq{sha256  ${sha256}  ${filename}};
         my %license_files =  %{$license_files{$distname}};
         if (scalar keys %license_files) {
             say {$fh} q{};
             say {$fh} qq{# computed by scancpan};
             foreach my $license (sort keys %license_files) {
                 my $digest = $license_files{$license};
-                say {$fh} qq{sha256 ${digest} ${license}};
+                say {$fh} qq{sha256  ${digest}  ${license}};
             }
         }
         close $fh;
-- 
2.25.1
