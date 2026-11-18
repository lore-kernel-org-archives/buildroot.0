Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B0606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S28rapmm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0DF68096D;
	Wed, 18 Nov 2026 08:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdN_l4pTtpuH; Wed, 18 Nov 2026 08:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E38DF808AF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794989313;
	b=S0Sa859gmJ/MGF25S/WAxXAR2Mb+SKi4n8Cd6IJKzQLPnnN6cTMN84Umc0s5MvourD3S
	 9U9fU0Y35UeHky7KqLXqOq5/JKdr63ANoz630f9YgQGZZfENZLSTJMtukSTlqQM9wuBbp
	 kD82s0RLiwa8KH7/RG7aW3IA7h3LZmmSO9Mly/y9MNbaJvKLYgXjmczw563ZdqLEwYiKJ
	 ylLORdZVQkiRsylm+3MRawPFbmI8RdiitiIAZTgML4CyeDG4NGka6K5l+m8uMl51fhhN+
	 IfzgwgI//50zyqL8C9fR3IYzhc1J2LIUzdNbs6oYBpXAuZh5Vbz/Q6rciWTHbkvaWUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794989313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fV+SNfTlhBPIyDbfjJ2+Az8O3a2S0OA6te0O5fm2ikE=;
	b=pbGfl76qmpl0OmS+yu6KQMzbgzf2RhtC5btrjmTq7cnI7xmRXxvTSmNdh+PYiID1Rj98
	 41IRI6PJLosWuhVYUkqmolAoDRdEPFr9A/BKZ3V2Sa6g3OxX3/2va7eqCQLzROQUN1p/F
	 RB4C3v03t0rlEOZ+cxEenos+y80azPiv/1/co9arYPHz0IuNQqwzribHlJPbhQchSp/V7
	 JPWKFvYy4qKMPUAt9JNaePgi3nySKhkviMx/25proDX3cdNOKFGuDTH28hkGE5CPwRLt2
	 xP3jNBEoK6wxpuMXVqJO0LWlExwg3OnYmQLJFRIJIf16K1F/D/i9QdeisnHLYFkQuvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794989313;
	bh=fV+SNfTlhBPIyDbfjJ2+Az8O3a2S0OA6te0O5fm2ikE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=S28rapmmFW8zFKokz2bF7jL8SVGoAH9jScdRqZWQt8by7RbVYn7gkbNajMhr3djLU
	 m5kHapmeLcNuDk7x70+GfaQmKwkqJjySoqlpkPVTTz9cTyPSI+G5+b//WsgDRp8/5D
	 Gve8JykiAModtvLCfIJTPup9yyNTkxh02IABMEElBuyL8oDcuDuLo4En4pECmyRwjZ
	 yqzy1ha1VABb63l9ieFpl97sMweeQ8BKfs569A1yHzdKI0m7ViFbi557z0BfVP1x5a
	 tu9Rb2iUT0qNaRN1jJ/Of7neZkxMhlNieZP0vzmnNcmbcETVONYF+Cnnk3wAubSi0M
	 DtcMYtepxPtXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E38DF808AF;
	Wed, 18 Nov 2026 08:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D27069F8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 08:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4C9C808AF
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 08:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwoV4yAM8wXh for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 08:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC61D808A6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC61D808A6
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 08:08:29 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c50cc8e0f84so87877166b.1
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 00:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794989308; x=1795594108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QPzIFVH34FYf0cdAZziXELdt9R08vfCKvHkvSOniSvU=;
 b=KU4zSL/fE1WlTOuBiiDQZn6LsePerl9a9tjmWR8C7HNlh5RLa4PwSFAL8ZhAp+zLHI
 IIS38nuGiIjCtuKCSn9TKbCo6QeI/aewWkgL8Xq8FmirU1wPo158GgAsO2VQ3tjTs1br
 B9dTp/YPkw3DTTtk7ZAAtrClwoE5V2Mwak9ro2JxuFwK6lNF+Y0LTdwEUPS3NUoLgpDl
 +JclhsenNr8wpUCaRuvwcKZdAbH+bdG522SOr+sneyFG713X/+2PL6RjrZX0DPAZ1a7I
 QuIUZt4EVzuQxK7ejBp2g2vA00hd466xNRWmU1cS+Xwc5aKg9lnX5O78OHRzTjMfsLJq
 RA7w==
X-Gm-Message-State: APuU4Z/Bam3rdMcmu43MFYsLPT/Na9mlqT+iI09WmK/r7wb6+Qo8O3s9
 vrTB4L2LpqsQTVxAhcGOOBC8ZiS1p52CtHUPQF7subucyjaUbfPBVtuprHp9BQ==
X-Gm-Gg: AYBFou2b3/BYT5SbDfgvrE3T9bmrqZpngmhbVl+ASIyBj39hbo/LHlGEnHghvnr1ES/
 IaZ5qmRvEGIUUCMEY6oic0eoTHgP/ErhsUuu+kGFEa7PvHrCsYQK7TF+oiB7xq4OoLUVih11vKv
 ta2sMee2+fwgnIXNYH6+Al+j2jJ9QfW8/kljXn2A/M2brhjtQTQ+tKu9zMpBjRsRP7kfC7NymDp
 WYvZBLCKgQQU0jQWtS+O+8WwjqRCWKmgLqJdkxA6IkpMLGvdaicuunQEaPmfC1riN8IZZO5woiS
 s51an216xIUUh8xI54SPjB8gQhXO14HV6+6RN5ACrU1wtR5oIXL22u9umsETDFS20ilP43MpydN
 nHmawV3ynIHDWRRr2bjcJukIaJCcwE22T5WgQLhywSA4FN1s+ARy1b98QtEuXuyu3LUrcCfuajl
 WDOFgBXATmvq5rnzTpcxDqnK9XflUX4X5LM0AJFPeOM5uhCNWnOQZuEuu7gI9hMVJmptop77KKC
 DDQJBolVzCsYOohR3nLF/VtNK4bqqyrqAgIGwAMFf8NPq13+6cweSvHhcDKjkPSRvq+kSJJetEc
 4itvkE5n46mxjwGzCt6Nhz0/O41+BETt+2NJSAmUdgPi6nRHK7FvVikJsJ577g/jcoJCXjiMNGL
 vgbJ032kI
X-Received: by 2002:a17:907:2d13:b0:c38:ee33:2931 with SMTP id
 a640c23a62f3a-c510e32eac6mr133463666b.37.1794989307543; 
 Wed, 18 Nov 2026 00:08:27 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c51199921basm19540866b.58.2026.11.18.00.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 00:08:26 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 09:08:23 +0100
Message-Id: <20261118080823.387880-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118080823.387880-1-yegorslists@googlemail.com>
References: <20261118080823.387880-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/uftrace: enable on riscv64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

uftrace supports riscv64 since version 0.15. Its arch/riscv64 code
saves and restores the fa0-fa7 registers with fsd/fld and reads
floating-point arguments from them, so it requires the lp64d ABI.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/uftrace/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
index 6ec2761fa8..2513a3f7d1 100644
--- a/package/uftrace/Config.in
+++ b/package/uftrace/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A
 	default y if BR2_aarch64
 	default y if BR2_i386
+	# arch/riscv64 saves and restores fa0-fa7 and reads floating-point
+	# arguments from them, so it needs the lp64d ABI
+	default y if BR2_RISCV_64 && BR2_RISCV_ABI_LP64D
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_UFTRACE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
