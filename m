From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:05:16 +0200
Subject: [Buildroot] [git commit] docs/manual: update documentation about
	applying patches
Message-ID: <20150406093206.A9229800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5fd21d2e58fa6a5f9aa861c7c4638a5b7952c3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot manual is currently wrong when describing how patches
are applied: it says that <packagename>-*.patch is applied, and that
<packagename>-<seq>-*.patch is the recommended name for patches. This
is incorrect, since we're now using just <seq>-*.patch. This commit
adjusts the documentation accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-generic.txt |    2 +-
 docs/manual/customize-patches.txt       |   11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 85c9ccd..1aa6def 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -219,7 +219,7 @@ information is (assuming the package name is +libfoo+) :
   +LIBFOO_SITE+. If +HOST_LIBFOO_PATCH+ is not specified, it defaults
   to +LIBFOO_PATCH+. Note that patches that are included in Buildroot
   itself use a different mechanism: all files of the form
-  +<packagename>-*.patch+ present in the package directory inside
+  +*.patch+ present in the package directory inside
   Buildroot will be applied to the package after extraction (see
   xref:patch-policy[patching a package]). Finally, patches listed in
   the +LIBFOO_PATCH+ variable are applied _before_ the patches stored
diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
index e129a64..fa63541 100644
--- a/docs/manual/customize-patches.txt
+++ b/docs/manual/customize-patches.txt
@@ -33,12 +33,11 @@ follows:
 * If a +series+ file exists in the package directory, then patches are
   applied according to the +series+ file;
 +
-* Otherwise, patch files matching +<packagename>-*.patch+
-  are applied in alphabetical order.
-  So, to ensure they are applied in the right order, it is highly
-  recommended to name the patch files like this:
-  +<packagename>-<number>-<description>.patch+, where +<number>+
-  refers to the 'apply order'.
+* Otherwise, patch files matching +*.patch+ are applied in
+  alphabetical order.  So, to ensure they are applied in the right
+  order, it is highly recommended to name the patch files like this:
+  +<number>-<description>.patch+, where +<number>+ refers to the
+  'apply order'.
 
 For information about how patches are applied for a package, see
 xref:patch-apply-order[]
