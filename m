From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:51:43 +0200
Subject: [Buildroot] [git commit] package/luarocks: improve detection of
 license files
Message-ID: <20210419202513.AA8D383DBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d72152ad8eb98b2e359474e486eb062caafd827c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/buildroot.lua | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 67dac33aa2..2d160f02b6 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -380,8 +380,8 @@ function buildroot.command(args)
    if #licenses == 0 then
       for i = 1, #files do
          local v = files[i]
-         if v:match('^doc/LICENSE')
-            or v:match('^doc/license')
+         if v:match('^docs?/LICENSE')
+            or v:match('^docs?/license')
             or v:match('^doc/us/license') then
             licenses[#licenses+1] = v
             digest[v], err = get_digest(v)
