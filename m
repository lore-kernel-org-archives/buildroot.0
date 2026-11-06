Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D0606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DeGwI/wP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZN4VnGW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8874081678;
	Fri,  6 Nov 2026 21:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqYM0rwi5eoh; Fri,  6 Nov 2026 21:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E2A781675
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999972;
	b=KKTLBbyq7ndwBGhGrq4+Zbdsk0zuvOdRHLUs+Eu3Opzu4Eejoz27VsKa0CEVEFs4IUWK
	 ObfOWLDUNwZkSzspbNzK4lJ+9ww3w+e9xER1tB9pi+RK4VPQ9dcoyacOg2wBifLammEwd
	 YA1gYtSZtlxZrOSWGAH4wVFGP5ID8M9jyx4Y0p3Pg2B0z98OmQJ9XcWFRj4U/gayQ2cti
	 xJg/IGtO6u7fd1eaXS6sQIaAlURf/fu1AIZ46JYRX0KTHm8khJ+aU3aU/6sa1VGnokxwP
	 1cyI4rfFuFLCzeI43TmkGdUvDZSMx1v4p9iQNFB7pAkc1uGNS/e1biCJvwTJ5dIO6ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EMU83+QDIrA7IcctINDHU3d0WOsTA6uR9vtSk+f9Q60=;
	b=JvdhpLOv5hbIQDe1tjiA60S0jpuvM6NSZ9A6KrEGtGojJqQm2bOGgzZLgYt7D18gDBw3
	 9U1HoWcwRX6ufoA5tF8xOPMar/1w7Ejt44u4JcnBIh2MyBq1nMduf/N2NaGpZ8FTtbosn
	 U5cO+4pPwh1Srel0smtJDpiX7tgWDD9KcSImixGkMUPH2Y5MWjPMDMOOifay0zlfAnAFc
	 SRH0T3mP6onfp084YAl28hVwMBH7zUFns4SVs6IfwcXlYi1rbJHZ8CQLWtV0FvEsZ/HWW
	 Z957qSvKoj5ixLtNl67ZIOzrXTjAKiq9pW1n8GKgroUoVrwX2hdc4KhavI2fMZcGeVg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999972;
	bh=EMU83+QDIrA7IcctINDHU3d0WOsTA6uR9vtSk+f9Q60=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DeGwI/wPYQVk7sBYu2FGYGVh3zz9TwWNQ2eXGzzNOaNnfLIKqq61BLzL3GkoOQpg2
	 V4wy/EgmJ09H+6Vxksw7f9MKQdU2T2m3tpdQipFfo0krQj90oI/3Rt0E0PGU/HBLUk
	 SvkHskwSzwmBEZw5uRZE15Dqy5tLWDxDgg9CX5lN1Q2bTTITnaOzBICRkZkIi43b8E
	 nGhaYLVaMini8T5G5eSaHLOiQwL4c7PtgpROGzRb0xHHOOSexb9fGdY3lkdufEPZsH
	 wrTCsmM1qmY44mSfmuB8UUWzvDRQrtha98CT4yMi/T59Zst89zakk+oguNIcenahM4
	 uFSydaD/0NnAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2A781675;
	Fri,  6 Nov 2026 21:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E50235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 468EA403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG_jBEfQO5Hv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 55E39400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=MZN4VnGW
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55E39400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:29 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-47b47de8b4cso603977fac.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793999969; x=1794604769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OX2I/UyzgiYwMh5SxMqsiCnumznleWxmkiOLKwACiTo=;
 b=MZN4VnGWobCKcxjaeeURtEK2GL7GV2rUtDRdPdUAC6u1APbI8diS/upy4z6o8VQDV1
 vbv/PaoJu4xocNMJs4oiye2PTu8uUG8jIOW+GyaPol6n+zBrAU0k3q2DvsNOzRQB960i
 96GCljBqffVCDzasUSWtNWrl/q1iyTY5P1fr+081PVA4EvAGJwQQtYGPdeeAwPofWmH9
 iPzZe1okvgYSnxWwEwibKtKZvWz3JIDGiaRydN6jNhby5dTYFVTT4oQuG3zOZyORFFDO
 uyj5YHtTjB/rlasTdkXZP9aQf5rbZzu1LbjkJfiWqGIs8v7yUwyIiBjfnIP51tfT75P1
 0Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793999969; x=1794604769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OX2I/UyzgiYwMh5SxMqsiCnumznleWxmkiOLKwACiTo=;
 b=nok4Cf8XtI6vU6P6C3Fr1ZdBmYE47cmQsCNnijl0fz8j0u4znBJ9z2eqBwT7PszoaK
 nPz5GaGr9QmSQTOGCDBMjniXEgsX1p1pvaqTQZcX4jnZkczTSEt0f0mRx+/ndP8PmjP9
 HShOMTjt/THPoC1NwyggUZYZuuHulQ6elwwRNAkHLkVPHVP6hr5mQJtC8ZOlIkjfzdJE
 wsU2zQKjFx8HDkm+gVjTnDBUlEGofKSbLc+piUM52uMKWXIS6ombhszvSdJgJqUmyIp9
 J+nCCwUCowhrTDdnUWNiu+pXOEyGJrok+pQUx38SrlQ8biNjg33PaiEU8xbmn1PE/cpb
 zaQQ==
