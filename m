From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:21:29 +0100
Subject: [Buildroot] [git commit] package/pkg-python: <pkg>_SUBDIR cleanup
Message-ID: <20190206162018.B4C2881F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a54e58e9b2e60935e9baac2989a00e66d0637c46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change is brought by this modification.

This patch:
* removes redundant <pkg>_SRCDIR and <pkg>_BUILDDIR declarations
  (already defined in pkg-generic.mk)
* documents the usage of <pkg>_SUBDIR in the python-specific section of
  the manual.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-python.txt | 6 ++++++
 package/pkg-python.mk                  | 3 ---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 5eb6ba51b1..15137cfd6d 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -113,6 +113,12 @@ optionally be defined, depending on the package's needs. Many of them
 are only useful in very specific cases, typical packages will
 therefore only use a few of them, or none.
 
+* +PYTHON_FOO_SUBDIR+ may contain the name of a subdirectory inside the
+  package that contains the main +setup.py+ file. This is useful,
+  if for example, the main +setup.py+ file is not at the root of
+  the tree extracted by the tarball. If +HOST_PYTHON_FOO_SUBDIR+ is not
+  specified, it defaults to +PYTHON_FOO_SUBDIR+.
+
 * +PYTHON_FOO_ENV+, to specify additional environment variables to
   pass to the Python +setup.py+ script (for both the build and install
   steps). Note that the infrastructure is automatically passing
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 8d40a7ca48..e906920417 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -105,9 +105,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 
 define inner-python-package
 
-$(2)_SRCDIR	= $$($(2)_DIR)/$$($(2)_SUBDIR)
-$(2)_BUILDDIR	= $$($(2)_SRCDIR)
-
 $(2)_ENV         ?=
 $(2)_BUILD_OPTS   ?=
 $(2)_INSTALL_OPTS ?=
