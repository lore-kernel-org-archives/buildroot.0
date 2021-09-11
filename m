Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE62C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:00:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714506113A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 714506113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 440D6415BC;
	Sat, 11 Sep 2021 15:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VVYbCPNkymL; Sat, 11 Sep 2021 15:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F801415A7;
	Sat, 11 Sep 2021 15:00:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17F0E1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08035607D2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jTervZDJ5T2O for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:00:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 279EE607A7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EF8E189078; Sat, 11 Sep 2021 14:58:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:58:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65cee90cc3cec4da11987370ea2de35d32f046b5
X-Git-Newrev: 271461b81b4dade1f05cfe7212e88a508ff2e1a0
X-Patchwork-Hint: ignore
Message-Id: <20210911145842.EF8E189078@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: bump version to 1661
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=271461b81b4dade1f05cfe7212e88a508ff2e1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the version to 1661 and remove the patch
0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch.
This patch is no longer needed because the fix has been added upstream.

Signed-off-by: Philippe Reynes <philippe.reynes@softathome.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Use-LONG_BIT-to-define-RADIX_BITS.patch   | 28 +++++++++++---------
 ...l-variable-to-fix-compilation-with-GCC-10.patch | 30 ----------------------
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash               |  2 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.mk                 |  2 +-
 4 files changed, 18 insertions(+), 44 deletions(-)

diff --git a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
index c84e359a55..4d86534899 100644
--- a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
+++ b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
@@ -1,4 +1,4 @@
-From 5aeb25abf13de43b9e497f6509209911dd1386b8 Mon Sep 17 00:00:00 2001
+From 7ea7fe229ea6195938d9eadbe783cb1aa74380ba Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 26 Apr 2020 15:33:39 +0200
 Subject: [PATCH] Use LONG_BIT to define RADIX_BITS
@@ -13,28 +13,32 @@ as we're now using >= POSIX.1-2001 definitions of fd_set and friends.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
- src/LibSupport.h     | 17 +++--------------
+ src/LibSupport.h     | 21 +++------------------
  src/TcpServerPosix.c |  1 +
  src/makefile         |  2 ++
- 3 files changed, 6 insertions(+), 14 deletions(-)
+ 3 files changed, 6 insertions(+), 18 deletions(-)
 
 diff --git a/src/LibSupport.h b/src/LibSupport.h
-index b2e6a51..0b59d18 100644
+index 5055560..48b1e16 100644
 --- a/src/LibSupport.h
 +++ b/src/LibSupport.h
-@@ -64,20 +64,9 @@
+@@ -64,24 +64,9 @@
  #ifndef _LIB_SUPPORT_H_
  #define _LIB_SUPPORT_H_
  
+-/* kgold added power and s390 */
 -#ifndef RADIX_BITS
 -#   if defined(__x86_64__) || defined(__x86_64)				\
--    || defined(__amd64__) || defined(__amd64) || defined(_WIN64) || defined(_M_X64) \
--    || defined(_M_ARM64) || defined(__aarch64__) \
--    || defined(__powerpc64__) || defined(__ppc64__)
+-    || defined(__amd64__) || defined(__amd64)				\
+-    || defined(_WIN64) || defined(_M_X64)		 		\
+-    || defined(_M_ARM64) || defined(__aarch64__) 			\
+-    || defined(__powerpc64__) || defined(__PPC64__) || defined(__ppc64__) \
+-    || defined(__s390x__)
 -#       define RADIX_BITS                      64
 -#   elif defined(__i386__) || defined(__i386) || defined(i386)		\
 -    || defined(_WIN32) || defined(_M_IX86)				\
--    || defined(_M_ARM) || defined(__arm__) || defined(__thumb__)
+-    || defined(_M_ARM) || defined(__arm__) || defined(__thumb__)	\
+-    || defined(__powerpc__) || defined(__PPC__)
 -#       define RADIX_BITS                      32
 -#   else
 -#       error Unable to determine RADIX_BITS from compiler environment
@@ -47,13 +51,13 @@ index b2e6a51..0b59d18 100644
  // These macros use the selected libraries to the proper include files.
  #define LIB_QUOTE(_STRING_) #_STRING_
 diff --git a/src/TcpServerPosix.c b/src/TcpServerPosix.c
-index 20fcb29..bdac7aa 100644
+index cad0402..6293cdd 100644
 --- a/src/TcpServerPosix.c
 +++ b/src/TcpServerPosix.c
 @@ -66,6 +66,7 @@
  
  #include <stdio.h>
- /* FIXME need Posix TCP socket code */
+ #include <stdbool.h>
 +#include <sys/select.h>
  #include <unistd.h>
  #include <sys/types.h>
@@ -72,5 +76,5 @@ index f124e78..6ee128e 100644
  
  # add this line for big endian platforms
 -- 
-2.26.2
+2.17.1
 
diff --git a/package/ibm-sw-tpm2/0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch b/package/ibm-sw-tpm2/0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch
deleted file mode 100644
index ff82a1806a..0000000000
--- a/package/ibm-sw-tpm2/0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9bd2926c0f359f143141c32c2b261ca100d804c8 Mon Sep 17 00:00:00 2001
-From: Jonas Witschel <diabonas@archlinux.org>
-Date: Wed, 13 May 2020 10:56:03 +0200
-Subject: [PATCH] Remove unused global variable to fix compilation with GCC 10
-
-GCC defaults to -fno-common, resulting in a compilation error:
-
-CryptSym.h:84: multiple definition of `tpmCryptKeySchedule'
-
-Since the global variable is not used anywhere, it can be removed.
-[Retrieved from:
-https://github.com/kgoldman/ibmswtpm2/pull/3/commits/9bd2926c0f359f143141c32c2b261ca100d804c8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/CryptSym.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CryptSym.h b/src/CryptSym.h
-index 7b58e41..9a33b13 100644
---- a/src/CryptSym.h
-+++ b/src/CryptSym.h
-@@ -81,7 +81,7 @@ union tpmCryptKeySchedule_t {
- #else
-     uint32_t            alignment;
- #endif
--} tpmCryptKeySchedule;
-+};
- /* Each block cipher within a library is expected to conform to the same calling conventions with
-    three parameters (keySchedule, in, and out) in the same order. That means that all algorithms
-    would use the same order of the same parameters. The code is written assuming the (keySchedule,
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
index f57dcbbb5b..bddcd57f21 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -2,5 +2,5 @@
 sha1  a2a5335024a2edc1739f08b99e716fa355be627d  ibmtpm1563.tar.gz
 md5  13013612b3a13dc935fefe1a5684179c  ibmtpm1563.tar.gz
 # Locally computed:
-sha256  fc3a17f8315c1f47670764f2384943afc0d3ba1e9a0422dacb08d455733bd1e9  ibmtpm1563.tar.gz
+sha256  55145928ad2b24f34be6a0eacf9fb492e10e0ea919b8428c721fa970e85d6147  ibmtpm1661.tar.gz
 sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
index 58102667d1..1e4dc949c1 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IBM_SW_TPM2_VERSION = 1563
+IBM_SW_TPM2_VERSION = 1661
 IBM_SW_TPM2_SOURCE = ibmtpm$(IBM_SW_TPM2_VERSION).tar.gz
 IBM_SW_TPM2_SITE = https://sourceforge.net/projects/ibmswtpm2/files
 IBM_SW_TPM2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
