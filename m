Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5388CC88E4D
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8BD96061C;
	Fri, 11 Sep 2026 20:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3o0Ky7VQ1QrN; Fri, 11 Sep 2026 20:03:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E008160616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789157017;
	b=aur7UEJ0VTRZRmUP+MCwbFMuzz68WfC5jM4wBiA5RnXbrr0+QwRXL97O3AUwIf8l+e+h
	 p2soQzCMS7adZm1c+/k80pCQtMOXCHo3r3RW7cX9J1UUA13SS06IqWIfyIzgu4OwTkyip
	 DbIJVXNsh+0J/xfA3CveFV6CgoMkgGZVmdwSESwGNdmSIoGO1svXmxmRjN/7nsg7jbqdY
	 fI3H/9XmuZtCcxzXFbxycO2uiaXMclAMeMrSe9Kjy4xIxYqoo2xBAU898mDCDVsJoLqkO
	 EhyZEB0sYvDTqvbapUyVvLiVhcSrb/CH1QM3PzkSMA3uA8VISEAO99u2c/pru+2w/Eg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789157017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vYhU4t5cHILlY+7wXseH24Z547EyqFAAYE0Im4fW8G0=;
	b=N/UtT5VFyryhdA0b22KZlRQ8EW9e5xtJEiK8Oz6zvfxzzFNlNnqG+Qe4wVK5t3evDYOU
	 1eNojqqqsSamPA0bEzV6yS23qzKB/+AxYe1PILoz4LLyTlwEbSdCaKKJHy64zyiDCeen8
	 wc//4m0qVc7emKFwsW+kRygcC5/0/W+Gjwur6M9lRF5Tgm2P5P2jFYIKTZ2KzfRpdvxHl
	 18l2ptew2O1M04Tn/e7qQnqgq8xOmT4XMs0H4yrJ6A8qrCA/PXkZXjXOmEfG/h5c9QC/Y
	 fimTNON3UDt/ZQBF/9czHc3OujaRv03EFe5DlSeVi7rllHMfU9iyQJY4v9b9jpeX3KQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789157017;
	bh=vYhU4t5cHILlY+7wXseH24Z547EyqFAAYE0Im4fW8G0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sPnrEP/1NZ9McR2pejNY+8kArM9CWd7fthT4HpO/x1B0npA06CnkICFpDsl4NuNyV
	 V2eb9bfLRqoDioohfaV/6WKbJmiky7M1Eh06Z7M3kOrN4ev+hVGNzgoz4e3CQOyXPP
	 uGNX8bJJDhPGiLxIKgds1H8JkYKU8kiR5ozh1KKdY+S9Q1ARUBMfxtcQNxfoa8AG3f
	 5QzguHBiqOHGMxGlzNfCVCngFfGEaHEDNbdAPzRxcAZroA6CGL5zSYABgmNbmyIt0V
	 V35k0/8eivOMQeXntZ3NjDQfCOc2buCFoH4FzewV8rWB5CLGgXiz2CMhGT6C0V+UXv
	 uIQO3z1GdvGsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E008160616;
	Fri, 11 Sep 2026 20:03:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C7132F
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6C8440061
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 20:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeADAnIM_qMP for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 20:03:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 19EA74000B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.162
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789157014;
 b=KLYE4acnsPgJjbktwpUKxLqWjs3rHYsFY+i2m0SN1kj5/3unPS6TZLE7nxG4oY2xQtF3
 Kw0ZolmgMd4VCs9pbgda/zQ0y/CN5YwpyNs0qU2NQiE1JyX3dEe7mCqKVrrqZj+35A63z
 n5XgbjQZi6gbohqJz41hOttjrRfPoKm/cYvALboPadWt4RLa7YHEgz2bykso/3CNk7fFK
 5AL6tBBC6IWDHkr08ctBkuxSMatc17lMKledqKeLSyXsvhbaEGGG3tCN8nDdZKUH7nco7
 wH51nzj7gDVCNC4i4LWv1iUDIieKiLiSX5ICC4g73DYNqYBfDSBIb37cItAxSAT9eNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789157014;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=Wxp3cKWQ5Su7R3mK19xVIb+q+scREqf6e5J3QefLE7U=;
 b=VEq0on0kheHjqVQmmty8T5abTUBZWJPfqDgUkgD6wYJeVuvMCj/kwLVhH4+MkzaeSpQ/
 crlpCT+C+evkw4RzZ25XvZ0AErYBpxXZZfixRVUFGlSiNuCuPeKBHlCfVKiwsqO8qZtvT
 NOPNzCxWZn5/ZK4oH5glUUp2acvACumVghc09b3Ep5Bkiz8plpIKLyLcz3lKPfYagaktf
 KZpGnxusWl83BGFu1ecqSbt55RVLd+D3SrED7eCTDU/MwQi7Vs38OTx2PDLYuV0G0CaUb
 2B8BrOC1HNmYUzRKc/9zotKZfwYKZTIf5FD0Jdf3Oc9gjli+ZtN94iAvzLfnPiHweLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=Wfmm+jr+; 
 arc=none smtp.remote-ip=62.149.156.162
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Wfmm+jr+
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19EA74000B
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 20:03:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 57T5xxtqHIhR057T5xA5S3; Fri, 11 Sep 2026 22:03:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1789157008; bh=efWF0RY1jXE6mVXGxymzfrAgfrYKzIo42vjk7o2JCFQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=Wfmm+jr+Hc7WYlN5m74KoZQFmV3JKJ0FfNpIQx2YRakv3LDg4hFnI2RmWjltnnBxZ
 NmKs3lmEI8AKAxUzuNU4gZkrtndkzL+f4QBYFBBA2vqpo3e6cAClaoih6diZCJ8tqi
 byh0JM7+8vPdBjEBIRkSIKk9lfRETESs8sYCPkLcsNoJqFQmResbhLgZpuFR9UfxRO
 oAFyK5/MbtQkcwoWv8wUYtabPA6Vk1hcIbs8AwVasD+p4+OB/6OezgI2T3HuXzaawE
 mZkEjadRwNgKJKFdTzLtoDzlzB1uM7Y/LNdDqoEkuvFAc6/DgbGcaIcsEi1ePkRqkG
 AcXEp5anbNOCg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 11 Sep 2026 22:03:26 +0200
