From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Mar 2017 23:24:42 +0100
Subject: [Buildroot] [PATCH v2] package/Config.in: explain that lua package
	names should start with lua
Message-ID: <20170305222442.27768-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have decided that lua packages should have a name that starts with
lua (like is the case for python and perl). However, we're not going to
rename all the existing lua packages that don't start with lua. This
makes it unclear for people adding packages how they should name the
package, so add a comment to package/Config.in to explain it.

It's rather terse but it gets the message across.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: clarify that lua- should be added if upstream doesn't have a lua
    prefix
---
 package/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 536b5512f7..407dc238ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -524,6 +524,10 @@ endif
 if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
 # lua modules are dynamically loaded, so not available on static builds
 menu "Lua libraries/modules"
+# When adding lua packages, make sure the name start with "lua". If the
+# upstream package is "luafoo", call it "luafoo" in Buildroot; if the upstream
+# package is "foo", call it "lua-foo". Many packages currently don't follow
+# this convention, but that's historical accident.
 	source "package/argparse/Config.in"
 	source "package/cgilua/Config.in"
 	source "package/copas/Config.in"
-- 
2.11.0
