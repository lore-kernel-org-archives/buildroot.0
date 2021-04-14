From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 14 Apr 2021 11:57:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/luarocks: improve detection of
 license files
In-Reply-To: <20210414095719.26901-1-francois.perrad@gadz.org>
References: <20210414095719.26901-1-francois.perrad@gadz.org>
Message-ID: <20210414095719.26901-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/buildroot.lua | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 67dac33aa..2d160f02b 100644
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
-- 
2.27.0
