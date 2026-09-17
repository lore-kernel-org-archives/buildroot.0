Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA425C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85ACD80892;
	Thu, 17 Sep 2026 07:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftdDMS6n54Mf; Thu, 17 Sep 2026 07:53:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8B8D78096A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631618;
	b=isBMQFGyyuXaEdBdkMXSmuB3F5qUOJr59/AA9tATEKk9tKtXjLPxb0D0TC4GfYqzruNW
	 X7+C6CITMujSucu3gFXZD3QgE51zP2Ct3C/3Iaqt+HzlpCTXTd1zk7y7Yx5tyw5hiROpo
	 URiBj+PQ3iCmyBgZYU192qZSvghpZOl25bZFbqc3rTimhTjlJzWAMRpwJ6NqlIr/xK9Jz
	 0AbLLMi+EBC4/frLiTo8bkXZRVhRrTqHhT52V6ywMMSmxNu61os3CNFNpI2esmZFeaFQX
	 KfoooIR/Jri5LLZJcwMGnFDUYE7wsnN8xXG7B4RfsqPP5uYJqUWj7ttC3QGEUIiOXDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631618;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ad2onShcreUXGpHAuvcCOsm2g7KJ8YhiYhcewdZjmiA=;
	b=gVwk0TxIONaqkPJRM1SrrrBmaQB3igbCQ8YIHmGtBgAalCLuyMbEnYtbDMsetrAqPbhN
	 o5ATPtAsY4VT+vDf9JZl4Iz4GSjADJFHubfhCgBIOQ6++yvq6tazMi3QO+BrrgCR546YH
	 VDbPy8hpdnzu+470yoakPsi6xrUa72udBP70buVE/iaDD5wbje0f3JGAV8m1DXCpA6Gph
	 L+tpX6MCFnZSsDxy6w721fC8SzXeCD7brTKHYxZGwhdNd4vCvHI3dJOKmmqdbltCQBk3S
	 6nUvN5rT7WUGuVAxORBhj1YSuA0o6IG415d97bjRogmo5YlApfoYIpwdv8erAK0/rLg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631618;
	bh=ad2onShcreUXGpHAuvcCOsm2g7KJ8YhiYhcewdZjmiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=R5udpnynMcQGBBo8EAQmWJZZhXbYky2oHJIRVj7la+J3PCIfPMJSPWt5887mLzt/Z
	 YiwzZaDpgh4rlffLVp1Veb8oCSOSiCqfxqNkKbWGb4RzW90kdl7+Qc+cVZo7HOKMgJ
	 6trD751FLu/cpK+zdhkq8N94cKmK8jYvuUgsUl3V82n7UJvOWUfkyDDIxERTJJUBe0
	 vQZdejz/M6x5uTsBfNqACZ4cJhM5Ff0A71CDtnP4CKn17rfufD0RNX3fkJsHn94YT/
	 agO/32WzonOg+4GL5jiwoUQSaIwimR16+n+0UCoHpDKnsI+Lk+8EYoKapEn+OMk/N9
	 FaKOImkQ9yvrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8D78096A;
	Thu, 17 Sep 2026 07:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA7C3A29
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC33760659
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPS26R7ufroH for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:53:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7FE346081D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631615;
 b=WL2ZnLGtQw5RPuOc9mWzAyFANLXwZyz02dKOznfh5QnNy/DsclTrhuS/+14j3/98Tyok
 rJEWA35/tOY0ugrzg9o5pwwFkC1JDa+j7/65B9g1vxgVrCiSk9D29matmzflqKBfGtUs4
 0pt66ux9zu2t4xV80lFKJKOoBBJJb8/5YoXnz6tLz2eunmjWlkB+IgjPi2Oi0JUE5imhQ
 0tRSnz54jWMT7AxQIfmSVoXNzoavDodpsSombEDUpUqnrqzd0Ir7q9Nkqp/+LPH4PlkQX
 KgtTdI+50lEaPImon3nXDYVSMMgnrDqRaEMGSHSbKs+N69WS8bJO70W5j48mEk2b/rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631615;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=6d3yvt6Hd+5dXyQFQcAqN6KW5GlpZDU9hJRu5U5Iuqg=;
 b=p5EWMWNTvUq52qllf03wX1zWHS/RbC9N8Xe2uN9hEn6BGT7XYrH5OAiAptgOtBo7o+ok
 2uAaoJwUIGgrJFHfXjIlHfKxlW8Ja4/Yg4MAaqfMAw7+dyggqbfmll7SZ/QA/EqQReWbb
 dmWNlMgFvh8Ugvg17PyjAIv3fhG1ekAwRgEVOqm3dJN5IIJ2V1RbDa5R1jJgK0owvYsu4
 bYKp7pRtP/Ta2fuSQ4VAVQ3ddT3IeG2czogX1XJAduvMq+8Lo6ZrWWOoK6TurweHDI/+4
 OuJSlkGI8OqGpwBQSRbjaTrz7VmqI5Jlf7Zak/DJvl6xw4RoSHL3d2D9oXG/i64oPTQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=aAhGPM57; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FE346081D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:35 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f9c60b9so43826566b.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 00:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789631613; x=1790236413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6d3yvt6Hd+5dXyQFQcAqN6KW5GlpZDU9hJRu5U5Iuqg=;
 b=FoVKh4DduE3iQYhqt7ts6cdRiUtYxco8PYMC5xvlWr6af2tv/DROQPbuYub8VNpqoY
 vb3sOvRsZf8KiiG48MXkdlD88O0a50vS4T1Qpnjak5gUFezf5i64b42YbagLvfrtNC44
 AjDBiuXygpCzJXw9XF4HeWNdgpepKTNLmORkwD6LdwPJhL8tqyy3pvoEcYniomuY5hAc
 qhnpD3f0HUELuzYdm31UcFnfbf6CowwsySAnxqRWc0ozjMAudEpXSv0mMMbxxgMhlI85
 fOy6FT0Gt8fB0K7eIeWZzpFCmUkGJhYkxK1xrBDqvF5UmMAUmdrus1mJS/35WJaPTQW0
 DCuw==
