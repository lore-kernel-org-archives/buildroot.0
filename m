Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1AAEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FE760C19;
	Tue, 18 Jul 2023 20:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FE760C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43GPWFpMnxEO; Tue, 18 Jul 2023 20:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49EC760B4C;
	Tue, 18 Jul 2023 20:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49EC760B4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E281D1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C967B40589
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C967B40589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNZNm5YXBxmP for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:54:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 032F440280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 032F440280
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2B9A873F8; Tue, 18 Jul 2023 20:54:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:53:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c606acfbe77968f6a6684e35c49cd7b75002eec
X-Git-Newrev: 3d6bbf4bae81826e6756e62fc0e974777b8e3d92
X-Patchwork-Hint: ignore
Message-Id: <20230718205401.E2B9A873F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d6bbf4bae81826e6756e62fc0e974777b8e3d92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from tarball to git checkout, upstream does not provide tarballs
anymore: https://sourceforge.net/projects/ibmswtpm2/files/

Rebased patch.

This bump introduces compatibility with OpenSSL 3.x:
https://sourceforge.net/p/ibmswtpm2/tpm2/ci/920ce656af833ce6fb2b76c34cf8f58a4b6a4175/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Use-LONG_BIT-to-define-RADIX_BITS.patch           | 14 ++++++++++++--
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash                       |  5 +----
 package/ibm-sw-tpm2/ibm-sw-tpm2.mk                         |  6 +++---
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
index 4d86534899..bb5d3a96ee 100644
--- a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
+++ b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
@@ -12,6 +12,8 @@ as we're now using >= POSIX.1-2001 definitions of fd_set and friends.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[Bernd: rebased for git rev 5452af422edeff70fcae8ea99dd28a0922051d7b]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/LibSupport.h     | 21 +++------------------
  src/TcpServerPosix.c |  1 +
@@ -22,7 +24,7 @@ diff --git a/src/LibSupport.h b/src/LibSupport.h
 index 5055560..48b1e16 100644
 --- a/src/LibSupport.h
 +++ b/src/LibSupport.h
-@@ -64,24 +64,9 @@
+@@ -64,32 +64,9 @@
  #ifndef _LIB_SUPPORT_H_
  #define _LIB_SUPPORT_H_
  
@@ -40,6 +42,14 @@ index 5055560..48b1e16 100644
 -    || defined(_M_ARM) || defined(__arm__) || defined(__thumb__)	\
 -    || defined(__powerpc__) || defined(__PPC__)
 -#       define RADIX_BITS                      32
+-#   elif defined(__riscv) || defined(__riscv__)
+-#       if __riscv_xlen == 32
+-#            define RADIX_BITS                 32
+-#       elif __riscv_xlen == 64
+-#            define RADIX_BITS                 64
+-#       else
+-#            error Unsupported __riscv_xlen value
+-#       endif
 -#   else
 -#       error Unable to determine RADIX_BITS from compiler environment
 -#   endif
@@ -66,7 +76,7 @@ diff --git a/src/makefile b/src/makefile
 index f124e78..6ee128e 100644
 --- a/src/makefile
 +++ b/src/makefile
-@@ -46,6 +46,8 @@ CCFLAGS = -Wall  			\
+@@ -47,6 +47,8 @@ CCFLAGS = -Wall  			\
  	 -c -ggdb -O0 			\
  	-DTPM_POSIX			\
  	-D_POSIX_			\
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
index bddcd57f21..e47aa6acbd 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -1,6 +1,3 @@
-# from https://sourceforge.net/projects/ibmswtpm2/files
-sha1  a2a5335024a2edc1739f08b99e716fa355be627d  ibmtpm1563.tar.gz
-md5  13013612b3a13dc935fefe1a5684179c  ibmtpm1563.tar.gz
 # Locally computed:
-sha256  55145928ad2b24f34be6a0eacf9fb492e10e0ea919b8428c721fa970e85d6147  ibmtpm1661.tar.gz
+sha256  d11203a73946ad14ca39f4b74742c0d81762dbe7e913a4685f92620f1d6fe295  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-br1.tar.gz
 sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
index 1e4dc949c1..4df61fe028 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IBM_SW_TPM2_VERSION = 1661
-IBM_SW_TPM2_SOURCE = ibmtpm$(IBM_SW_TPM2_VERSION).tar.gz
-IBM_SW_TPM2_SITE = https://sourceforge.net/projects/ibmswtpm2/files
+IBM_SW_TPM2_VERSION = 5452af422edeff70fcae8ea99dd28a0922051d7b
+IBM_SW_TPM2_SITE = https://git.code.sf.net/p/ibmswtpm2/tpm2
+IBM_SW_TPM2_SITE_METHOD = git
 IBM_SW_TPM2_LICENSE = BSD-3-Clause
 IBM_SW_TPM2_LICENSE_FILES = LICENSE
 IBM_SW_TPM2_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
