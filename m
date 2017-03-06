From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:20:51 +0100
Subject: [Buildroot] [git commit] package/Config.in: explain that lua
	package names should start with lua
Message-ID: <20170306202055.74357819C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=687a313179b07865a12e9a35bc4c506fb371d2d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have decided that lua packages should have a name that starts with
lua (like is the case for python and perl). However, we're not going to
rename all the existing lua packages that don't start with lua. This
makes it unclear for people adding packages how they should name the
package, so add a comment to package/Config.in to explain it.

It's rather terse but it gets the message across.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 78acc53..cfe7fc6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -525,6 +525,10 @@ endif
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
