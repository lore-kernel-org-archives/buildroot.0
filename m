From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Oct 2018 05:27:40 +0200
Subject: [Buildroot] [PATCH] scancpan: uses also README.md as default
 license file
Message-ID: <20181026032740.9176-1-francois.perrad@gadz.org>
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
index f9589a4ff..75c9a9ca6 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -569,6 +569,9 @@ sub find_license_files {
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
         @license_files = ($1);
     }
+    if (scalar @license_files == 0 && $manifest =~ m/(README\.md)[\n\s]/i) {
+        @license_files = ($1);
+    }
     return @license_files;
 }
 
-- 
2.17.1
