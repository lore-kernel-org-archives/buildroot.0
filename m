From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jun 2020 22:18:48 +0200
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20200616
Message-ID: <20200621201849.30819-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains mitigations for the Special Register Buffer Data Sampling
(CVE-2020-0543), Vector Register Sampling (CVE-2020-0548) and L1D
Eviction Sampling (CVE-2020-0549) hardware vulnerabilities.

For more details, see the advisories:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00320.html
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00329.html

Adjust the license hash for a change of copyright year:
-Copyright (c) 2018-2019 Intel Corporation.
+Copyright (c) 2018-2020 Intel Corporation.

And adjust the .hash file to use two spaces.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 4 ++--
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index f9fce28b2d..e8005bcff6 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0000f7cf96f2b07a1ba9d1fc0bcfcb49d0edb91f7d487a57a88c147e57c5873b  intel-microcode-20191112.tar.gz
-sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
+sha256  eb4f939421ac6cdea3c586c9d984ec518320f00c07eb2b3d6754309c83c93371  intel-microcode-20200616.tar.gz
+sha256  d9e989e1a7747f3ce93cb749aceca67a430d36c9bebc6e3205e0b3af3ca6304b  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index f3d05d5f58..043367770b 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20191112
+INTEL_MICROCODE_VERSION = 20200616
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.20.1
