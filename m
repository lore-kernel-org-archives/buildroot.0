Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0AA606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aMT5KpCf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ACE781203;
	Fri,  6 Nov 2026 15:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5rJnsGFizVh; Fri,  6 Nov 2026 15:58:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3C4598120B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980725;
	b=PPHogF7Saphi7snzFyZER3rSH7GfDPE9elG0jCaQCpmLuATeGmxAgsvU1KIp8oBVAeWA
	 lQVU40JaKZnEAhKIJ8j7sFcKqRQenn0XoG0G8/IACelFGNfwWAQ6JPXzO2jBzpbWwELrs
	 eRnKUYf1cH1NREInVJYZ35xSxrcn9RmTao8cbkQLxwk4mbzVjUhbweLHy2Vdslz+vKs1J
	 I1Ywm8Qhm1D2drghBMqPrV7+xCR2VMGIrxtZS179jfxFjJRa/dWhiuZ4NvYcnSpQRPSt1
	 gtz6TdbcVHTmdRy2HWTFMf2FGzEmdaBXofhMWnVwWU/0gVoiHtExCoxn+/gX/2+f0uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QrKNnci5qaDQ8kIbtSuDsN79bKnX1M0gJ3F2IG/mdq0=;
	b=o3NZzvWWsCOpIbuA1HNVENIiejgbZ3Q6Q1uXa97fqVruByV3mXsr7kV5DvSBzki1EmMe
	 IUeZfpY8gqyZh2asot74GDDtfSkZjgRo2SivXBohr5dVEtG4y6N71rN5t788BI9U1VOJS
	 dbfQMkiDkYCl4/Rw4mmdh9EXYWJTyoFExmry1qyZUV+9krdpWIstJl4lwa9ZYl2Z6E0pv
	 Un/TTPYohIVOYTSbA8Z9kVAyOAG5JHNZPlSTujnZ9If8V8dJte7/7g3UWhkKxgsxl/KyE
	 B1+Vc9BpMF7YGm4y6CYuhI+mX/Zi+yQCKAvolzRitEuMaurIU89ZWndHpweUhKjW5Dg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980725;
	bh=QrKNnci5qaDQ8kIbtSuDsN79bKnX1M0gJ3F2IG/mdq0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aMT5KpCfFW7n+zr9QZTCJXR74nwvc8hxUShjGEwF6moSlqCMC+O0zkfoYfZT/8tn1
	 uuOIoc/36ps7Jna3GUm9ishfpdIAM571S/N5Sf+H09+jfKsRdXqTsp5ev2dF2doGkv
	 ZDOl1p7VoPnOQ8lX4mdxLe+Eh5UZ6n3mYplmsFpxlI8b3Wygjp/zM3a/uQDh18vHGX
	 lxe3d1AAjrw2v/Q1Pj98yeII2bztcbNo7+OeUw2QjHyCfJXWhWAOZ4bkUSyb4nChoj
	 S50m0hot6jbUTT0T9lxpnqXlc27So9vQ8hjn/68InErMVVmrXKcY0zW3J5XxmufGrt
	 G3jSWZTGZhbBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4598120B;
	Fri,  6 Nov 2026 15:58:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA0424B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C8F5400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r95EG_tvmOKl for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 56937403D8
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56937403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E5289E09B; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 11:27:15 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d07e0a9bfc73981dfe2975cfaeec72e5be8d8bef
X-Git-Newrev: 0e0616428cf5a5e7dc7f2e7581f94e966a09d8fe
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.8E5289E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/gen-bootlin-toolchains: fix ARMv7 EABIhf toolchains
 condition
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e0616428cf5a5e7dc7f2e7581f94e966a09d8fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The ARMv7 EABIhf toolchains can currently be selected with ARMv8 cores
selected, even when EABI is used due to how the condition is
constructed. This obviously fails as those toolchains are EABIhf,
causing the following build issue:

Incorrect ABI setting: EABI selected, but toolchain is incompatible

This is for example what happens with:

BR2_arm=y
BR2_cortex_a32=y
BR2_ARM_EABI=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y

In order to address this, we adjust the script generating the Bootlin
toolchain package so that EABIhf is required for both ARMv7 and
ARMv8.

Please note that we already require BR2_arm for those toolchains, so
we are *only* talking about ARMv8 cores being used in 32-bit mode.

This will be needed to fix:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 43a8c35a383e53cc81ef4b56d346a5501178d7f8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 152bb90a85..b14bf77616 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -53,12 +53,12 @@ arches = {
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_arm', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_arm', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armebv7-eabihf': {
-        'conditions': ['BR2_armeb', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_armeb', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'armeb',
     },
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
