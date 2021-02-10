From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:58:10 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/intel-microcode:
 security bump to version 20201118
Message-ID: <20210210193801.80BFD83977@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9617f131ba4013b19c81bde25019f70a6c721636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- CVE-2020-8694: Insufficient access control in the Linux kernel driver for
  some Intel(R) Processors may allow an authenticated user to potentially
  enable information disclosure via local access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html

- CVE-2020-8695: Observable discrepancy in the RAPL interface for some
  Intel(R) Processors may allow a privileged user to potentially enable
  information disclosure via local access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html

- CVE-2020-8698: Improper removal of sensitive information before storage or
  transfer in some Intel(R) Processors may allow an authenticated user to
  potentially enable information disclosure via local access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00381.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9974d8836295797fdaa73f4ad61f741101b0c677)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index e8005bcff6..289428b4b3 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb4f939421ac6cdea3c586c9d984ec518320f00c07eb2b3d6754309c83c93371  intel-microcode-20200616.tar.gz
+sha256  e42a264b7b86e80d013d6d00062467352c1f37e0aaea10fe5b51e4d8687921ab  intel-microcode-20201118.tar.gz
 sha256  d9e989e1a7747f3ce93cb749aceca67a430d36c9bebc6e3205e0b3af3ca6304b  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index d3c0ac44e7..00c2325332 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20200616
+INTEL_MICROCODE_VERSION = 20201118
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
