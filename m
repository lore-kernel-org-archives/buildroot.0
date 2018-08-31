From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 31 Aug 2018 17:07:46 +0200
Subject: [Buildroot] [PATCH] scanpypi: place a warning into *.mk file if
 licence id couldn't be detected
Message-ID: <20180831150746.1804-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

If a license file could be found, but license id couldn't be detected place
following warning into *.mk file:

FOO_LICENSE = FIXME: license id couldn't be detected

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index 12c96b842e..31e242e3db 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -444,6 +444,8 @@ class BuildrootPackage():
                     match = liclookup.match(lic_file.read())
                 if match is not None and match.confidence >= 90.0:
                     license_names.append(match.license.id)
+                else:
+                    license_names.append("FIXME: license id couldn't be detected")
 
             if len(license_names) > 0:
                 license_line = ('{name}_LICENSE ='
-- 
2.17.0
