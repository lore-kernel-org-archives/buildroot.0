From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:12 +0200
Subject: [Buildroot] [PATCH 04/13] scancpan: sort license in hash file
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

now, the output is reproductible

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index f7b707676..64599f430 100755
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
-- 
2.17.1
