From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  1 Jan 2019 08:21:20 +0100
Subject: [Buildroot] [PATCH] luarocks: fix generation of license file list
Message-ID: <20190101072120.28018-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

check-package requires an hardtab instead of 4 spaces.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/0002-Buildroot-addon.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luarocks/0002-Buildroot-addon.patch b/package/luarocks/0002-Buildroot-addon.patch
index 3d7ea1156..56b28eab2 100644
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
-- 
2.17.1
