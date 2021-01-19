From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:56:04 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 docs/manual/pkg-cmake.txt: fix _INSTALL_STAGING_OPTS/_INSTALL_TARGET_OPTS
 description
Message-ID: <20210119143958.0988A883B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11b5fdfc51b9ea1310f873c0b54c33381c94a5ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since commit dfcc18f84b0d90b0ed5937bac3c4b12aba086cd5 cmake-package
_INSTALL_STAGING_OPTS/_INSTALL_TARGET_OPTS use 'install/fast'
instead of 'install', adjust documentation accordingly.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0c80a0da9aaf1e051ceb1a319ebef7a933674ca9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-cmake.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 6ccf3902f8..00974d30d8 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -128,12 +128,12 @@ typical packages will therefore only use a few of them.
 
 * +LIBFOO_INSTALL_STAGING_OPTS+ contains the make options used to
   install the package to the staging directory. By default, the value
-  is +DESTDIR=$(STAGING_DIR) install+, which is correct for most
+  is +DESTDIR=$(STAGING_DIR) install/fast+, which is correct for most
   CMake packages. It is still possible to override it.
 
 * +LIBFOO_INSTALL_TARGET_OPTS+ contains the make options used to
   install the package to the target directory. By default, the value
-  is +DESTDIR=$(TARGET_DIR) install+. The default value is correct
+  is +DESTDIR=$(TARGET_DIR) install/fast+. The default value is correct
   for most CMake packages, but it is still possible to override it if
   needed.
 
