From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:22 +0100
Subject: [Buildroot] [PATCH v2 11/13] docs/manual: document the effect of
 per-package directory on variables
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-12-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

As suggested by Arnout Vandecappelle, this commit adjusts the
generic-package documentation to document the effect of per-package
directory support on HOST_DIR, STAGING_DIR and TARGET_DIR.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
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
2.21.0
