From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:55:41 +0200
Subject: [Buildroot] [git commit] package/libfuse3: bump to version 3.9.2
Message-ID: <20200617205529.A86668447F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=980d47c88d2454f0acb90c4978c93ffd18402ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (applied upstream).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-meson.build-libfuse-is-a-C-only-project.patch | 39 ----------------------
 package/libfuse3/libfuse3.hash                     |  2 +-
 package/libfuse3/libfuse3.mk                       |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch b/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch
deleted file mode 100644
index 279f590ce9..0000000000
--- a/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From fc25c5002cae23151309fce6059e230545fd4d82 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 20 Apr 2020 21:20:19 +0200
-Subject: [PATCH] Do not require C++ compiler for building
-
-Fixes:
- - http://autobuild.buildroot.org/results/a6e64213f2910b2b81e79cb1e96e558413d7f70a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/libfuse/libfuse/commit/fc25c5002cae23151309fce6059e230545fd4d82]
----
- example/meson.build | 2 +-
- meson.build         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/example/meson.build b/example/meson.build
-index 3edddea9..2342df9c 100644
---- a/example/meson.build
-+++ b/example/meson.build
-@@ -31,7 +31,7 @@ foreach ex : threaded_examples
-                install: false)
- endforeach
- 
--if not platform.endswith('bsd') and platform != 'dragonfly'
-+if not platform.endswith('bsd') and platform != 'dragonfly' and add_languages('cpp', required : false)
-     executable('passthrough_hp', 'passthrough_hp.cc',
-                dependencies: [ thread_dep, libfuse_dep ],
-                install: false)
-diff --git a/meson.build b/meson.build
-index 69b3630d..4428bdb9 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('libfuse3', ['cpp', 'c'], version: '3.9.1',
-+project('libfuse3', ['c'], version: '3.9.1',
-         meson_version: '>= 0.42',
-         default_options: [ 'buildtype=debugoptimized' ])
- 
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index bc09da4cf8..c7f371368a 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  4f3dea4979c30fbd85f46b8812bee5945bd6bb4487165eb01ecde57bbfbb332f  libfuse3-3.9.1.tar.gz
+sha256  b4409255cbda6f6975ca330f5b04cb335b823a95ddd8c812c3d224ec53478fc0  libfuse3-3.9.2.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index d23d8d9a43..1e959640e2 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.9.1
+LIBFUSE3_VERSION = 3.9.2
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
