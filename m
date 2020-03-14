From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:41:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] docs/manual: clarify the
 <PKG>_PATCH_DEPENDENCIES guarantee
Message-ID: <20200314142821.E0A2782D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1585395ff869c854b1249395bfde6da6b32a05c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Unlike <PKG>_DEPENDENCIES, <PKG>_PATCH_DEPENDENCIES only guarantees
extract and patch of listed dependencies, not build. Make this subtlety
more explicit in the documentation.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998 at free.fr: slight fix]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d01e808bfed8f76e084ec2899bd130a47fb020fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1e2f08cec7..e875f9b76a 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -374,9 +374,9 @@ not and can not work as people would expect it should:
 * +LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies (in terms of
   package name) that are required for the current package to be
   patched. These dependencies are guaranteed to be extracted and
-  patched before the current package is patched. In a similar way,
-  +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies for the
-  current host package.
+  patched (but not necessarily built) before the current package is
+  patched. In a similar way, +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists
+  the dependencies for the current host package.
   This is seldom used; usually, +LIBFOO_DEPENDENCIES+ is what you
   really want to use.
 
