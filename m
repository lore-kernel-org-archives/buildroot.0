From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:37:46 +0100
Subject: [Buildroot] [PATCH 2/6] Update documentation about external
	toolchain
In-Reply-To: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
References: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <416936aafd47554a43aa0b43ccc3862a48689a2b.1296398261.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reword the documentation on external toolchain to take into account
the new features added since 2010.11 concerning external toolchain
profiles.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   61 ++++++++++++++++++++++++++++++++------------------
 1 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index d58c19a..c4508f2 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -706,31 +706,48 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     </ul>
 
     <p>Buildroot supports using existing toolchains through a
-    mechanism called <i>external toolchain</i>.</p>
+    mechanism called <i>external toolchain</i>. The external toolchain
+    mechanism is enabled in the <code>Toolchain</code> menu, by
+    selecting <code>External toolchain</code> in <code>Toolchain
+    type</code>.</p>
 
-    <p>To enable the use of an external toolchain, go to the
-    <code>Toolchain</code> menu, and :</p>
+    <p>Then, you have three solutions to use an external
+    toolchain:</p>
 
     <ul>
-      <li>Select the <code>External binary toolchain</code> toolchain
-      type</li>
-      <li>Select the appropriate <code>External toolchain C
-      library</code></li>
-      <li>Select the appropriate values for <code>Enable large
-      file</code>, <code>Enable IPv6</code>, <code>Enable
-      RPC</code>, <code>Enable toolchain
-      locale/i18n</code>, <code>Enable WCHAR</code>, <code>Enable
-      program invocation</code>, <code>Build/install c++ compiler and
-      libstdc++</code>, according to the configuration of your
-      external toolchain. Buildroot will check those values at the
-      beginning of the compilation process and will tell you if you
-      used incorrect values.</li>
-      <li>Adjust the <code>External toolchain path</code>
-      appropriately. It should be set to a path where a bin/ directory
-      contains your cross-compiling tools</li>
-      <li>Adjust the <code>External toolchain prefix</code> so that the
-      prefix, suffixed with <code>-gcc</code> or <code>-ld</code> will
-      correspond to your cross-compiling tools</li>
+
+      <li>Use a predefined external toolchain profile, and let
+      Buildroot download, extract and install the toolchain. Buildroot
+      already knows about a few CodeSourcery toolchains for ARM,
+      PowerPC, MIPS and SuperH. Just select the toolchain profile
+      in <code>Toolchain</code> through the available ones. This is
+      definitely the easiest solution.</li>
+
+      <li>Use a predefined external toolchain profile, but instead of
+      having Buildroot download and extract the toolchain, you can
+      tell Buildroot where your toolchain is already installed on your
+      system. Just select the toolchain profile
+      in <code>Toolchain</code> through the available ones,
+      unselect <code>Download toolchain automatically</code>, and fill
+      the <code>Toolchain path</code> text entry with the path to your
+      cross-compiling toolchain.</li>
+
+      <li>Use a completely custom external toolchain. This is
+      particularly useful for toolchains generated using
+      Crosstool-NG. To do this, select the <code>Custom
+      toolchain</code> solution in the <code>Toolchain</code>
+      list. You need to fill the <code>Toolchain
+      path</code>, <code>Toolchain prefix</code> and <code>External
+      toolchain C library</code> options. Then, you have to tell
+      Buildroot what your external toolchain supports. If your
+      external toolchain uses the <i>glibc</i> library, you only have
+      to tell whether your toolchain supports C++ or not. If your
+      external toolchain uses the <i>uclibc</i> library, then you have
+      to tell Buildroot if it supports largefile, IPv6, RPC,
+      wide-char, locale, program invocation, threads and C++. At the
+      beginning of the execution, Buildroot will tell you if the
+      selected options do not match the toolchain configuration.</li>
+
     </ul>
 
     <p>Our external toolchain support has been tested with toolchains
-- 
1.7.0.4
