From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Mar 2018 22:00:08 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: adjust to
 core-dependencies removal
Message-ID: <20180330200142.15D7583EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a86b2523a0e0b723d580329c238e35e7e1af5fe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit ea9669fffae7d807ccb3810eb6c662cbb9e8f96f ("core: kill
DEPENDENCIES_HOST_PREREQ"), the core-dependencies make target was
removed, and is now named just "dependencies".

This broke the utils/genrandconfig script, and this commit intends to
fix that.

Since this script is part of the Buildroot tree, it is provided
together with Buildroot, so we don't need to support the legacy
core-dependencies target. Someone checking out an older Buildroot will
have a working setup, with support/dependencies exposing
core-dependencies and utils/genrandconfig using core-dependencies. The
only broken situation will be between
ea9669fffae7d807ccb3810eb6c662cbb9e8f96f and this commit, but that's
not a sufficient reason to add some backward compatibility code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index d958664572..07882200e0 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -404,7 +404,7 @@ def gen_config(args):
                            "savedefconfig"])
 
     return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                            "core-dependencies"])
+                            "dependencies"])
 
 
 if __name__ == '__main__':
