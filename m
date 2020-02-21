From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Feb 2020 07:34:42 +0200
Subject: [Buildroot] [PATCH] docs/manual: clarify the
 <PKG>_PATCH_DEPENDENCIES guarantee
Message-ID: <0129871638f614e8794dcf2576131d41bf64986d.1582263282.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unlike <PKG>_DEPENDENCIES, <PKG>_PATCH_DEPENDENCIES only guarantees
extract and patch of listed dependencies, not build. Make this subtlety
more explicit in the documentation.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/adding-packages-generic.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 59cdb7ffd72d..82d97854dde4 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -374,9 +374,9 @@ not and can not work as people would expect it should:
 * +LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies (in terms of
   package name) that are required for the current package to be
   patched. These dependencies are guaranteed to be extracted and
-  patched before the current package is patched. In a similar way,
-  +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies for the
-  current host package.
+  patched (but not necessarily be built) before the current package
+  is patched. In a similar way, +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists
+  the dependencies for the current host package.
   This is seldom used; usually, +LIBFOO_DEPENDENCIES+ is what you
   really want to use.
 
-- 
2.25.0
