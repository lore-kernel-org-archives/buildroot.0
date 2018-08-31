From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:12:57 +0200
Subject: [Buildroot] [git commit] scanpypi: place a warning into *.mk file
 if licence id couldn't be detected
Message-ID: <20180907111607.B57867FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0101ac62c81e468ba7fd47b991972a722cf1b43c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a license file could be found, but license id couldn't be detected place
following warning into *.mk file:

FOO_LICENSE = FIXME: license id couldn't be detected

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
