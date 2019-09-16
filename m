From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 16 Sep 2019 21:04:34 +0200
Subject: [Buildroot] [PATCH] utils/scancpan: improve license file detection
Message-ID: <20190916190434.22497-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MANIFEST may contains line like this:
"LICENSE                     LICENSE file (added by Distar)"
so, retains only the first word.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index 1fccc980a..484ccaca9 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -566,6 +566,7 @@ sub find_license_files {
     my @license_files;
     foreach (split /\n/, $manifest) {
         next if m|/|;
+        s|\s+.*$||;
         push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE)/i;
     }
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
-- 
2.20.1
