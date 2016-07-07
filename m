From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 11:48:52 +0200
Subject: [Buildroot] [git commit] scanpypi: include LICENCE in the list of
	supported license files
Message-ID: <20160707094913.8B83480450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28eae03f5e68e365a3db319eac2db4f406b16e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
