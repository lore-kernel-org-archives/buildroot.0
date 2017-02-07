From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  7 Feb 2017 12:08:17 +0100
Subject: [Buildroot] [PATCH] docs/manual: suggest 'YES' as the value for
	LIBFOO_GIT_SUBMODULES
Message-ID: <1486465697-30876-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual mentions LIBFOO_GIT_SUBMODULES but does not tell what value
it should have. The implementation only checks whether the variable is
non-empty, but we should suggest a specific value to avoid people
wondering what they have to set, and to try setting weird values.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Ricardo Herrero <ricardo.herrero@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 0e111e1199de..a08283c5a39d 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -317,11 +317,12 @@ information is (assuming the package name is +libfoo+) :
      the package source code. Buildroot copies the contents of the
      source directory into the package's build directory.
 
-* +LIBFOO_GIT_SUBMODULES+, when +LIBFOO_SITE_METHOD=git+, will create
-  an archive with the git submodules in the repository.
-  Note that we try not to use such git submodules when they contain
-  bundled libraries, in which case we prefer to use those libraries
-  from their own package.
+* +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
+  with the git submodules in the repository.  This is only available
+  for packages downloaded with git (i.e. when
+  +LIBFOO_SITE_METHOD=git+).  Note that we try not to use such git
+  submodules when they contain bundled libraries, in which case we
+  prefer to use those libraries from their own package.
 
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
-- 
2.7.4
