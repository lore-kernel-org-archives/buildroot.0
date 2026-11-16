Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054A2606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A4nNcG4s;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=QFg+pxx7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCEF580DB9;
	Mon, 16 Nov 2026 12:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0buixw9iUxen; Mon, 16 Nov 2026 12:48:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B463C80E4D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794833283;
	b=gVVQyuoBBmc6+G6QBt+dR8R4h0CeVKyloAttbICPs4W3Nts1Kh/0WJsYUSZ5umtHj7+B
	 N90TQnR1iH0wMYWmbg3ymqUDq9PviblNgTEasSjNCdZ1UVjs95kjiO21VILB5sOey1NrN
	 z07quWo2NvlxI9VDgy2+vk9I8FrcPkNFXBHNYbA6G5ParLjzbftwkaB0nX9wQlrb2oWbA
	 m/p0J3DNTC1SqgxO2h5/+TNULtrPpGjCEElqqlTCg7P+1EF5XuegHCNsEacQKFM23P6u9
	 JffIEAlvpIk/H2jetaqRj9d/L/9LihIfAkhe/DxwKH5m6KE19VKf4P+xK0VADVNUR5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794833283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6nrXznPquCTetQn8/crA439BIG+gZ+vNAM02dpJtQIM=;
	b=CxP/yA7pjKHm3U4IWn5Nn2NV+vc5Mq04UMwHlmxqUZiTshl2UWLepAmO9kFHgoARguKm
	 y3CUVHq0bUyghxLb1TV3QTPnTRr13BSAyv+zJeMwGL0YLuG9nhk8wEkrySeaRPze9lQbU
	 qHqYEO+FnHx4HuAKFsqSnm9G6u4EZPDgW98GxI8p5walRIfdGuTe8C7IU/dKQ/MbcbyMw
	 uDx5pa0dsHCoLK3jyQKz7NMs9Z0/Cy/4igwXQnJjEgotWxJ1rwcebiBzQahgdXQ5HEsPB
	 ET9Ztnk7jV7Tl0My60LPltQN0JrJ/5zt3WFSCiwPGwu6LTAxkvsOenKWyyLem9Nc9RQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794833283;
	bh=6nrXznPquCTetQn8/crA439BIG+gZ+vNAM02dpJtQIM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A4nNcG4seu0wZ79AgZC+/rTdEsA9NlBDZ/UxJstFRfEsBl6XuP2tFdAwl+fOaZsn2
	 7a0KkrLtx47gnBeP/cR9nz1qDteJNJRgX3G+9cyZ/hK3fFxPIiZkIPTnM6JX8HNGjG
	 ju+/TMW2xNFWpy0+lvcuLrESQW5mIK33zE524MQPZDPocZ3NVnncpwSeNHc+nYoX6A
	 5bVynsso42yUzvln5ugJjAdHex8e3URmARPO8xczffytbXhHINnk0u26zC07bkoVU8
	 m0iHYdRc/y6gFZ3tMympdqx+GQrv+Pq3qxCl5kTh7GOT8wuN+gNOYkri7DqJgefhAj
	 77Hm8ML+VbuzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B463C80E4D;
	Mon, 16 Nov 2026 12:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 743031E7
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5251560777
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8biQn_EiNgJ for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 12:48:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 18D5160614
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=QFg+pxx7
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18D5160614
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:47:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b7efd3bc26so1830414a12.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 04:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794833278; x=1795438078; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zSN6oNeHAc2AIbc529zlqA2ixz8WyFAfgGUSG+GQaYM=;
 b=QFg+pxx7JKMU9Hchs5Te+rzHSvpClUV4HFwOAEOiebFmYkyRTvopgxGabUZRFsVk39
 TcCafGEQXXuDuZKd3JWy7Bznl/V2paiTgZHhQ3TRJs6917kMHPEJ13UZhgmxvMhnYOhL
 GPW4J2dYDm1ILUTGtSe3f8d6CNJxoBNGWdEb0Vwgmo29IesmIvTCzue0vRVplz513GGK
 XMzVc8YUBpu7wqAX5HAqwg8UxKI9vPI0Ix67nqnhn8Cf187cVCY4CEwltnsfOZd7WLN3
 QEVoT8E7H/peuZWmkFBSAwxPEtSn1Bq93omp3lu7l2cTiGYp863iDaPXXUDR+Wr4JbeO
 BkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794833278; x=1795438078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zSN6oNeHAc2AIbc529zlqA2ixz8WyFAfgGUSG+GQaYM=;
 b=sNsZ3rYqRowCuvc8UTbM4txC9zyxF14Z0FqDi/aT856zk8ZKYhobVTwG1u2Wh2zA94
 i0sqA6MntVkVTJYARARKgWnCEIX2K0wGtnB+wdy2ajb7eeC+yPQAMEZY8q03GMzIeqpN
 WgH6iWX6mhghEjgHdDUe/I/fnV/H9kW3nvG6pHIsNLqKGu1VqUyFVQjnCLR023T2sQdf
 hoN/ai0MhHaUPUQbKrO7Bbn+ui96QU7756fltJiBH0ECmnERYgnH6NzynnFNBf4eE1f8
 XLvlI+es5hWt3SStMfxNt3vitfroWQtDxIZViqG+2z0t+o4iIjhK9vTq67+MsKePzuFI
 WDSQ==
X-Gm-Message-State: APuU4Z/OVYvSQB1L6zNYf6iJIpzDDCSHnx7amQtOEQbgQyuWxQtvT/wE
 2VoYVbnnWyIhCM+aDIJzaDJgPrzt7RxS/oWt6lb49Y60NDO1hRYgVfFyTlzNjA==
