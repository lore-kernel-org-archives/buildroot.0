From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 22:04:28 +0200
Subject: [Buildroot] [git commit] utils/scanpypi: search LICENSE.MD
Message-ID: <20210704193212.638B18DB58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60aa896904c0d8a07d6fbbf7e90b7f9efd196678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages such as python-idna has a LICENSE.md file:
https://github.com/kjd/idna/blob/master/LICENSE.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
