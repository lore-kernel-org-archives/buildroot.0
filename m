Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C829D606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cJXzpJr7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A48nAJbM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6F181224;
	Wed, 11 Nov 2026 17:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKqBtIVk2tMG; Wed, 11 Nov 2026 17:31:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 97AA1811D4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794418312;
	b=SPmepRbVU/AtMxb6bBn8mvXBEstQE/ipRSsSBPIMib+9A7ZbMBq92GooYlAyztEyDA2m
	 1TKGZTovK6wivmyzf4bhcijVIVeNHu3+n6mxRdtpeuJuRA5OuOh32YrEoEMqqYMeFnfAo
	 FqFIV6ruphXNPFtgl2asm0EULH/sdYcJJ5sl30pNxdK+VZFd6t311Js0/1No8vKulKUIs
	 EhAcBk6HsIeDM6GnPqc3tF6KGN04BLVWEZI+NyekISf1V8KOYm4kxS4cUDufTYVyb/9kF
	 1p0icz+BNsVe3v6MvUyOUGWQVrTYxeFW6SI9tb1GEWxl2pMxUcyKbAkTRuS9vGMEDkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794418312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R66EzQH77j3Tp0oDct4zUmNuj4wq/5Qm2dYlKIDBems=;
	b=BuSxUcwtuAgx3p2BWAybkjMK8iLJtph5zptxT/aohGN5e3JYNYZ63ISei/9Dq6km6snB
	 6gZOnPiK9aige45rNt5CfcT7Nx3rFmuxJycFQYOoxJaCtL+cviLBiP44an9OrgrDip5cn
	 nYMLzBD2Qc6o3MUpdSHa6WLLEzmW6QNA+8mW7mVa82gBhwpWFOJTDpkDBth6EywO1F3i6
	 sk9PhbVbBioISh1ei6AYX5BSTMzADD1juvLLHKQGt99kUqx1UBxFWGDw/TkL290IQArDU
	 ylvM4sBoZBXbwPDJrO2ShtsNLt2uY0CkL8+xUgdNGQT24cptUZ/DDZDojn+3m54KiRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794418312;
	bh=R66EzQH77j3Tp0oDct4zUmNuj4wq/5Qm2dYlKIDBems=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cJXzpJr7zvu+xOIm+sVcCR/+SWaKHR3W8Kmldj9NJTeNUI6/FaKnvB3y2kNiPbxX+
	 fDIWVQCggB+2ENQ5oLPYeXYSJfzd5FaGeivhb1Dr3AhzlF/k55eLa2r1UXpu9sFm5m
	 b0rCof0rhUOyXnFcPRgznEonYkdB4jlvbczWiqMPbAcjLwtiLYgaux+Fm4eJwYXKly
	 NGkkJIF+4Hqhz5oxAA6clqKQIuvwbdtyGr+DWQD/aVFzyW+MGoUaisw766k53JU0NH
	 3jnOyykuBLUYN9dF/P5sA8rJkmYd5MQjkCCMItte89vPLufP2zIPWoBeeVcV4caZNG
	 rcteaSTLiuT9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97AA1811D4;
	Wed, 11 Nov 2026 17:31:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E760A335
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 17:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4C49606E1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 17:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOfqSrFkNHSg for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 17:31:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9EAC16060E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=A48nAJbM
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EAC16060E
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 17:31:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4b4571ff080so38144715e9.1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794418307; x=1795023107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7iIdaRR5LVwJlx+gjf/g2LoP/1XIONUg+3t/UBbgZaY=;
 b=A48nAJbMrrn0PWo14D7+pyMILYThPFHtP3b+f2dLy5ctkFImdJhT7ERmOayQ7xWEFF
 HPHQ1u572OMNUTCVYRBqt928S8Ab9qh75ENnb2EEiMlJQmmaZ9+m3NieVY5vQk2nX44Y
 Ihs+m5FrHapTUCabTdPjgil1/KwxTulxQJcc5RXIzQ2DyOkBdG/ESO2+MQHDFLXqOvYV
 6wyr0LGuaFfq+A7paCmRLfEX4cM9GUfWSZJkK3FppYBwWJ2iQptlCt/jG46PfB2BvKBr
 CK/kHiLx3YRIuH+pHu2L/oq1unJgpMZlCfnMdtcDa5JPe5L2QjH2HG3FhqVtm2Pu8BqZ
 fT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794418307; x=1795023107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7iIdaRR5LVwJlx+gjf/g2LoP/1XIONUg+3t/UBbgZaY=;
 b=HYq7A9OsJJxnZfUgqM5HdLvOM6IXS8LNmDImBkmmVoE1oI2dDxh/2VI8qBr6iCWGkP
 1gCURGaS/bp4gYQon7v3IqyNlxAysgLVeSpUJUpDTqGmj9+k23nXTTT+IxudTIIYqQQm
 vOHNlGeQZQ9VtLbgVZsYzPaZHqxhDP2oA/EYmZQXkZnZIbbBRt09K3f2FYlqkeOYayrc
 ldBVenWNwUaXUdI2C83CuaD/o5LeTEgw7SHHFN0/1Q/k9OhzImnISJwPbuWhjAYiSIpf
 Zw/yrWwiMkS2oWJ8W+TAwZfnGB4R4JBLmDY9nTdlU1YQ87bPN1lCNlWZaracR4jHVAi7
 8KDA==