X-Gm-Message-State: AFuF++lIgPFswJtEumtScluabASXCYOLUpsGdzVomRSZovsBMqQ7re4f
 1By0JYZnXry8bRcBS426dRUA2ehOv2bRtRJbgaML1IgQmUXVBifpESA1Z2cABA==
X-Gm-Gg: AYBFou3xXVOC5aIraZMI8PqLe0v7tLRxJtLACzUUiHY1pcIUE8QXeiA6OHoDUfvGkzD
 bezqBkMyO5OgU4/gJeaBxJoUZ99FKfsEaPX1TaNrzD24OyPGLkP27dI1jbb4UDPKhZCRfH9BY/l
 QKV51/Kb+ROfWF+32LkxDuJzxJ9PZsIy46E0xlMdjrbLPUPzB0A9XXH0yjzJ3laJx2NM9MMG/J3
 mWDDCFB7z25fyaRxMIa44v8n2u2yroYfkrsQ7tDU2JW/9QLO2xfFA7NYQLg7JkzmJkXwezfE9rG
 O16B3cqUO1NTw1dWWd1MtNyaO8NTN6ObroW0t9CKmWLNFn8aeKq5k5TBT9/iF+AVfNZbIjK06gp
 SF0vFTrsHpFypiWQpuigVkk79EreHKkDFndA50YMzArt0/F9P95LLZvXJy8is70yw0ZU6PfPszA
 nN5/Eur/uJzlTEBuztNBiEW6jx6YFQcjct71LiY2hnTIBSOccQ33AF14TZiOXq4w6LB+ofM02+q
 3zJ/0k4dXgEWJjLe3JseFEuIfWAXztydzsa6JSQY2bU3QuYxoJtR6+PaA==