X-Gm-Message-State: APuU4Z8i7y7ZTx7neqVZfTLrVyByeRKPVNczQlqK9kzw/hTzzqmkRd7t
 E03q8v1BWZ1hsqFYGOjTURjuc50XjhlPFPCEyjWDLUThAfbs7nXxF/KVkECLfQ==
X-Gm-Gg: AYBFou1fXuvkvhGCJROHGHutuVk3ujx9b79oHRRN4SnyA+/TSO25/kfLYZmRvP7cGcL
 Nmjva6x6qyVAIUR5AJSopagXsCAYxpvRWI8DTXJEzbVKEr+QoYqVZBxZ6bvSvrndnByjfK6Azs7
 UN4b5qQE5vsrvtzbfs+uYQnJBBxI0rOY1phU9N8p9T93uIks3eyMRWTQHglX4ZWQXyslpTgN+Te
 /BXSQzG3L54f4sGVH+f19OMb6ytOmA9l0G1jtA5Ce+nHmeRUX0QMf+MHzMDcwa9F/jSPi2EzH//
 bbqqS1S0dfzSdyswbuicDK6B7yKJVWwP/mVfWtu6vdWlsZHxiA/yjDSUkbadp9qcM7WWpF58BGO
 vX79azvE9bKPIyBrp73cmO1teNuY/X20QzNXPhKePj1fxhc02wHUFDZyaJcb0RK3dGDcC6botRK
 Yzs67hXpuRff6Qy0vwsVOFqbnSac/zObIwVz3womDEOLrj351Oy2ile64FQJR7so3I+0QHu4Fzt
 dYRGj3Bkw4MV6RzEvbczIdqEiMlT7GBsb0rGPBUJw3Bv3GJuaPfTgt8GMqLR015dCLhwxR/FoNI
 oRUVJLWegIh9kIMQ/bZfceHUBmkGqsQrfedjmPD2+6EqVdGn1oEXqTdXEj/qu17c2mNlM6y2MxO
 WLfTY+0VoJW+E4MhJUTyHRCUpNB6uooP1TI0BIRePWMpjEmTzpmfiOnnBEI0C24Uc01DDdsCQRz
 ZIDdgWp+odZnp4qND14iPibhO8TTRXQGUSSunyFGLH5vl5UmmoxRCcQ9WWZ/SqDBMI2GQjkvoA
X-Received: by 2002:a05:6808:c2b7:b0:55b:f8c9:128d with SMTP id
 5614622812f47-567e10ed4ccmr3221065b6e.35.1793999969013; 
 Fri, 06 Nov 2026 13:19:29 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4ad979d7032sm2873593fac.7.2026.11.06.13.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:19:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:19:13 -0700
Message-ID: <20261106211918.2606369-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-uv-build: bump to version 0.13.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uv-build/python-uv-build.hash | 2 +-
 package/python-uv-build/python-uv-build.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-uv-build/python-uv-build.hash b/package/python-uv-build/python-uv-build.hash
index bd0644a72e..23c6ecffa1 100644
--- a/package/python-uv-build/python-uv-build.hash
+++ b/package/python-uv-build/python-uv-build.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  6b2b5c814e6ecf61a0f3743362d3399fd7578324a1b59b12e242cb6051881dc0  python-uv-build-0.12.23-cargo6.tar.gz
+sha256  42e458d1fb83431e69481a91878e6782c20619ec9d670b1879521725b393b5c7  python-uv-build-0.13.7-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c  LICENSE-MIT
diff --git a/package/python-uv-build/python-uv-build.mk b/package/python-uv-build/python-uv-build.mk
index 1a4cf5a4c5..ddbfdcf982 100644
--- a/package/python-uv-build/python-uv-build.mk
+++ b/package/python-uv-build/python-uv-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UV_BUILD_VERSION = 0.12.23
+PYTHON_UV_BUILD_VERSION = 0.13.7
 PYTHON_UV_BUILD_SOURCE_PYPI = uv_build-$(PYTHON_UV_BUILD_VERSION).tar.gz
-PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/b4/65/672d5c1e7fff2a602b51758cd96c379ea80c0c20d9d10aae5139bfde9877
+PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/73/a5/916905235227c4f074ec0b125a3f2a5ba1839892e64c9be20200c48bdb5c
 PYTHON_UV_BUILD_SITE = $(PYTHON_UV_BUILD_SITE_PYPI)/$(PYTHON_UV_BUILD_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_UV_BUILD_SETUP_TYPE = maturin
 PYTHON_UV_BUILD_LICENSE = MIT or Apache-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
