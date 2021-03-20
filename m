From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:53:23 +0100
Subject: [Buildroot] [git commit] package/python-setuptools-rust: bump to
 version 0.12.1
Message-ID: <20210320212918.6234E87A16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbd2fa75b5f79a989f1b0510ed2272283bead13e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Don-t-require-optional-wheel-dependency.patch | 40 ----------------------
 .../python-setuptools-rust.hash                    |  4 +--
 .../python-setuptools-rust.mk                      |  4 +--
 3 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch b/package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch
deleted file mode 100644
index a17d41b720..0000000000
--- a/package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4de1da1189d8f6d45b71bf036fbba1101ea5ec47 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 10 Feb 2021 20:54:37 -0700
-Subject: [PATCH] Don't require optional wheel dependency.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/PyO3/setuptools-rust/pull/111]
----
- pyproject.toml | 2 +-
- setup.cfg      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index eaf552d..6abb82f 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=42", "wheel", "setuptools_scm[toml]>=3.4.3"]
-+requires = ["setuptools>=42", "setuptools_scm[toml]>=3.4.3"]
- build-backend = "setuptools.build_meta"
- 
- [tool.setuptools_scm]
-diff --git a/setup.cfg b/setup.cfg
-index c8a8fcd..d92bcde 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -28,7 +28,7 @@ classifiers =
- packages = setuptools_rust
- zip_safe = True
- install_requires = semantic_version>=2.6.0; toml>=0.9.0
--setup_requires = setuptools>=46.1; wheel; setuptools_scm[toml]>=3.4.3
-+setup_requires = setuptools>=46.1; setuptools_scm[toml]>=3.4.3
- 
- [options.entry_points]
- distutils.commands =
--- 
-2.30.0
-
diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 3ed046b159..a93e98e8c8 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  319d2968f076f37279c866e51bcccbcc  setuptools-rust-0.11.6.tar.gz
-sha256  a5b5954909cbc5d66b914ee6763f81fa2610916041c7266105a469f504a7c4ca  setuptools-rust-0.11.6.tar.gz
+md5  33c3fd3bcde2877483ab782353bee54c  setuptools-rust-0.12.1.tar.gz
+sha256  647009e924f0ae439c7f3e0141a184a69ad247ecb9044c511dabde232d3d570e  setuptools-rust-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 42bc747a3b..fe299e8057 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 0.11.6
+PYTHON_SETUPTOOLS_RUST_VERSION = 0.12.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/9d/87/7d1487395ab2e1d3c101d34b8e6ed346308f45349e5cdd3101963cc1c9cd
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/12/22/6ba3031e7cbd6eb002e13ffc7397e136df95813b6a2bd71ece52a8f89613
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
