From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 20:55:19 +0100
Subject: [Buildroot] [git commit branch/next] scanpypi: fix licence
 detection handling for unknown licences
Message-ID: <20180226195533.A89CB882BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c46f72b61e4dc989f520271bc98f7b15015fcdcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Check for match object not being None.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
