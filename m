From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Feb 2013 22:31:21 +0100
Subject: [Buildroot] [PATCH 01/11] manual: fix cross-refs
In-Reply-To: <cover.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
Message-ID: <29c963fa2feb3c10ed9e5d1df37fd931a00214ab.1361827174.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/configure.txt           | 3 +++
 docs/manual/customize-store.txt     | 7 ++++++-
 docs/manual/customize-toolchain.txt | 2 +-
 docs/manual/working-with.txt        | 3 ++-
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 86cb173..4f9a6bb 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -64,6 +64,7 @@ Type+ option in the +Toolchain+ menu. Once one solution has been
 chosen, a number of configuration options appear, they are detailed in
 the following sections.
 
+[[internal-toolchain-backend]]
 Internal toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -138,6 +139,7 @@ Drawbacks of this backend:
   using the _External toolchain backend_.
 * Limited to the _uClibc_ C library.
 
+[[external-toolchain-backend]]
 External toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -240,6 +242,7 @@ Drawbacks of this backend:
   fix from the toolchain vendor, unless you build your external
   toolchain by yourself using Crosstool-NG.
 
+[[crosstool-ng-toolchain-backend]]
 Crosstool-NG toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index d770f0e..5083339 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -13,10 +13,13 @@ consists of the buildroot configuration, the configuration files for
 packages that you use (kernel, busybox, uClibc, ...), and your rootfs
 modifications.
 
+
+[[customize-store-basics]]
 Basics for storing the configuration
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-[[customize-store-basics]]
 
+
+[[customize-store-buildroot-config]]
 Buildroot configuration
 ^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -35,6 +38,7 @@ Alternatively, you can copy the file to any other place and rebuild with
 +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
 
 
+[[customize-store-package-config]]
 Other package configuration
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -71,6 +75,7 @@ configuration files easier.
   resp. +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 
 
+[[customize-store-board-support]]
 Creating your own board support
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 4397979..811a6dc 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -15,7 +15,7 @@ There is no way of tuning an external toolchain since Buildroot does not
 generate it.
 
 It also requires to set the Buildroot settings according to the toolchain ones
-(see xref:external-toolchain[]).
+(see xref:external-toolchain-backend[]).
 
 Using the internal Buildroot toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index b69d1e2..a57169c 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -25,4 +25,5 @@ interested in hacking it to add:
 
 * new packages: refer to the xref:adding-packages[Developer guide]
 
-* new board support: refer to the xref:board-support[Developer guide]
+* new board support: refer to the xref:customize-store[], more specifically
+  xref:customize-store-board-support[].
-- 
1.8.1.4
