From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 12:10:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/speex: bump version to 1.2.0
In-Reply-To: <20180610101024.5035-1-bernd.kuhls@t-online.de>
References: <20180610101024.5035-1-bernd.kuhls@t-online.de>
Message-ID: <20180610101024.5035-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added upstream md5 & locally computed license hashes, rebased patch,
updated SPEEX_SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/speex/0001-thumb2-support.patch | 6 ++++--
 package/speex/speex.hash                | 8 ++++++--
 package/speex/speex.mk                  | 4 ++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/speex/0001-thumb2-support.patch b/package/speex/0001-thumb2-support.patch
index b6f7369299..092fa13252 100644
--- a/package/speex/0001-thumb2-support.patch
+++ b/package/speex/0001-thumb2-support.patch
@@ -4,6 +4,8 @@ Patch written by Michael Hope from Linaro, available at
 http://lists.xiph.org/pipermail/speex-dev/2010-November/008041.html.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Bernd: rebased for 1.2.0]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff --git a/libspeex/filters_arm4.h b/libspeex/filters_arm4.h
 index 7a74042..6ec1f75 100644
@@ -12,10 +14,10 @@ index 7a74042..6ec1f75 100644
 @@ -47,8 +47,10 @@ int normalize16(const spx_sig_t *x, spx_word16_t *y, spx_sig_t max_scale, int le
  
           "\tldr %4, [%0], #4 \n"
-          "\tcmps %4, %1 \n"
+          "\tcmp %4, %1 \n"
 +         "\tit gt \n"
           "\tmovgt %1, %4 \n"
-          "\tcmps %4, %3 \n"
+          "\tcmp %4, %3 \n"
 +         "\tit lt \n"
           "\tmovlt %3, %4 \n"
  
diff --git a/package/speex/speex.hash b/package/speex/speex.hash
index c38a0a7b22..f5235d6262 100644
--- a/package/speex/speex.hash
+++ b/package/speex/speex.hash
@@ -1,2 +1,6 @@
-# From http://downloads.xiph.org/releases/speex/SHA256SUMS.txt
-sha256	342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6	speex-1.2rc1.tar.gz
+# From https://downloads.xiph.org/releases/speex/SHA256SUMS.txt
+sha256 eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094  speex-1.2.0.tar.gz
+# From https://downloads.xiph.org/releases/speex/MD5SUMS
+md5 8ab7bb2589110dfaf0ed7fa7757dc49c  speex-1.2.0.tar.gz
+# Locally computed
+sha256 671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 516e89929a..c6b46e0eb3 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SPEEX_VERSION = 1.2rc1
-SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
+SPEEX_VERSION = 1.2.0
+SPEEX_SITE = https://downloads.xiph.org/releases/speex
 SPEEX_LICENSE = BSD-3-Clause
 SPEEX_LICENSE_FILES = COPYING
 SPEEX_INSTALL_STAGING = YES
-- 
2.17.1
