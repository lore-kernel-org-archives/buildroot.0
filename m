From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2019 17:18:49 +0100
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20191112
Message-ID: <20191113161849.23872-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains mitigations for the following security vulnerabilities:

- CVE-2019-11135: Intel TSX Asynchronous Abort vulnerability:
  https://software.intel.com/security-software-guidance/insights/deep-dive-intel-transactional-synchronization-extensions-intel-tsx-asynchronous-abort

- CVE-2019-11139: Intel Xeon Scalable Processors Voltage Setting Modulation
  vulnerability:
  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00271.html

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20191112

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 5d340e627f..f9fce28b2d 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2b6b728d351764dfbf6a9763ac96ae7e04085f382a309fed3abc0118f094c943  intel-microcode-20190918.tar.gz
+sha256 0000f7cf96f2b07a1ba9d1fc0bcfcb49d0edb91f7d487a57a88c147e57c5873b  intel-microcode-20191112.tar.gz
 sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index a4d4a01f71..0492ace69e 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20190918
+INTEL_MICROCODE_VERSION = 20191112
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.20.1
