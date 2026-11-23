Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ED4606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kt8Ncr9L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Smk+pin/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA2E380C80;
	Mon, 23 Nov 2026 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLSBR7flk2ed; Mon, 23 Nov 2026 17:46:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9154680E73
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455994;
	b=B9GrN8TOqMCBjC2hlbsnoP+E8rwYn/TjrWXxIfxz/SWngbPPBzQ0FViL6GIT+bDddiB6
	 mTVdiA3HBFd97cSnDIlq6gxvm+jWSZ4xxZcNbKv8jVqdXYQdXyFTFxLcqsDWnimS9LCif
	 zYuu56e937s4ZS2Xo+Uec3mSXFv2soFERCs76zje2yVbZS1lND7MsMl2SIYQyylTC/t7e
	 6ITKxPfx8h5d4jqLYqJxnmfb36DdDjLrBMT2zSDrsTEpmbG8JGguL6pxPnz9m6AEw+47L
	 Wo1oXOHYXJ74vwdItstf0zcY9FGX/bPAAVodkK8yrbmM0zAot9cVDR7bHkTGrfKN9NA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vFaL2gitC7yILdwffb2djyGyDKLqAllp/oHFdW5vskA=;
	b=H4SX0LFeGJv7MaDZmbOj9/PJRDuDe9bnAdJL/sIoNsEAUW/svKqeBDelGcCEJkHagT27
	 iWznITIofdFdUhB8m77tkvJx69yNdg9o4x0Vy+VrEZdtrwCcvSKO4ejiiEVh05XnBvW/6
	 jyfRazzsLa0gfYBUknKCaectjcHiFKzgzPyo1dJsm1NsB4/UQd5HDcXjSlxAiB1r9bHJp
	 34DQK2y2Y5rwhV+/LN4z0kakDjflZgJiqu0SFd9sau6HvuYdVJynW6DOCk6XB81jJacMb
	 UTfsFqFTVPQU3nPppJ+u633b5JpUdMxPTzpycrzMABbNzhg9afLHksq1yUQODUBbw6g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455994;
	bh=vFaL2gitC7yILdwffb2djyGyDKLqAllp/oHFdW5vskA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kt8Ncr9LaC3DmiktP6Fm5NtMp94WD7MRZO0weBXe0nPPnzPXfniTAJtS4geYvZJPh
	 w0q2jOsljSdNRFxB+emG7QCQzT6GNtLX1R/ZIbwU2gIRwgSIYpO2pz2B9wQ5OMiUcl
	 q9XtVpvgUD8SwR2EHnYlibYMbFp96UFEtlwkhjZMBat8FHxvcEak2LxJ+WY5SDuKE6
	 94oMYkw8Os84Nes4aTyEUlOjFXqjJhNTAlJCdT/Mp/HoYyaR2mCDUBtplTqT0FvHJC
	 MztWu04hheEJPwT3poNr/hzXdY+DlL7Ltw50uktkMDR3oIiSP/mklgGM3SVQXuy3Ob
	 gha/Xg//MG4vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9154680E73;
	Mon, 23 Nov 2026 17:46:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEC543A8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C58DC40093
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU6OkqExvtZ1 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:46:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 28026400E9
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=62.149.156.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Smk+pin/
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28026400E9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:25 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VY7SxTNIykbYcVY7Txrpgs; Mon, 23 Nov 2026 18:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795455983; bh=wkjYkOd6uwH5NoTqEg3WgkQwB+BqroVpvvmC1ErZnOs=;
 h=From:To:Subject:Date:MIME-Version;
 b=Smk+pin/rPgJQwhleWSwsEt73lzxD4jyOhxtqNGNsM8kPy/V+2MfMS38yXAuMIHHo
 yDo4prdKtxy9j1wP3CUQPSoy9QhiAdUhF2eiim9BNFLvs180uBoBsWsWIIJYzIvAUJ
 LCzhDf6NsgRyfnWpiUKWEl+Fbo+ajHmzRoNkj65st3kRGrWMyPqjsc1tUwLqafflUm
 CSw1iLvfK1xOlCzOqNIJIgfHsN13kD6YlxUKz10FRnflwDsLASzPKOY9Yr42hTPGTh
 PlsAM9sY8a2oNK+a/uTbItoA8VdKSwsDdVhvRGL4nUDhr2V2uoVM4lANguzmleBndF
 1eZ2gaYrQTVzw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Marcin Bis <marcin@bis.org.pl>
