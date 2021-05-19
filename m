From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:56:46 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/intel-microcode:
 security bump to version 20210216
Message-ID: <20210519192807.9DFE383B75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e553ad9de220fd11ae596b8536adb640a0ce312d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2020-8696: Description: Improper removal of sensitive information
  before storage or transfer in some Intel(R) Processors may allow an
  authenticated user to potentially enable information disclosure via local
  access

- CVE-2020-8698: Description: Improper isolation of shared resources in some
  Intel(R) Processors may allow an authenticated user to potentially enable
  information disclosure via local access

https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00381.html

License file updated with the new year, so change hash accordingly.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr: explain license hash change]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e87d5f643bee82a1907fef0316a1775059858dcf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 4 ++--
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 289428b4b3..23191d9531 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e42a264b7b86e80d013d6d00062467352c1f37e0aaea10fe5b51e4d8687921ab  intel-microcode-20201118.tar.gz
-sha256  d9e989e1a7747f3ce93cb749aceca67a430d36c9bebc6e3205e0b3af3ca6304b  license
+sha256  b855c81f78705f35341248a0603aa1a6e199ca7f59cd425e061b579329aa9eaa  intel-microcode-20210216.tar.gz
+sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 5a13ca2cbe..2089003880 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20201118
+INTEL_MICROCODE_VERSION = 20210216
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