X-Gm-Gg: AYBFou1OOM4z+Yq7Ly1ePdj9Dgb5G3QhB49PLGU3E71WtcOKjh7kfDZgj7xvhu6ot6X
 N1F9ifedlXpupil0Drb8+t0MauHuDBOyRFFzKAQd2q+vLzdzardYOrDczcC9HZdmREQqiIgineI
 nnBDwfUVPh7ez8pJdKAnugjJeZm8W5y0KSjqF6k9rFobLcuooUJQukh4H8ctcVSOouvLtHdd7KI
 fuuEQVuY0d+l5XaDd8aDjygKx4KrpoGuaaotzte5D3272iVdpg4oSXbTLnLL4ari3GNnoW6SCLa
 3mx/QyadV2tAtX1ZRuSvExenn7HpyYQ+GeZzRGTpIJdU0EELLgQDmbvCVAOkBlM9F1OuflsFPU0
 CaTOPrJF/0CCSGhLKxRdne2WN1x6IhYs73J48Go5BO8I0se6+URadbkZNP5TjgXn0c+7DGIrBg5
 XWn4QcMdVDv6RolPh3KaboZHAkNaYIyYWigooUAbUWfmOMIXtjuMZ/dHva3NEoC2VXIJMZkWKKR
 3OheClaCMt6K5hekx3PbAGPY1fIS4kgALhpjBdtFEPIXh0pP+4bqlyaLMMOi6XXw6ivfQns3CNA
 wyrMupqctcsvs7E8jX42yTWg4sv3nYjxsbu/Uf0AwHPjkHz9aJsLS1Di45tqHYgj0gODRgXoy+g
 H7+Yh33LJVjmckENaYbjJ7u5qEQx2SQ==
X-Received: by 2002:a05:6402:51d2:b0:6b7:aebc:fe53 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fab7mr7375817a12.29.1794833277531; 
 Mon, 16 Nov 2026 04:47:57 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c25ded92sm4659595a12.31.2026.11.16.04.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 04:47:57 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 13:47:56 +0100
Message-Id: <20261116124756.2829649-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ltrace: fix build with uClibc-ng
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ltrace 0.8.1 includes upstream commit eb9eebc ("PowerPC ltrace-elf
handle LEP/GEP offset"), which uses the PowerPC-specific
PPC64_LOCAL_ENTRY_OFFSET() macro in generic code, for all
architectures. uClibc-ng's <elf.h> does not define it, so the build
fails:

  ltrace-elf.c:1019:25: error: implicit declaration of function 'PPC64_LOCAL_ENTRY_OFFSET' [-Wimplicit-function-declaration]

Add a patch, submitted upstream, that only applies the offset on
powerpc64.

This issue has been present since commit d4a505b17565
("package/ltrace: bump version to 0.8.1"), which pulled in the
upstream change. It therefore affects 2025.11 and later, including
the 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x branches (2025.02.x
is not affected).

Fixes:
https://autobuild.buildroot.org/results/c66189f0fbf5df777f747b72d97d2e4af178c736

Fixes: d4a505b17565641e7655e8b992da5bb6029b0ee7 ("package/ltrace: bump version to 0.8.1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...apply-the-PPC64-local-entry-offset-o.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/ltrace/0003-ltrace-elf-only-apply-the-PPC64-local-entry-offset-o.patch

diff --git a/package/ltrace/0003-ltrace-elf-only-apply-the-PPC64-local-entry-offset-o.patch b/package/ltrace/0003-ltrace-elf-only-apply-the-PPC64-local-entry-offset-o.patch
new file mode 100644
index 0000000000..004d8f6a5c
--- /dev/null
+++ b/package/ltrace/0003-ltrace-elf-only-apply-the-PPC64-local-entry-offset-o.patch
@@ -0,0 +1,44 @@
+From 2ea021aa0bc58fd56df6af37c8e7bc8b27e35f29 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 16 Nov 2026 11:58:32 +0100
+Subject: [PATCH] ltrace-elf: only apply the PPC64 local entry offset on
+ powerpc64
+
+Commit eb9eebc ("PowerPC ltrace-elf handle LEP/GEP offset") added the
+PPC64_LOCAL_ENTRY_OFFSET() adjustment to the generic symbol table code,
+so it is used on all architectures. This breaks the build with C
+libraries whose <elf.h> does not provide this PowerPC-specific macro,
+like uClibc-ng:
+
+  ltrace-elf.c:1019:25: error: implicit declaration of function 'PPC64_LOCAL_ENTRY_OFFSET' [-Wimplicit-function-declaration]
+
+It is also wrong on other architectures that use the upper bits of
+st_other: e.g. on AArch64, STO_AARCH64_VARIANT_PCS (0x80) makes the
+macro return 16, moving the address of such functions.
+
+Only apply the offset when building for powerpc64 and the macro is
+available, like sysdeps/linux-gnu/ppc/plt.c already checks for it.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://gitlab.com/cespedes/ltrace/-/merge_requests/113
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ ltrace-elf.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ltrace-elf.c b/ltrace-elf.c
+index beaf69f..1091483 100644
+--- a/ltrace-elf.c
++++ b/ltrace-elf.c
+@@ -1016,7 +1016,11 @@ populate_this_symtab(struct process *proc, const char *filename,
+ 			(uintptr_t)(sym.st_value + lte->bias);
+ 		arch_addr_t naddr;
+ 
++#if defined(__powerpc64__) && defined(PPC64_LOCAL_ENTRY_OFFSET)
++		/* With ELFv2 ABI, the st_other field holds the offset
++		 * of the local entry point.  */
+ 		addr += PPC64_LOCAL_ENTRY_OFFSET(sym.st_other);
++#endif
+ 
+ 		/* On arches that support OPD, the value of typical
+ 		 * function symbol will be a pointer to .opd, but some
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
