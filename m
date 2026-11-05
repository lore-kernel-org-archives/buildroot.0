Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70742606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jfpjUUdM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48AEE40807;
	Thu,  5 Nov 2026 07:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-SZSq3lZHQB; Thu,  5 Nov 2026 07:28:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5634A407FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793863739;
	b=l1e5mrx+sxk5y9HqdXDh7FPJSVUdzXKorA8n5NRp6c1suYZ0q6jhwZOfD58woU6AVhYf
	 wFil/vXUKJgNGaQr3vqalFhdA4dKi+DqFwcrmXgjxR7TLTFEfgi9mZrluunhIKvfxacUt
	 L9i6ZqLTVq4wbe7bryWWJgMH596ByOc83/+K+KE32C/vVI9KQNe+8VVEYN1yS11Pb+ccD
	 FWIzLNfQjKEjZm1FyunkmqZYrFbfYxKEoVQK49Xx/xDtFvCELXD0x2xbmSKDl+HqcZlRe
	 sDu7RV3nzsZpkqXakP/b4qUP4uS2w3jc0mfFzDx8ML2Rj7cF6RsMBSNPxYK7adga0Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793863739;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IhA8K8RS031SCSWAuPpb8jgtsEFIYR7ChhzJc2lkG/Q=;
	b=qs1sRwuzzsu+LYqZNmKZi3X3UhYKVelTsjb4lnlW0m1mdHUY9elQgcoq2sNr1rsTkxiC
	 1rnHvIXY74BMuH3xkT0x8QyzXikgrOepFztuKlzJTs0ofB42FMHESzWB/yIF+W8CPG3LI
	 o8enE4kl18HEWmmxi6Td8hHfBW7t29XwN20BM2HR6wvYdZ31kbKNkvyeVYJ26D7WtCQCi
	 vz6eExA26/ifOAPpEoQqQk6VKkdQztUU855WCpRwWkOGkQ/jdllHSyVr+gWjv72TbH2Pm
	 8oCBRWsIhlkKO15RNWdhMuDfY7cS8oGh4PMZt9yMB/MJuAvaCgfU/r5tijZ4LWBwqSQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793863739;
	bh=IhA8K8RS031SCSWAuPpb8jgtsEFIYR7ChhzJc2lkG/Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jfpjUUdMZEFSFz/99oxvCPXP1pG38W8KIiXrLZC4qiEY75dGIfANSWG0VNBHt1+cX
	 dIEtsj1t3lOWzMOOClaxznBHf1eWm53+wWQNIgAmPHIRjRnbvU3luQypxi2sV5SkHM
	 2VoJyMOeet2ioWQfyOpglACCwfiSZvzH8IyJQ4LgFYJ7HacTskyVOypkm2sgVDSSyk
	 84HHAtw8nFGp+cxHxB33iw6B8ao2M5IOSkIbrBbK90YMpfA8VCKXYip4nDBBRq6FTF
	 f2FOrlioR4UdzZD8Q5CazV3T+7JY06SH98yQdRxts6FqZi4FqsX5Erd/sW+vzGGxow
	 2Dbi3V4TJFIdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5634A407FE;
	Thu,  5 Nov 2026 07:28:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0689F362
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFE8C4010C
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9KW93kEmkIg for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C365C40076
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C365C40076
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:28:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso252780766b.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 23:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793863734; x=1794468534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/+jG7asQ2XjvitvHBq39c4M/QNCN2RFj9xRHD6XpInk=;
 b=zLoJRj/keVq1OhBbnjupTaM0BBJl4fLNdm+LaolrNlF1Osl+nG59KVRjt9x5pAvGMF
 RwwCR7tX1/IQ6SmeC9Gxlb5mYcZWA3bLlHL87g5RF3NJRR5Q0RXingZ3aeq9V2VQ6Tbn
 MKYaIzJNcj947s9MJLZd5UcrPljzV6FjVByxwN1HkFTVMo3RBsegBxll+dg3FfAwE2UW
 5gqKArLe33522eJ9RHUUU+/RxhcpG8FJU1C/gFsyx+mTrTe2uPX+TPRm5JRO0fl61tyL
 FZwmZ3UL+x0z60PeWbZzHZqwdDlmBosLSf/0vcKANOq9LjBQwIQeGSTzY9qmtdn3zXQl
 KYXQ==
