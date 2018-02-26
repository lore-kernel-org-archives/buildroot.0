From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 26 Feb 2018 14:01:18 +0100
Subject: [Buildroot] [PATCH 2/2] scanpypi: fix licence detection handling
 for unknown licences
In-Reply-To: <20180226130118.3621-1-yegorslists@googlemail.com>
References: <20180226130118.3621-1-yegorslists@googlemail.com>
Message-ID: <20180226130118.3621-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Check for match object not being None.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 1720c0c051..14ee87784a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -436,7 +436,7 @@ class BuildrootPackage():
             for license_file in license_files:
                 with open(license_file) as lic_file:
                     match = liclookup.match(lic_file.read())
-                if match.confidence >= 90.0:
+                if match is not None and match.confidence >= 90.0:
                     license_names.append(match.license.id)
 
             if len(license_names) > 0:
-- 
2.11.0