X-Gm-Message-State: APuU4Z/CyxBU5Q8nmmkjFwq87myAv1yXtHbxTjkZ8JuxdMdB5sF2H2Ap
 FtY9qGDy8P2RS/kY3JauEX0Ij3RUnJeV0qgHJnQOjgAAn5TFgN+xx16C1ITD
X-Gm-Gg: AYBFou0SGaoYivKtxOqNwYPW64PYlLQ9DJ9LERenaRaau1GUmR6Sg4dhuOK73+hAxX6
 hKPTjJX3EBfBVTkFbGU2lqk7joqZMmWt3yO6htnN9U93eTqQksp7mxHDhTmcwQldoj8fpNrNSR6
 GXow8QV09upaZbfNix7vyEcslAk5epjfMFJBgPaV1nZ1u7F/gVEaEzvnfT3GDySXjaaeCPfMwdC
 UIGNWQAl+0A9Q/yNwT1jTJzE7B7xVrOo+/CVl5WwO6dyTpeYkKdK1ozujDrw9G7vq5hmvSCi46o
 BnyIc/EcHxOz+qKdc/vcH3EzTPujT3Te3gkOvlqzqI8zWoeMJCXkdtvXtDRy/E8kox4u/hor4hJ
 U4DeCfQZPPDyNRU4L1P4QdBFPy7oLzJsFnbAhL2ma73hVQoacV4ZAwxWaZZ44WTZ84Fwyrt0tXu
 vqPXRmMhMxYoXyXEDimPpufTnWbPL2wtAqfo2qfKsYCzgyCMrGohAFKi5I5YtTDvJbByDSpkhrd
 gBhTUnjvEGLTyyc9cyLq3AdjtduCEgky99HS0kO7Jwr0mKUMce53K62H9arsW4v3mtxIOx80mEQ
 wGo6Ynlq8jYrdfbT7Z81NSxxYFSG9MTM8T8PFMgCF/+LXSDUAQA=
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id
 5b1f17b1804b1-4ba093ab883mr59149565e9.31.1794418306889; 
 Wed, 11 Nov 2026 09:31:46 -0800 (PST)
Received: from devhost1 (77-236-0-65.static.play.pl. [77.236.0.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08ddbe68sm122681095e9.0.2026.11.11.09.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 09:31:46 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed, 11 Nov 2026 18:30:53 +0100
Message-ID: <20261111173143.6336-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zellij: drop explicit architecture
 dependencies
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The strict architecture limitation was caused by the cranelift code
generator, which is part of wasmtime.

Zellij 0.44.0 migrated from wasmtime to wasmi [1], so cranelift is no
longer used. This allows relaxing the architecture dependencies and
building the package on more architectures.

However, zellij unconditionally uses AtomicU64, so add a dependency on
BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_U64.

Tested with test-pkg, which shows that the package can now be built for
more targets:

Before:
  32 builds, 26 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

After:
  32 builds, 20 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

[1] https://github.com/zellij-org/zellij/pull/4449

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/zellij/Config.in b/package/zellij/Config.in
index 7de6074435..97408f5f84 100644
--- a/package/zellij/Config.in
+++ b/package/zellij/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_ZELLIJ
 	bool "zellij"
-	# Zellij uses the cranelift crate which has architecure
-	# dependencies. Specify them explicitly. See details here:
-	# https://docs.rs/cranelift-codegen/0.122.0/cranelift_codegen/
-	depends on BR2_x86_64 || BR2_x86_i686 || BR2_aarch64
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# zellij unconditionally uses AtomicU64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_U64
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  An advanced terminal multiplexer with batteries included.
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
