From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 15:43:15 +0100
Subject: [Buildroot] [git commit branch/next] docs/manual: document the
 effect of per-package directory on variables
Message-ID: <20191129143539.882918287E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8c8b41dc58cd0d8c7b0da649d0077645964b617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As suggested by Arnout Vandecappelle, this commit adjusts the
generic-package documentation to document the effect of per-package
directory support on HOST_DIR, STAGING_DIR and TARGET_DIR.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b2386f2c01..86300e7460 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -586,6 +586,13 @@ In the action definitions, you can use the following variables:
 * +$(TARGET_CROSS)+ to get the cross-compilation toolchain prefix
 
 * Of course the +$(HOST_DIR)+, +$(STAGING_DIR)+ and +$(TARGET_DIR)+
-  variables to install the packages properly.
+  variables to install the packages properly. Those variables point to
+  the global _host_, _staging_ and _target_ directories, unless
+  _per-package directory_ support is used, in which case they point to
+  the current package _host_, _staging_ and _target_ directories. In
+  both cases, it doesn't make any difference from the package point of
+  view: it should simply use +HOST_DIR+, +STAGING_DIR+ and
+  +TARGET_DIR+. See xref:top-level-parallel-build[] for more details
+  about _per-package directory_ support.
 
 Finally, you can also use hooks. See xref:hooks[] for more information.