X-Gm-Message-State: APuU4Z+UMwaMzClkR9wmCC2ZewTu90CFRLx4RJMYGN0I5Diifl0I01u4
 J2uP6QFIAZbl3v6gaCS68WKiLh5p1q7dLTLtTC2zf+vB9HCcajv2KgQB+v0RKA==
X-Gm-Gg: AYBFou0Z0VXzGDaNW67P1ebkOItQ/xBWBMVta2LySl453XKCklkqMWPuUe6CNDbla//
 8+lbLrU0AZmhhy/5IyNzPqwzu3Ydf6nfyvIv3JyvfYGxnvxeRclFCztctsid9o0dUOnBNJmuhzj
 k+kt6VZCol3IuxedK5weNnT/XnuKshsH2VP1gEeehg5Xtf/p73zTEk03ePAxuRztPdO/jIyPNOr
 PDW1SF36fq1qiEKu4DE36cagFB3Y2SF3X7Bb9QOkEJT8gA1fDERmP41YC5k4iMM1PhV5EpVmAxf
 fkdcVrfTj723duZDdbKEeIEZzOick8T9M584tSua62OONBeHjelZIxBdksC6lRNYgoJPepNW6oY
 HeQ12pyVIyTyGG60hQl1zBJZMHRwvUnmq63sIh6l601GS9GToKqJ86J4+lYWTycpIvWpMwFNhjq
 9t4GijM3IEvaBJK/BcA0vIZUEB/hHXv0+SIZYbu/gUInhFygseq34/R5Y3GH4JYbJInQgkmcqOF
 a8oTv4m3gbBv0qbwsa95LTufS6N4jPrGgIzD11i2DY8gYi91s13whsjwlgID4nx+8klsOPBeJbs
 Zs3Tn6P7pIWc7L2XJJbEokAKS7BaI5OXn3SnPzrUoH682/1jOhD4aBaotuDr0HndR21nCabIrnS
 osA+p7AKF
X-Received: by 2002:a17:907:1c89:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c4ca7a4e4b9mr1537098666b.17.1793863734189; 
 Wed, 04 Nov 2026 23:28:54 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e46876asm145857566b.57.2026.11.04.23.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 23:28:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 08:28:53 +0100
Message-Id: <20261105072853.30950-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openssh: fix build with
 -fzero-call-used-regs on ARM Thumb-1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since OpenSSH 9.6p1, configure enables -fzero-call-used-regs=used with
GCC when the compiler accepts it. On ARM cores that only support
Thumb-1 (e.g. ARM926EJ-S) built in Thumb mode, GCC accepts the flag,
but fails on some functions:

xcrypt.c: In function 'shadow_pw':
xcrypt.c:156:1: sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target

The ARM backend relies on GCC's generic register zeroing, which loads
zero into each register to clear. Thumb-1 cannot move an immediate
into a high register (ip, lr), so it falls back to copying from an
already zeroed low register. In functions where the only call-used
registers to clear are high registers, there is none to copy from and
GCC gives up. -fzero-call-used-regs=all, ARM mode and Thumb-2 all
work.

Disable the flag on Thumb-1 by presetting the configure cache
variable, as already done for powerpc64le and MIPS before R6.

This issue has been present since commit 3c047ea463e2 ("package/openssh:
security bump to version 9.6p1"), as OpenSSH 9.6p1 switched GCC builds
from -fzero-call-used-regs=all to -fzero-call-used-regs=used. It
therefore affects 2024.02 and later, including 2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/6b064db6d713a6fef7f202c37daf041055e647ef

Fixes: 3c047ea463e27ceaafde76d64406862c3322daa0 ("package/openssh: security bump to version 9.6p1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/openssh/openssh.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a0cd3168e0..27cd5fb169 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -36,9 +36,9 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
-# -fzero-call-used-regs=used is not supported on powerpc64le and makes
-# gcc ICE on MIPS before R6
-ifneq ($(BR2_powerpc64le)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
+# -fzero-call-used-regs=used is not supported on powerpc64le and ARM
+# Thumb-1, and makes gcc ICE on MIPS before R6
+ifneq ($(BR2_powerpc64le)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
 OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
