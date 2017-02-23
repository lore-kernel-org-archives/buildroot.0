From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:35 +0100
Subject: [Buildroot] [PATCH 13/25] package/Config.in: explain that lua
	package names should start with lua
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-14-arnout@mind.be>
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
 package/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index cf9c401af0..efcde1fdd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -521,6 +521,8 @@ endif
 if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
 # lua modules are dynamically loaded, so not available on static builds
 menu "Lua libraries/modules"
+# When adding lua packages, make sure the name start with "lua".
+# Many packages currently don't, but that's historical accident.
 	source "package/argparse/Config.in"
 	source "package/cgilua/Config.in"
 	source "package/copas/Config.in"
-- 
2.11.0