X-Received: by 2002:a17:906:100a:20b0:c25:4ba1:594f with SMTP id
 a640c23a62f3a-c29f4fe0753mr121317266b.0.1789631612895; 
 Thu, 17 Sep 2026 00:53:32 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de454b88sm246492066b.20.2026.09.17.00.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 00:53:32 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:53:23 +0200
Message-Id: <20260917075326.1256294-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] package/qemu: fix x86 CPU variant exclusions
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Romain Naour <romain.naour@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This series is a follow-up to the discussion on

  package/qemu: host-qemu does not support AVX512 CPUs
  https://patchwork.buildroot.org/project/buildroot/patch/20260914092612.1283030-1-yegorslists@gmail.com/

where Thomas rightfully questioned whether the BR2_x86_core_avx2
exclusion in BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS still makes sense, and
pointed out that excluding BR2_x86_core_avx2 but not the equivalent
BR2_x86_haswell is inconsistent.

Thomas ACKed this approach in
https://lore.kernel.org/buildroot/aqrl-vOwcHy1wpBs@windsurf/

Short answer: the core-avx2 exclusion does not make sense anymore, and
the neighbouring BR2_x86_steamroller exclusion, while still needed, is
incomplete.

Both exclusions come from commit 1f7efaf89f03 ("package/qemu: do not
support x86_steamroller or x86_core_avx2"), from the Qemu 4.2 era:

 - core-avx2: the TCG engine had no AVX support at all back then. Since
   Qemu 7.2 it implements AVX, AVX2, F16C, FMA3 and VAES, so the
   exclusion is obsolete. It was also inconsistent, as gcc's core-avx2
   is a deprecated alias for haswell (same feature bits, same
   BR2_X86_CPU_HAS_* selects), and haswell, broadwell, skylake, zen*,
   x86-64-v3, ... were never excluded. Patch 1 drops it.

 - steamroller: the real blocker is not AVX, but the Bulldozer-specific
   XOP/FMA4/TBM/LWP extensions, which TCG still does not implement.
   And the whole Bulldozer family is affected: bulldozer (bdver1),
   piledriver (bdver2) and excavator (bdver4) were never excluded,
   although they are just as broken. Patches 2 and 3 introduce a
   BR2_X86_CPU_HAS_XOP capability symbol and use it, mirroring what is
   already done for BR2_X86_CPU_HAS_AVX512.

I verified the TCG feature masks in target/i386/cpu.c of both Qemu
11.0.0 (the version we currently package) and 11.1.1; they are
identical, so bumping Qemu will not change the picture:

  TCG_EXT_FEATURES     has CPUID_EXT_AVX, CPUID_EXT_F16C, CPUID_EXT_FMA
  TCG_7_0_EBX_FEATURES has CPUID_7_0_EBX_AVX2, BMI1, BMI2
  TCG_EXT3_FEATURES    has no XOP, FMA4, TBM or LWP
  no TCG mask          references any AVX512 bit

Tested with olddefconfig on all affected CPU variants;
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS is now:

  haswell, core-avx2, broadwell, skylake, zen, x86-64  ->  y
  bulldozer, piledriver, steamroller, excavator        ->  n
  skylake-avx512                                       ->  n (unchanged)

Note: while looking at this, I noticed that bulldozer, piledriver and
steamroller do not select BR2_X86_CPU_HAS_AVX in arch/Config.in.x86,
although gcc enables AVX for bdver1 to bdver3. That looks like a
separate pre-existing bug, so I left it out of this series.

Yegor Yefremov (3):
  package/qemu: drop x86_core_avx2 exclusion
  arch/Config.in.x86: add BR2_X86_CPU_HAS_XOP
  package/qemu: host-qemu does not support XOP capable CPUs

 arch/Config.in.x86          | 12 ++++++++++++
 package/qemu/Config.in.host |  9 +++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
