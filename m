From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Dec 2012 09:15:43 +0100
Subject: [Buildroot] [git commit] toolchain-crosstool-ng: update PPL and
	CLoog versions in default configs
Message-ID: <20121221082522.E83609A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdc61667e8d3867b1d196be33ad85f8597463d6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have updated our Crosstool-NG configuration to gcc 4.6.x, but the
PPL and CLoog versions were not updated accordingly. With gcc 4.6.x,
at least PPL 0.11 is needed, and only CLoog > 0.15.9 can work with PLL
0.11.

Fixes:

  http://autobuild.buildroot.org/results/c22758a30c3b8abb582150cefd7099605c527e14/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng.config-eglibc                     |   16 ++++++++++------
 .../crosstool-ng.config-glibc                      |   16 ++++++++++------
 .../crosstool-ng.config-uClibc                     |   16 ++++++++++------
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 11eb602..08f036c 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -474,18 +474,22 @@ CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
 CT_MPFR_VERSION="2.4.2"
-# CT_PPL_V_0_11_2 is not set
+CT_PPL_V_0_11_2=y
 # CT_PPL_V_0_11_1 is not set
 # CT_PPL_V_0_11 is not set
-CT_PPL_V_0_10_2=y
-CT_PPL_VERSION="0.10.2"
-# CT_CLOOG_V_0_15_11 is not set
+# CT_PPL_V_0_10_2 is not set
+CT_PPL_VERSION="0.11.2"
+CT_PPL_0_11=y
+CT_PPL_NEEDS_LIBPWL=y
+CT_CLOOG_V_0_15_11=y
 # CT_CLOOG_V_0_15_10 is not set
-CT_CLOOG_V_0_15_9=y
+# CT_CLOOG_V_0_15_9 is not set
 # CT_CLOOG_V_0_15_8 is not set
 # CT_CLOOG_V_0_15_7 is not set
 # CT_CLOOG_V_0_15_6 is not set
-CT_CLOOG_VERSION="0.15.9"
+CT_CLOOG_VERSION="0.15.11"
+CT_CLOOG_0_15_1x=y
+CT_CLOOG_NEEDS_AUTORECONF=y
 CT_MPC_V_0_9=y
 # CT_MPC_V_0_8_2 is not set
 # CT_MPC_V_0_8_1 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index c30a115..ae0bc02 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -463,18 +463,22 @@ CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
 CT_MPFR_VERSION="2.4.2"
-# CT_PPL_V_0_11_2 is not set
+CT_PPL_V_0_11_2=y
 # CT_PPL_V_0_11_1 is not set
 # CT_PPL_V_0_11 is not set
-CT_PPL_V_0_10_2=y
-CT_PPL_VERSION="0.10.2"
-# CT_CLOOG_V_0_15_11 is not set
+# CT_PPL_V_0_10_2 is not set
+CT_PPL_VERSION="0.11.2"
+CT_PPL_0_11=y
+CT_PPL_NEEDS_LIBPWL=y
+CT_CLOOG_V_0_15_11=y
 # CT_CLOOG_V_0_15_10 is not set
-CT_CLOOG_V_0_15_9=y
+# CT_CLOOG_V_0_15_9 is not set
 # CT_CLOOG_V_0_15_8 is not set
 # CT_CLOOG_V_0_15_7 is not set
 # CT_CLOOG_V_0_15_6 is not set
-CT_CLOOG_VERSION="0.15.9"
+CT_CLOOG_VERSION="0.15.11"
+CT_CLOOG_0_15_1x=y
+CT_CLOOG_NEEDS_AUTORECONF=y
 CT_MPC_V_0_9=y
 # CT_MPC_V_0_8_2 is not set
 # CT_MPC_V_0_8_1 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index e93128b..4f21263 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -445,18 +445,22 @@ CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
 CT_MPFR_VERSION="2.4.2"
-# CT_PPL_V_0_11_2 is not set
+CT_PPL_V_0_11_2=y
 # CT_PPL_V_0_11_1 is not set
 # CT_PPL_V_0_11 is not set
-CT_PPL_V_0_10_2=y
-CT_PPL_VERSION="0.10.2"
-# CT_CLOOG_V_0_15_11 is not set
+# CT_PPL_V_0_10_2 is not set
+CT_PPL_VERSION="0.11.2"
+CT_PPL_0_11=y
+CT_PPL_NEEDS_LIBPWL=y
+CT_CLOOG_V_0_15_11=y
 # CT_CLOOG_V_0_15_10 is not set
-CT_CLOOG_V_0_15_9=y
+# CT_CLOOG_V_0_15_9 is not set
 # CT_CLOOG_V_0_15_8 is not set
 # CT_CLOOG_V_0_15_7 is not set
 # CT_CLOOG_V_0_15_6 is not set
-CT_CLOOG_VERSION="0.15.9"
+CT_CLOOG_VERSION="0.15.11"
+CT_CLOOG_0_15_1x=y
+CT_CLOOG_NEEDS_AUTORECONF=y
 CT_MPC_V_0_9=y
 # CT_MPC_V_0_8_2 is not set
 # CT_MPC_V_0_8_1 is not set
