From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jul 2021 10:07:47 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] utils/scanpypi: search
 LICENSE.MD
Message-ID: <20210714073449.376718D1CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e81ef47e3ec350e1b97138ef74ddef767496040e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Some packages such as python-idna has a LICENSE.md file:
https://github.com/kjd/idna/blob/master/LICENSE.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 60aa896904c0d8a07d6fbbf7e90b7f9efd196678)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
