From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:33:08 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] scanpypi: place a warning
 into *.mk file if licence id couldn't be detected
Message-ID: <20181114223212.1EBAA836D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31ce6e50812284323ce55023a51fb86eaeaee3ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

If a license file could be found, but license id couldn't be detected place
following warning into *.mk file:

FOO_LICENSE = FIXME: license id couldn't be detected

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0101ac62c81e468ba7fd47b991972a722cf1b43c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index 6511fc14ae..3983be1ad1 100755
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
