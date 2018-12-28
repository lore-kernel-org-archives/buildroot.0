From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:43:35 +0100
Subject: [Buildroot] [PATCH v7 8/8] docs/manual: document the effect of
 per-package directory on variables
In-Reply-To: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181228104335.22379-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout Vandecappelle, this commit adjusts the
generic-package documentation to document the effect of per-package
directory support on HOST_DIR, STAGING_DIR and TARGET_DIR.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 7be1754f54..4a991140a8 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -578,6 +578,13 @@ In the action definitions, you can use the following variables:
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
-- 
2.20.1
