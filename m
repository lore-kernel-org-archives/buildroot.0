Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3873606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pm9J/crL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=SSeMDdKr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B531180D3E;
	Sat, 24 Oct 2026 21:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EW9ZcCKahKcR; Sat, 24 Oct 2026 21:50:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C52ED80F4F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792878615;
	b=Ifr4N+u6frmEct492ZCIf0GoGf7gymOxKI+rvvUlASjWVETRocbH+h16q5GamZOxvL2U
	 FXH0GvCfez9QPlZALPFttFGZ9wA7uHJSWeFcEiA40stRsEyUVX32j2Ldgp8SMs9RsbOzJ
	 bADmk4RubNhtVhcAiyODU38+3GUi9bX/hnUx/37IKQ/rhapVjqoxLyCsNvjqqPY0AuXX2
	 CZmZqqLwWTRbrdEcRqtzhNhhYe6+Cgpfgl1L2My2RKmJ93CDUy2oo8qjr1V1BHs9RDe+1
	 ripRisKSr4CoGvP9Pt/ywakqhl59sO/D55py4qux0AL0BSopjJo5EAZYWfL8SDg0KOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792878615;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YR8krF3QtANAo+iEn5F3dlKFpSKttPZGdxN3tf9ep8c=;
	b=AXfUMYZfbLWvEOpmllTNz/BexviY72g/vvXKpkP1C1gQQOhOTpTpQqB+qMnoJGH3OqlQ
	 /5+BaUGGwJ2jcyRlBsOO6/DRHDaITq7kTF8wq5wkeSGBj0IQDoiCukJS2NuXQvr4fQywl
	 +xTq2I0V3dd5HW6qh7h7un5j0otSIAwPx/MFjR2pISPZ0BwMvQ0JB9xQchXeEVLnQ9mKv
	 uazoLh7YwBM10D5fsV7aeVCVl+y7DZPzT0HjJWCBvfjK1Ofdjljq56zpPSqrrvoXG3xSX
	 Qk7gVjXloMB8bwUmbJlgR/bOO0rxUKBwVfzRmPIUSjuQLGkng6vMDIfCvAbkzYuy0gg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792878615;
	bh=YR8krF3QtANAo+iEn5F3dlKFpSKttPZGdxN3tf9ep8c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pm9J/crL+SyHToPNETruuEbWoGl7+rYIjWy1WNnwE7rlv4YPdRHma6sYLRGvq9hEO
	 PCWgyJJMVhyTPV8fANqErFrxrGa85ZsQ+UAd4UGZz3BacDFIBSExrm9diT0B7I9VGp
	 uV9z1xj5u39o5qY/oscr8G34K6I1anO67U9UxLzd/u+GsBlGDH8XIhmfa28iUkJDxK
	 0mG1zrJl4k3wj0TlI55Rjcz5yoMGNWvDnVxDANjzQw2/Uxc1CD6NaPwpChSbQ4yteP
	 GzlcATjI/KBYGCMIks0jK1C7hYhV9/FoIcWjPWuYMQyOwx3brUOuRW4i8mN4FVCmcy
	 cWaYpa0NvOf9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C52ED80F4F;
	Sat, 24 Oct 2026 21:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E29F543
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D430E40641
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOzbXAml6Ehw for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:50:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B6AC44061D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792878613;
 b=RlGEK4fdakhizU1rAq92kigcHBk1kQXdTyzDZ0tVfS8U2DOvep6Abi7WAOY4FVVI2MDz
 oA3ompfB6sb1FDCaWwhWYvme3FWuwvt5ai5E4PdHBQ3bk3MKWbUIYmKM/kleSqNgjbwr6
 EhjJSrkNBjFmMWXV5Gf8BRU2N2+68R5aNz1pfElmUT/oJUh5hAlQj5c6o3QNPbq9dWItJ
 Ou9I2x1Wkn/baViEqDxmC4Uc03xtDOkhPOCzfe5MU13vVOfu9nwOeq5N/aO2iPwomWXLF
 IlJaG95ZcXVoUZXOqNljJLtVz68eMYHAde7+dvaVFePzZ/OK00urxdtZPSs1SRlTekw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792878613;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=5ZdN8JXw9K+3aYJHshEmIPNqsuXY8AJ35/Pxro3+YPY=;
 b=iXetKD/79BSXgpjjyQVtCRnWc6NYvuZc4ek+dA5Q1lbVNSfI1z0JHNnJHsn73svaqUUk
 N16UKlD+LwzBQNXeFmfSIuSoLRn8DLjwAUUNbEBZTqlaVACd8R2koVOL/4b53XQK+0Jrb
 6KhaQ1NCiF29YPwGXyp4WE53L6uEQpmA2BXx03mMDvnsyLwne5JGLFMCM7y3uVJwL9PAA
 iz0Gy+EiUCfBvdJVfUilDGGOU9kTxpsua/jfzEjQiqnQ5ANV37vR+X9Eq15LJvirXG5wF
 Oe4PzvlcmRYI5qH/J5yBYtt82t5Kt2EffwR8cnfRfNjhrRiguhzqFhmspVmxGuNuNWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=SSeMDdKr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SSeMDdKr
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6AC44061D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:50:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so306575966b.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792878610; x=1793483410; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5ZdN8JXw9K+3aYJHshEmIPNqsuXY8AJ35/Pxro3+YPY=;
 b=SSeMDdKrezPMvnKGaUIsDujAyciI8glcCcsnTfAAGvSY8YqvZp3GKfWrY4zAXNOnSd
 Hq4WA3fgFkd5G+P5vaW37I42ZGDOitRP1r8vhruGow0FHndlu4zIZ+FMT0UAPGl/U3KO
 xJGPhPuUttPEVUV6Ae/hNbD3Mh8nyrufHIfvOeDuHV0ggH+ZLe25wkHcH8+Aaft0iYY2
 v22gs3UkZL8OmKN9j/z6jeXltf8lhbR0gjq8fSb7VkK/WPKGg9t/Wk35f5wUcxhwgvfc
 KjQK+Bma28MZ+4eU20pYX08Twp5fEf7VD4GQ5LDjaL/CsYTxuix8CVht88agct9ZV0Vp
 Rnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792878610; x=1793483410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5ZdN8JXw9K+3aYJHshEmIPNqsuXY8AJ35/Pxro3+YPY=;
 b=PqdBcWEqKlagaBvHRug+XXYrbY/KGxR6Ceu3Vd0PzRE2/TPCnfrgbpN/FWV7mjnhQ8
 Qy+Fv7E2FOdU8V3IHN9ZSC6KWcCI0c0ySQgyB4CFfbKxetOTItep6QEeidw/Tcdm2Qwj
 6eh4qlKdomRY5Bq+3bMEcuDm6mjb5xcFFLCekmpmBZ/f3QIdzog3hlAOuZtP/DAzNLFW
 m46g8PBXTjw9ktlyUrktyfagsGsKR58vLPmZG1lMHj7aeo0ZnT629WPWuqCyQLVgMiLH
 zMPN39VSGOV4BErsg24l73JmfMrKQJDsw3wHmLParjN8MOSxlA0dp7ONJYbk3Lv9KVez
 ZQZg==