Date: Mon, 23 Nov 2026 18:46:19 +0100
Message-ID: <20261123174622.1851843-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
References: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIJhV6CJiflsRCt3hRj0a9p9+Q1M6m8BX5FnVYiCi0TuX8oLK+2cSmbbpiRAlEohxKm01OXzr4VTXbiP00XVFxp9VLmkbVlzHSzzMiCmIbnl/mooGNqe
 e1k+EUkuD0jRB7d8qriDePI4MEeWVNpxW2fOi+oE7e4P4d19LFUIMjzFZjEpA73DMhPek7q6XK+DqFhSqp8UwXNKnQFc9Mbw8a7fhIxF/k866v19m0uO6RB1
 JMempd6TpVREHWo2NMr82/itnOEg41M81t9AF2GCH6iGcfLoYWRFWei+kpAws6s82Vg/KFf/kqjCU53G04rGYwD/EBEL2VM7m6sdao8KHIH73iBLjRZ5rRIw
 p/ojaOGW
Subject: [Buildroot] [PATCH/next 3/4] package/libnss: bump to version 3.134
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since NSS 3.134, with upstream commit [1], libssl uses mozpkix (C++)
to extract the peer certificate's subjectPublicKeyInfo, so the make
based build now always compiles lib/mozpkix and
lib/ssl/mozpkixwrappers.cpp, regardless of NSS_DISABLE_GTESTS. Then,
upstream commit [2] builds that C++ code as C++17.

So:
- pass CCC (the C++ compiler used by NSS coreconf) for both target
  and host builds, otherwise it defaults to g++ and the target build
  fails linking libssl3.so with "file in wrong format"
- add BR2_INSTALL_LIBSTDCPP and BR2_TOOLCHAIN_GCC_AT_LEAST_7 (C++17)
  dependencies and propagate them to ecryptfs-utils, the only C
  package selecting libnss (qt5webengine already has them)
- install public headers with cp -rL, since they now include the
  mozpkix/ subdirectory, which makes $(INSTALL) -t fail. -L is needed
  since dist/public/nss/ entries are relative symlinks to the sources

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_134_RTM/doc/src/releases/nss_3_134.md

[1]: https://github.com/nss-dev/nss/commit/a51dafa783e5
[2]: https://github.com/nss-dev/nss/commit/cffbcbf846e3

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ecryptfs-utils/Config.in |  7 +++++--
 package/libnss/Config.in         |  7 +++++--
 package/libnss/libnss.hash       |  4 ++--
 package/libnss/libnss.mk         | 16 +++++++++-------
 4 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 0c39f48d08..d5672ecfed 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
+	depends on BR2_INSTALL_LIBSTDCPP # libnss
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libnss
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LIBNSS
 	# runtime dependency only, some scripts are using the
@@ -28,8 +30,9 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
+comment "ecryptfs-utils needs a toolchain w/ threads, wchar, C++, dynamic library, gcc >= 7"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 2dd0197236..82ae256cec 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_LIBNSPR
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
@@ -27,6 +29,7 @@ config BR2_PACKAGE_LIBNSS_ARCH
 
 endif
 
-comment "libnss needs a toolchain w/ threads, dynamic library"
+comment "libnss needs a toolchain w/ threads, C++, dynamic library, gcc >= 7"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 31a7a98802..8ef25447e0 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_133_RTM/src/SHA256SUMS
-sha256  4d752526b9846a1d962588cfbd09b7cc2a4f6a4effbd9157d58a30e8a2573065  nss-3.133.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_134_RTM/src/SHA256SUMS
+sha256  bb3b300b457f44da9a9486917c3b33bbc5935ae3cdf60aa759a6880889439c50  nss-3.134.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1a98caf6df..0160b3628d 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.133
+LIBNSS_VERSION = 3.134
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
@@ -54,6 +54,7 @@ LIBNSS_BUILD_VARS = \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	NATIVE_CC="$(HOSTCC)" \
+	CCC="$(TARGET_CXX)" \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
 	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
@@ -102,8 +103,8 @@ define LIBNSS_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
 	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/nss
-	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/nss \
-		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
+	cp -rL $(@D)/$(LIBNSS_DISTDIR)/public/nss/* \
+		$(STAGING_DIR)/usr/include/nss/
 	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
 	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
@@ -116,8 +117,8 @@ define LIBNSS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/include/nss
-	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/include/nss \
-		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
+	cp -rL $(@D)/$(LIBNSS_DISTDIR)/public/nss/* \
+		$(TARGET_DIR)/usr/include/nss/
 	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
 	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
@@ -135,6 +136,7 @@ HOST_LIBNSS_BUILD_VARS = \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
+	CCC="$(HOSTCXX)" \
 	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
 	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
 	NSS_ENABLE_WERROR=0 \
@@ -163,8 +165,8 @@ define HOST_LIBNSS_INSTALL_CMDS
 	$(INSTALL) -m 755 -t $(HOST_DIR)/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
 	$(INSTALL) -m 755 -d $(HOST_DIR)/include/nss
-	$(INSTALL) -m 644 -t $(HOST_DIR)/include/nss \
-		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
+	cp -rL $(@D)/$(LIBNSS_DISTDIR)/public/nss/* \
+		$(HOST_DIR)/include/nss/
 	$(INSTALL) -m 755 -t $(HOST_DIR)/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
 	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