Message-ID: <20260911200326.2421678-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI/yg6JV83XVsSLadpViz0RWhmWDmUw7hLF/Y4mpICcJEybDPYE/kiZiyJs3jcS0JMmesvDz1iCPiGYQ+Ras3l2u3D4BG6rrqAfgPuN6wtRX6IQPb5Cw
 bk8Llsaflj3vK0+lYY7ZlAEwRd5ktntyjwObAWSpUuXKaUDOAs8p8+AEIbp2AR7+SC3bzqi/P6V5fk66n8l1GDezykFwd/A1LEKufwwDZ34OVUQ9DuZVhuIf
 MNPBAfwZ557pkqDiNpL9vd4q/p3a1xouzOHBjreLbcyNbZXpHMlaN2gnQs7xVpOfoKR2f8VkuM+2TVjFqqq08g==
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.129
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop local patch that has been upstreamed.

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_129_RTM/doc/src/releases/nss_3_129.md

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...build-failure-due-to-missing-gcm-stu.patch | 116 ------------------
 package/libnss/libnss.hash                    |   4 +-
 package/libnss/libnss.mk                      |   2 +-
 3 files changed, 3 insertions(+), 119 deletions(-)
 delete mode 100644 package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
deleted file mode 100644
index f2c48c8fee..0000000000
--- a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 897ebeb9c38d4dc4844f5f414db5aaa17c261eee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 30 Mar 2026 17:06:14 +0200
-Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
- on big endian
-
-Building gcm on Big Endian architectures lead to linking failure due to
-missing gcm stubs. This is because those stubs are guarded by
-DHAVE_PLATFORM_GHASH that at the moment is defined for every architecture
-that provides acceleration. But at the moment we can also build without
-acceleration but DHAVE_PLATFORM_GHASH is defined in any case.
-So let's add to coreconf/Linux.mk a runtime test to find out which
-endianness toolchain is by setting the new introduced LITTLE_ENDIAN
-variable. And later on, in lib/freebl/Makefile let's guard
-DHAVE_PLATFORM_GHASH definition depending on LITTLE_ENDIAN VARIABLE.
-
-Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: rebased to version 3.127]
----
- nss/coreconf/Linux.mk   |  8 ++++++++
- nss/lib/freebl/Makefile | 28 ++++++++++++++++++++++------
- 2 files changed, 30 insertions(+), 6 deletions(-)
-
-diff --git a/coreconf/Linux.mk b/coreconf/Linux.mk
-index dcb432415f..cf1f62378d 100644
---- a/nss/coreconf/Linux.mk
-+++ b/nss/coreconf/Linux.mk
-@@ -188,6 +188,14 @@ endif
- endif
- endif
- 
-+# Test toolchain for endianness and set LITTLE_ENDIAN variable accordingly
-+ENDIANNESS := $(shell echo | $(CC) -dM -E - | grep __BYTE_ORDER__)
-+ifeq ($(findstring __ORDER_LITTLE_ENDIAN__,$(ENDIANNESS)),__ORDER_LITTLE_ENDIAN__)
-+    LITTLE_ENDIAN := 1
-+else
-+    LITTLE_ENDIAN := 0
-+endif
-+
- USE_SYSTEM_ZLIB = 1
- ZLIB_LIBS = -lz
- 
-diff --git a/lib/freebl/Makefile b/lib/freebl/Makefile
-index 0ab50b093a..21c3cf62d8 100644
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -112,7 +112,10 @@ endif
- # NSS_X64 means the target is a 64-bits 64 CPU architecture
- # NSS_X86_OR_X64 means the target is either x86 or x64
- ifeq (,$(filter-out i386 x386 x86 x86_64,$(CPU_ARCH)))
--        DEFINES += -DNSS_X86_OR_X64 -DHAVE_PLATFORM_GHASH
-+        DEFINES += -DNSS_X86_OR_X64
-+        ifeq ($(LITTLE_ENDIAN),1)
-+            DEFINES += -DHAVE_PLATFORM_GHASH
-+        endif
-         EXTRA_SRCS += ghash-x86.c aes-x86.c
- $(OBJDIR)/ghash-x86.o: CFLAGS += -mpclmul -maes
- $(OBJDIR)/aes-x86.o: CFLAGS += -mpclmul -maes
-@@ -138,7 +141,10 @@ endif
- endif
- ifeq ($(CPU_ARCH),aarch64)
-     ifdef CC_IS_CLANG
--        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+        ifeq ($(LITTLE_ENDIAN),1)
-+            DEFINES += -DHAVE_PLATFORM_GHASH
-+        endif
-         EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-     else ifeq (1,$(CC_IS_GCC))
-         # GCC versions older than 4.9 don't support ARM AES. The check
-@@ -146,11 +152,17 @@ ifeq ($(CPU_ARCH),aarch64)
-         # and then rejects any major versions prior to 5. Note that
-         # there has been no GCC 4.10, as it was renamed to GCC 5.
-         ifneq (,$(filter 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
--            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+            ifeq ($(LITTLE_ENDIAN),1)
-+                DEFINES += -DHAVE_PLATFORM_GHASH
-+            endif
-             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-         endif
-         ifeq (,$(filter 0 1 2 3 4,$(word 1,$(GCC_VERSION))))
--            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+            ifeq ($(LITTLE_ENDIAN),1)
-+                DEFINES += -DHAVE_PLATFORM_GHASH
-+            endif
-             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-         endif
-     endif
-@@ -183,7 +195,9 @@ ifeq ($(CPU_ARCH),aarch64)
- endif
- ifeq ($(CPU_ARCH),arm)
- ifndef NSS_DISABLE_ARM32_NEON
--    DEFINES += -DHAVE_PLATFORM_GHASH
-+    ifeq ($(LITTLE_ENDIAN),1)
-+        DEFINES += -DHAVE_PLATFORM_GHASH
-+    endif
-     EXTRA_SRCS += ghash-arm32-neon.c
- endif
-     ifdef CC_IS_CLANG
-@@ -316,7 +330,9 @@ ifeq ($(CPU_ARCH),arm)
-     MPI_SRCS += mpi_arm.c
- endif
- ifeq ($(CPU_ARCH),ppc)
--    DEFINES += -DHAVE_PLATFORM_GHASH
-+    ifeq ($(LITTLE_ENDIAN),1)
-+        DEFINES += -DHAVE_PLATFORM_GHASH
-+    endif
-     EXTRA_SRCS += ghash-ppc.c
- ifdef USE_64
-     DEFINES += -DNSS_NO_INIT_SUPPORT
--- 
-2.47.3
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index b87c3376b4..1851b1e5fd 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_127_RTM/src/SHA256SUMS
-sha256  5a899cad21ae2c9d3c5132de79726eda8df3b7fdf18eeb239fc544d43b87338b  nss-3.127.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
+sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 734376f61b..42021503f7 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.127
+LIBNSS_VERSION = 3.129
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
