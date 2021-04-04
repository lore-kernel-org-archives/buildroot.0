From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 21:07:04 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/botan: add
 support for riscv32
Message-ID: <20210404190227.60B4E8427D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f9552bb50b216a2be071bd4af266ecd2db6e532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Backport an upstream patch to add support for riscv32. Although this is
a new feature (new arch support), this is an upstream commit, so we can
expect it to be available in a future release.

Fixes:
 - http://autobuild.buildroot.org/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - technically, this is not a bug fix, but new arch support
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 08a0e9bd065b925856b5724f955dd0873d85703c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/0003-Add-support-for-riscv32.patch | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/botan/0003-Add-support-for-riscv32.patch b/package/botan/0003-Add-support-for-riscv32.patch
new file mode 100644
index 0000000000..d8978b2f11
--- /dev/null
+++ b/package/botan/0003-Add-support-for-riscv32.patch
@@ -0,0 +1,31 @@
+From 443bf46ee2b1b1d7acd63e3f00dcbe66646138f8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 2 Apr 2021 20:37:03 +0200
+Subject: [PATCH] Add support for riscv32
+
+Fix the following build failure:
+
+  ERROR: Unknown or unidentifiable processor "riscv32"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/randombit/botan/commit/aa7958880bee2091a8a71bf9e1f6e6efb34581e3]
+---
+ src/build-data/arch/riscv32.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+ create mode 100644 src/build-data/arch/riscv32.txt
+
+diff --git a/src/build-data/arch/riscv32.txt b/src/build-data/arch/riscv32.txt
+new file mode 100644
+index 000000000..ba88b42e9
+--- /dev/null
++++ b/src/build-data/arch/riscv32.txt
+@@ -0,0 +1,2 @@
++family riscv32
++endian little
+-- 
+2.30.2
+
