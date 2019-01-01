From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:13:03 +0100
Subject: [Buildroot] [git commit] package/luarocks: fix generation of
 license file list in Buildroot addon
Message-ID: <20190101100833.9D518884A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2b783a8f237e8294bc371d3e52d3e994cfd80ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package requires an hardtab instead of 4 spaces.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/0002-Buildroot-addon.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luarocks/0002-Buildroot-addon.patch b/package/luarocks/0002-Buildroot-addon.patch
index 3d7ea1156c..56b28eab2c 100644
--- a/package/luarocks/0002-Buildroot-addon.patch
+++ b/package/luarocks/0002-Buildroot-addon.patch
@@ -235,7 +235,7 @@ index 0000000..606b94c
 +      f:write(ucname .. '_LICENSE_FILES =')
 +      for i = 1, #licenses do
 +         local file = licenses[i]
-+         f:write(' \\\n    $(' .. ucname .. '_SUBDIR)/' .. file)
++         f:write(' \\\n\t$(' .. ucname .. '_SUBDIR)/' .. file)
 +      end
 +      f:write('\n')
 +   end
