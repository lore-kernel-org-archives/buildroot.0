From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  7 Jul 2016 11:04:39 +0200
Subject: [Buildroot] [PATCH] scanpypi: include LICENCE in the list of
	supported license files
Message-ID: <1467882279-24370-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/scripts/scanpypi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index 7546cf1..e150ae5 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -416,7 +416,8 @@ class BuildrootPackage():
             license=', '.join(licenses))
         lines.append(license_line)
 
-        filenames = ['LICENSE', 'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
+        filenames = ['LICENCE', 'LICENSE', 'LICENSE.TXT', 'COPYING',
+		     'COPYING.TXT']
         license_files = list(find_file_upper_case(filenames, self.tmp_extract))
         license_files = [license.replace(self.tmp_extract, '')[1:]
                          for license in license_files]
-- 
2.8.1