X-Gm-Message-State: AFq9FYJ5+aevAb+R9MNSMEsfBqkITjDm7uFA3Ze/AGFH4oBkEuyle/9j
 bPAzvdoi0I68WLs1s8HrLw6Gtx/HNcPEcwW5smEQmwuvkMOhlHBHEcfkwqkz21Hp
X-Gm-Gg: AYBFou0w+573lwOWQAfFuSqcfLXx1Q4Jira10Rk0oG2GMlaP4cdO6rgk4szKi0+WxGR
 hhGjr7iTxAc7HfEFQUYUaGtlVaFEmZsBkqAqoa0edaeA43rjXOw3rREYaJqU9gTd+ZbOPSRUBMt
 u/hdOwuKFZIncfwVj0l+P9BMMLxHz9CbRiCTbD4KoinMW4M88N6qVXejI7fb71EjR/CwVxzyE6/
 C/fD5xhyS82ap1kOdjBISxK75LL+xO6nSr/2iTfq4xNMH2qwrDCmzOTZnY9QYZUjd+fmjnITIPr
 F+kGxqlKPHNjIsRG/JI4O1zDZ9/hg9wMHzs5XZFmDNrmZ6ZsgYKF29i/X5eox7KHBw14t0CXiqq
 8WgckH3SD+71R+P+gnfXpnVXqbRPTPnyEDnZy6EeSiFj1iGAfvPCdgwfKz03nHNpP9BEalF4Bj1
 6gyHdA2GeGvOd7YSCv2pjyQAR9gSFg/+ypqxERuGaSyypFn87ikgp9jy6uYOAORvmcNHDejB14A
 0bWlV8BEAgR+niLpIQQvo0RA90fCRzHtdqNeGBPDnZ1lnRA1c57Q7gamEGJrhEl6RPuYtrBV1ry
 zB9ZIdM/Gj5MP6IooxYviXp02RnWUq8NIek=
X-Received: by 2002:a17:906:512:b0:c46:c3ad:e1ca with SMTP id
 a640c23a62f3a-c46c3ade2c2mr200904866b.9.1792878610081; 
 Sat, 24 Oct 2026 14:50:10 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd35004asm129678666b.4.2026.10.24.14.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 14:50:09 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:50:08 +0200
Message-Id: <20261024215009.1004860-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104820
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT,WEIRD_PORT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

-fzero-call-used-regs is broken on MIPS before R6, which still has the
hi/lo registers: gcc either rejects -fzero-call-used-regs=used for
functions using them:

  sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target

or, depending on the code, the ABI and the optimization level, ICEs:

  during RTL pass: zero_call_used_regs
  channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408

This has been reported upstream, and is still present in gcc 15.3.0:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817

MIPS R6 doesn't have hi/lo and is not affected.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 toolchain/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 4e6a8d7927..5f4c5f5fb7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -210,6 +210,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
 	bool
 	default y if BR2_m68k
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
+# ICE: on MIPS: in int_mode_for_mode, at stor-layout.cc:408 during
+# RTL pass: zero_call_used_regs. MIPS before R6 also rejects
+# -fzero-call-used-regs=used in functions using the hi/lo registers.
+# This bug still exists in gcc = 15.3.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_104820
+	bool
+	default y if (BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) \
+		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728
 # https://sourceware.org/bugzilla/show_bug.cgi?id=29621
 config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
