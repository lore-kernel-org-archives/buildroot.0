Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCCC606A331
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FbC4J1VN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=coqcoJdI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E4160672;
	Sat,  7 Nov 2026 17:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_cBoPL6Eeih; Sat,  7 Nov 2026 17:04:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A219360664
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794071052;
	b=FzFXmlZgiBYEq1cbnTzWWusGgVnnFKs+ho4djLuEpj3eEKSKNEigQ7V9MtSzqYSSjUPm
	 KnE1PAEWQI1wVDZ9PbEOJoUKs/9CqkKkHChehoAGPw7KjJM23ER2AGkTyiSkMOOdWlOI+
	 45CN/KRGIy6KrAN/N9DXM0faQPFk55gN5RUCWdkMCoRZ3+PDy1Ss1v2SiGLDA67o6gttE
	 YuXRaR7wglj2SMR74SUZ47ecvK0OQC2T864E0VIMor3dxnXwOLRAU38m700N46Btuw6xM
	 /9fl05O91vHlvrBNTncvAnLCysdDS00OoK5jRU3apCls788G5NxrZVcEoR+8yJjKZ8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794071052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=iCOGWmJ3nvx3eM1vNVz/uTGt0DCwxRT6T14vT4kh7ic=;
	b=IQF183vuswzoq3TRdpfq90EgBPfwnrPv2jPRdlLKI/C1aEuAy0oAr+b8LRi+hbi7WgSZ
	 IAgPqaR2kikKvFP2rZQte+ciaSn3knw216FJBZBrXRGW1n2XdlzXdQ1OGkzVMMPFu9e3J
	 XavgtfaeOm1L5jNovtFy3r2zEFNr75gX4UykrtToz6OSo59dOiQgfDoSH0/H/2nmvVh/K
	 xv6o8qnSIkt+kMLAIgou4vwUpvRZfG6oEMa8Hp3uh8MPJ2zG7FPZBz839vYeDkvq6xSq3
	 4aRkBKc3z+ajnNgaDrzRLDOh46uKlTng1/WVwCZcV8Du6Lx/K4FyRhMnWW09ISOI9wg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794071052;
	bh=iCOGWmJ3nvx3eM1vNVz/uTGt0DCwxRT6T14vT4kh7ic=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FbC4J1VNOZ0KkrAhOlKAvIAyi9ntynaPOWARXmtp816rEuONIAR74r6PXjrqMEAAP
	 fMzdCZ3h9iLMlYHzwXRcNvbgzozBB2EY2/FJmUnEVKDMja4QmnCKkYeA7J27ZQmZlY
	 yR/Hznf7LOHL8g/qisokKKhVkxiB7w3/HdCDmre+hS2y8hbH493zWYDYeh2KZvC+A4
	 xRGDpGJAwem4V1lIUs+se4h4n7D2kn0ym0Src4IxiN7kfzgZTvU1TmoWGbCGLB4r1C
	 SMSicwHoa9iTHXQ3f0UX4jmzj7FFe/RK9QtTFZdz/meRtWwN+E3l3uOrxqqAWQNBKf
	 TI2GSe5zURmPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A219360664;
	Sat,  7 Nov 2026 17:04:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE84A32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2D6B81253
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dberpy5TwpHF for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 17:04:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC0B381250
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=115.124.30.97
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.97;
 helo=out30-97.freemail.mail.aliyun.com; envelope-from=cp0613@linux.alibaba.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=coqcoJdI
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC0B381250
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1794071010; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=kDJomfj/ZTg6OmClMrxRMSBgohDzhvniIVk0lq0ZsfA=;
 b=coqcoJdIf9gVdKc79CrJPveJKkN51x+8hFpO0zYL4ARWQa9mloTfYvX7QSGFYUSfVO2t9LgIEZ27g4ZXKWFmsJ8aucW/4vC/iQm5SKgT+6+ZdXQ9YqqsL8KtaCE0NaF9gkaFKMd0CBLQc9oBpawuFhUcycjQIYMjaa1hi1YB2QM=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037009110;
 MF=cp0613@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0XEEyyDt_1794070990; 
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0XEEyyDt_1794070990 cluster:ay36) by smtp.aliyun-inc.com;
 Sun, 08 Nov 2026 01:03:27 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: buildroot@buildroot.org
Cc: ju.o@free.fr
Date: Sun,  8 Nov 2026 01:03:09 +0800
Message-ID: <20261107170309.1045-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ndctl: Needs toolchain w/ glibc or musl
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a !BR2_TOOLCHAIN_USES_UCLIBC dependency to BR2_PACKAGE_NDCTL and list
glibc or musl in the accompanying comment, so ndctl is no longer offered on
uClibc-ng toolchains where it fails to build.

Fixes: https://autobuild.buildroot.org/results/2e698b5d818ba6af65f1b3c3c5246ffa6ae7ad8b/
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 package/ndctl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Build failure (microblazeel + uClibc-ng, autobuild random config). All 14
failed ninja targets are these three errors, there is no other cause:

  ../ccan/endian/endian.h:71:24: error: expected identifier or '(' before '__extension__'
     71 | static inline uint16_t bswap_16(uint16_t val)
  ../ccan/endian/endian.h:84:24: error: redefinition of '__bswap_32'
     84 | static inline uint32_t bswap_32(uint32_t val)
  ../ccan/endian/endian.h:100:24: error: redefinition of '__bswap_64'
    100 | static inline uint64_t bswap_64(uint64_t val)

  In file included from .../usr/include/bits/byteswap-common.h:34,
                   from .../usr/include/bits/byteswap.h:1,
                   from .../usr/include/byteswap.h:22,
                   from .../usr/include/endian.h:59,
                   from .../usr/include/bits/waitstatus.h:72,
                   from .../usr/include/stdlib.h:42,
                   from ../ndctl/lib/nfit.c:3:

Why only uClibc-ng: the vendored ccan/endian/endian.h guards its own
bswap_16/32/64 inline functions with HAVE_BYTESWAP_H and HAVE_BSWAP_64, but the
meson build never sets either symbol (config.h.meson has no entry for them and
check_headers in meson.build does not look for byteswap.h), so the fallbacks are
always compiled. On uClibc-ng, <stdlib.h> pulls in <bits/waitstatus.h> ->
<endian.h> -> <byteswap.h>, and byteswap.h spells bswap_16/32/64 as
function-like macros, so any file including <stdlib.h> before the ccan header
gets its definition macro-expanded into a redefinition of __bswap_16/32/64.
glibc's <endian.h> includes only <bits/byteswap.h> (inline functions, no
bswap_* macros) and musl's <endian.h> does not include <byteswap.h> at all,
hence glibc and musl builds are unaffected.

Why this dependency instead of a patch: ndctl is userspace tooling for
NVDIMM/CXL persistent memory (libnvdimm, ACPI NFIT, CXL) and already depends on
udev, an MMU, threads, headers >= 5.10 and dynamic libraries. There is no
realistic persistent-memory platform running uClibc-ng, so nothing that could
be built and tested is lost by hiding the package there, whereas patching
vendored ccan code would add a local patch to carry (ndctl itself never calls
bswap_*(), the helpers only exist because the whole header is vendored).

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 79bae61ebb..e9cd8d1b47 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NDCTL
 	bool "ndctl"
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # __struct_group()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -20,10 +21,11 @@ config BR2_PACKAGE_NDCTL
 
 	  https://github.com/pmem/ndctl
 
-comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10, dynamic library"
+comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10, dynamic library, glibc or musl"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_UCLIBC

base-commit: acda85c85827c123a5238f3628009d8ae3ec0735
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
