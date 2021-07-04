From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Jul 2021 21:38:59 +0200
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: search LICENSE.MD
Message-ID: <20210704193859.3406196-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages such as python-idna has a LICENSE.md file:
https://github.com/kjd/idna/blob/master/LICENSE.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 47c7c00c60..8327fc3fc5 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -495,8 +495,8 @@ class BuildrootPackage():
         """
         lines = []
 
-        filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
-                     'COPYING', 'COPYING.TXT']
+        filenames = ['LICENCE', 'LICENSE', 'LICENSE.MD', 'LICENSE.RST',
+                     'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
         self.license_files = list(find_file_upper_case(filenames, self.tmp_extract))
 
         lines.append(self.__get_license_names(self.license_files))
-- 
2.30.2
