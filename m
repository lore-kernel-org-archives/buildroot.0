From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:05:24 +0200
Subject: [Buildroot] [git commit] wsapi: fix broken patch
Message-ID: <20170927185939.F3B4D81115@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3dc6d87cb3a8d1e0d0eb89e27811518ce95002a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/f03c9a33289ab3104f30c3da98673ad6321db46b/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wsapi/0001-Lua-5.3-compatibility.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/wsapi/0001-Lua-5.3-compatibility.patch b/package/wsapi/0001-Lua-5.3-compatibility.patch
index d55c818..9165ef2 100644
--- a/package/wsapi/0001-Lua-5.3-compatibility.patch
+++ b/package/wsapi/0001-Lua-5.3-compatibility.patch
@@ -11,10 +11,10 @@ Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
  src/wsapi/util.lua   | 2 +-
  2 files changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/src/wsapi/ringer.lua b/src/wsapi/ringer.lua
+diff --git a/wsapi-1.6.1/src/wsapi/ringer.lua b/wsapi-1.6.1/src/wsapi/ringer.lua
 index 58309f2..db7b68f 100644
---- a/src/wsapi/ringer.lua
-+++ b/src/wsapi/ringer.lua
+--- a/wsapi-1.6.1/src/wsapi/ringer.lua
++++ b/wsapi-1.6.1/src/wsapi/ringer.lua
 @@ -5,6 +5,7 @@ local rings = require "rings"
  local _M = {}
  
@@ -23,10 +23,10 @@ index 58309f2..db7b68f 100644
    local app_name, bootstrap_code, is_file = ...
    if bootstrap_code then
      local bootstrap, err
-diff --git a/src/wsapi/util.lua b/src/wsapi/util.lua
+diff --git a/wsapi-1.6.1/src/wsapi/util.lua b/wsapi-1.6.1/src/wsapi/util.lua
 index 24d3cfe..34e5816 100644
---- a/src/wsapi/util.lua
-+++ b/src/wsapi/util.lua
+--- a/wsapi-1.6.1/src/wsapi/util.lua
++++ b/wsapi-1.6.1/src/wsapi/util.lua
 @@ -174,7 +174,7 @@ function _M.make_env_post(pd, type, qs)
  end
  
