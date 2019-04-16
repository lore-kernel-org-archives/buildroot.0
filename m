From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Apr 2019 22:14:04 +0200
Subject: [Buildroot] [PATCH] package/tpm2-tss: bump version to 2.1.3
Message-ID: <20190416201404.908-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a number of issues discovered post-2.1.2. For details, see:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.1.3

Drop 002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch as this
issue is now fixed upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-switch-default-ESAPI-crypto-backend-to-.patch | 32 ----------------------
 package/tpm2-tss/tpm2-tss.hash                     |  2 +-
 package/tpm2-tss/tpm2-tss.mk                       |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch

diff --git a/package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch b/package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch
deleted file mode 100644
index a864293d58..0000000000
--- a/package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From aa8d9b2bb2faeb0c6cc03548cc363d90d3414f15 Mon Sep 17 00:00:00 2001
-From: Tadeusz Struk <tadeusz.struk@intel.com>
-Date: Tue, 23 Oct 2018 16:04:25 -0700
-Subject: [PATCH] configure.ac: switch default ESAPI crypto backend to openSSL
-
-Switch the default ESAPI crypto backend to openSSL.
-This should also fix the problem with forcing applications to
-link against libgcrypt.
-
-Fixes: #1169
-
-Signed-off-by: Tadeusz Struk <tadeusz.struk@intel.com>
-[Peter: drop configure.ac hunk, only drop hard coded -lcrypt from .pc]
-(cherry picked from commit a5ff71abeda9a5aea269812de32afb79ef3fcb4d)
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/tss2-esys.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/tss2-esys.pc.in b/lib/tss2-esys.pc.in
-index 792f0191..ecb01bc1 100644
---- a/lib/tss2-esys.pc.in
-+++ b/lib/tss2-esys.pc.in
-@@ -4,4 +4,4 @@ URL: https://github.com/tpm2-software/tpm2-tss
- Version: @VERSION@
- Requires: tss2-mu tss2-sys
- Cflags: -I at includedir@
--Libs: -ltss2-esys -lgcrypt -L at libdir@
-+Libs: -ltss2-esys -L at libdir@
--- 
-2.11.0
-
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index a9a9f3c963..9368357c77 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 aba502ba70c7697a4ef1ff01a81802d4c6570509dd94acee74bb06d6d1e9f68c  tpm2-tss-2.1.2.tar.gz
+sha256 bddfa4ab2ceb6394bcacf7db5d6419cbfabdb22702b6df75c59e60dd5f3fafb5  tpm2-tss-2.1.3.tar.gz
 sha256 f7da3c2da12cec3348bb7ee9e2a9e651a241450b2efb67da29d5a75ef2da058a  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 3b730acdeb..e02abb446c 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 2.1.2
+TPM2_TSS_VERSION = 2.1.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
-- 
2.11.0
