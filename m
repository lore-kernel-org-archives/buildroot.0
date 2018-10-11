From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 11 Oct 2018 07:54:11 +0200
Subject: [Buildroot] [PATCH] scanpypi: improve BSD licence handling
Message-ID: <20181011055411.22801-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

When used without spdx_lookup the BSD licence cannot be
detected correctly because many Python packages just specify
BSD without the exact version in their metadata. So add a
special message warning the user instead of the licence id.

Bonus: fix typo.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 31e242e3db..3983be1ad1 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -395,7 +395,7 @@ class BuildrootPackage():
         """
         Try to determine the related license name.
 
-        There are two possibilities. Either the scripts tries to
+        There are two possibilities. Either the script tries to
         get license name from package's metadata or, if spdx_lookup
         package is available, the script compares license files with
         SPDX database.
@@ -404,7 +404,7 @@ class BuildrootPackage():
         if liclookup is None:
             license_dict = {
                 'Apache Software License': 'Apache-2.0',
-                'BSD License': 'BSD',
+                'BSD License': 'FIXME: please specify the exact BSD version',
                 'European Union Public Licence 1.0': 'EUPL-1.0',
                 'European Union Public Licence 1.1': 'EUPL-1.1',
                 "GNU General Public License": "GPL",
-- 
2.17.0
