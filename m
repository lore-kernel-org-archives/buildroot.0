From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:42:08 +0200
Subject: [Buildroot] [git commit] package/lttng-tools: bump version to 2.12.1
Message-ID: <20200627144242.4B43282612@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c560bcd52b2fbca1d99815dbef5108c9ea51757d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update hash file formatting (2 spaces).

License files got moved into a subfolder,
use those new paths.

Also the package is (L)GPL only, so remove the
"or higher".

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-tools/lttng-tools.hash | 14 +++++++++-----
 package/lttng-tools/lttng-tools.mk   |  6 +++---
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index f5f9fdbbdc..a27b419e75 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,6 +1,10 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.11.0.tar.bz2.sha256
-sha256 dce493c82db673c96049b5fad155a760fa449fab3d92467a69fcb0ddaf3f0fbc  lttng-tools-2.11.0.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.12.1.tar.bz2.sha256
+sha256  0de7afc1f40a5acbede933cdfd6cf47b32ff84d02e170a1321f7fc86141585b8  lttng-tools-2.12.1.tar.bz2
+
 # Locally computed
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
-sha256 051be1f11b508ef7bb839994f6b58be19a827c56bd9bddfe36d77d3d4be55abe  lgpl-2.1.txt
-sha256 f07515677547da5f3ee2396bdf491affc1accd5e4765a5378b6e1e98392fd5e7  LICENSE
+sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSES/BSD-2-Clause
+sha256  7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  LICENSES/BSD-3-Clause
+sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
+sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f85f6bcbce..b1b0a24a4f 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.11.0
+LTTNG_TOOLS_VERSION = 2.12.1
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
-LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
-LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
+LTTNG_TOOLS_LICENSE = GPL-2.0, LGPL-2.1 (include/lttng/*, src/lib/lttng-ctl/*)
+LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Clause GPL-2.0 LGPL-2.1 MIT)
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 
