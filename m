From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Dec 2020 07:22:49 +0100
Subject: [Buildroot] [PATCH 1/2] utils/scancpan: handles README.pod as
 license file
Message-ID: <20201206062250.625306-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 327a58fc7..a1ec794ed 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -575,6 +575,9 @@ sub find_license_files {
     if (scalar @license_files == 0 && $manifest =~ m/(README\.md)[\n\s]/i) {
         @license_files = ($1);
     }
+    if (scalar @license_files == 0 && $manifest =~ m/(README\.pod)[\n\s]/i) {
+        @license_files = ($1);
+    }
     return @license_files;
 }
 
-- 
2.27.0
