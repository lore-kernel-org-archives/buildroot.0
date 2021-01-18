From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Jan 2021 22:26:59 +0100
Subject: [Buildroot] [PATCH v1 2/3] docs: fix cmake-package
 _INSTALL_STAGING_OPTS/_INSTALL_TARGET_OPTS description
In-Reply-To: <20210118212700.2316-1-ps.report@gmx.net>
References: <20210118212700.2316-1-ps.report@gmx.net>
Message-ID: <20210118212700.2316-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit dfcc18f84b0d90b0ed5937bac3c4b12aba086cd5 cmake-package
_INSTALL_STAGING_OPTS/_INSTALL_TARGET_OPTS use 'install/fast'
instead of 'install', adjust documentation accordingly.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
 
-- 
2.29.2
