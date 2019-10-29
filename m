From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 29 Oct 2019 05:33:08 +0100
Subject: [Buildroot] [PATCH 1/2] utils/scancpan: handles misspelled LICENCE
Message-ID: <20191029043309.11543-1-francois.perrad@gadz.org>
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
index 484ccaca9..16e495bda 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -567,7 +567,7 @@ sub find_license_files {
     foreach (split /\n/, $manifest) {
         next if m|/|;
         s|\s+.*$||;
-        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE)/i;
+        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE|LICENCE)/i;
     }
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
         @license_files = ($1);
-- 
2.20.1
