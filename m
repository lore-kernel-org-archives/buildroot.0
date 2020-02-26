From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 26 Feb 2020 06:30:07 -0800
Subject: [Buildroot] [PATCH/next 1/1] package/meson: bump version to 0.53.2
Message-ID: <20200226143007.25595-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch   | 2 +-
 ...2-Prefer-ext-static-libs-when-default-library-static.patch | 2 +-
 .../meson/0003-envconfig-add-pkg_config_libdir-property.patch | 4 ++--
 package/meson/meson.hash                                      | 4 ++--
 package/meson/meson.mk                                        | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
index a7b66c1067..79e99adf4a 100644
--- a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
+++ b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
@@ -14,7 +14,7 @@ diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
 index 8ac6aab1..7ef04116 100644
 --- a/mesonbuild/minstall.py
 +++ b/mesonbuild/minstall.py
-@@ -478,8 +478,14 @@ class Installer:
+@@ -489,8 +489,14 @@ class Installer:
                          printed_symlink_error = True
              if os.path.isfile(outname):
                  try:
diff --git a/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
index 798cd65299..b859d8372e 100644
--- a/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
@@ -30,7 +30,7 @@ diff --git a/mesonbuild/compilers/mixins/clike.py b/mesonbuild/compilers/mixins/
 index 5d50b7d..8f5f1c6 100644
 --- a/mesonbuild/compilers/mixins/clike.py
 +++ b/mesonbuild/compilers/mixins/clike.py
-@@ -858,6 +858,9 @@ class CLikeCompiler:
+@@ -857,6 +857,9 @@ class CLikeCompiler:
          elif env.machines[self.for_machine].is_cygwin():
              shlibext = ['dll', 'dll.a']
              prefixes = ['cyg'] + prefixes
diff --git a/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch b/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
index ae40ab8b1c..8ae34b999d 100644
--- a/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
+++ b/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
@@ -53,7 +53,7 @@ diff --git a/run_unittests.py b/run_unittests.py
 index 676604f4..382c0964 100755
 --- a/run_unittests.py
 +++ b/run_unittests.py
-@@ -3621,6 +3621,34 @@ recommended as it is not supported on some platforms''')
+@@ -3629,6 +3629,34 @@ recommended as it is not supported on some platforms''')
          self.wipe()
          self.init(testdir, extra_args=['-Dstart_native=true'], override_envvars=env)
  
@@ -88,7 +88,7 @@ index 676604f4..382c0964 100755
      def __reconfigure(self, change_minor=False):
          # Set an older version to force a reconfigure from scratch
          filename = os.path.join(self.privatedir, 'coredata.dat')
-@@ -6847,7 +6875,7 @@ class NativeFileTests(BasePlatformTests):
+@@ -6863,7 +6891,7 @@ class NativeFileTests(BasePlatformTests):
  
  class CrossFileTests(BasePlatformTests):
  
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 881d4211cf..3777a51542 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.53.1/meson-0.53.1.tar.gz.asc
-sha256 ec1ba33eea701baca2c1607dac458152dc8323364a51fdef6babda2623413b04 meson-0.53.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.53.2/meson-0.53.2.tar.gz.asc
+sha256 3e8f830f33184397c2eb0b651ec502adb63decb28978bdc84b3558d71284c21f meson-0.53.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 810c84690a..29c7ed1800 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.53.1
+MESON_VERSION = 0.53.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.21.1 (Apple Git-122.3)
