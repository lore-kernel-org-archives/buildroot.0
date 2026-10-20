Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D91606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p/do7Ad4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9A460728;
	Tue, 20 Oct 2026 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vl7psVoM3H9r; Tue, 20 Oct 2026 19:51:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D88BA6074D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792525914;
	b=WiijOU1pv18lowTYWYHI6e2aLHazcfkexaXjv1m7pGd6A9vtkIhsh8avM4QeDoGAV7u2
	 zc6J34qOaPLvgqud9meVLMTVsT/mh+h3SWd4xHogooHZPXAyDSJ5zJxb/UuUEUgqwvYM6
	 SLbgFCzrfgq6takdOnyzKyOnmNytkbf3YbzhUVe1x/xsZNXYY3/S6j16gLH0pQviHRJOS
	 QntG2zAfVa2R0SBnl99Q1RTg8IPtIqJ2qM2HOkEup9AGV3wFtuB89RzQZKPW0JmhP7gUT
	 nQhjx/apM0wuSMT5U/GzjQ9MTAvxTHTy7CIjvQrbTyWvxPro8/cxHyH+plMgmwBtmkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792525914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=u2H86SKY70QLgC7THMoUuzCGkIMfQdafEF4ba3A/zcE=;
	b=Ahmp3e1hSlo4fXFqvCeOv12pQnl8jK8AbT29DarkeJ6ImPHGuOYOaP0R3ZEeXG+mDp1t
	 IWh9k3y/P8FZAXss9E2RY7+wwD6FSxsgS+rI79cWUbVIy3K+ZxhoE4qzWTWoWY1Ik0u6K
	 Uk17+ZJayxHbcS5V98pfqxLamtzWjOqq0WZsG8Nfs+ZQiMSggW/srmIt6oOXtmHhkBnr3
	 KPbzG4Nov/kVb+aWR/Jh4ay9gsQqS9pfYO3AgjIHQLKULOL7Mr20VdSv140KymI2OMPYL
	 Zuw8rajuoEaOoxMjyomFdsl5Xy5cAoZpZYrmQW+/Vv60J+MzsllXMCt+OBniLgz4osA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792525913;
	bh=u2H86SKY70QLgC7THMoUuzCGkIMfQdafEF4ba3A/zcE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=p/do7Ad4SQZZ9RC8r7iWAyqxzBVfd7qjVquwWUh9BKwaY/UEsBFvTEpZHHhPyNwHY
	 j2expSWyBU4HM0e/rwAezjtAXKbkXHJIzzBtOQo8zHMWXjlYMqGA6u1WaGUpXr5STG
	 eoWimr7pSeccgrcb2wGcPxMoUzIlVj7KMXOnHwHgCCbUqSuvRVOfsoJKcy8BO3sBoz
	 D1YWahwmMAnqeJvXC9SCsrA+R4XhEtQimIuG4WfcFYSLigNEMmKzHkOJxb/Vbebqc2
	 +hNJG/11w6SL63lazGcox2JRgEsMJch3e4dQSiTDts154qm6QrMCP6EVmNlWv3glvs
	 jdNZADTWmcn6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88BA6074D;
	Tue, 20 Oct 2026 19:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FFE5255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8175A407C4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yZN_WcTV1bT for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 19:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87D24407BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792525911;
 b=IFPO3aOwAhtiTPxVjPoVweHYe8QyoJLZNHKsm2SvwQ72jQqbW3ydbU1wvXL5EEUuAJhe
 WYi0iVI6YemBA0PWWIVndI8aYl902A4m50MDF/gIs6mwN3zVzWJtiY+SdaPdUrSiT5Iv6
 bFUVMy5YCbrQQJv8kdoFtxpECCcvBZqEIIpXRcIk9CGWoNkQzRWX8pqp4H1/0CXVX8CoK
 yLxp5zGgbHoIJ7ed7eBXn1bA20bbLZkRseooqS2bDonrWrNLkzApoVtXETcCjqZKeriPt
 iDnKi/fuYox0Cc9zY3y9MLzSTXrTYOfOj9dpLpH+fHFAaPVdjBmXRMKVmCojWcZRCdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792525911;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DahnTcmnxk8wSOIc1jDf2xpKnA8k18YIFM480lvNT1Y=;
 b=dleOF/IzwqQRODg/Lc4HH5Cyi29YS0ja9c4yBY9AKzDCyEmWfKifli81rTX9SmkQQVAt
 EHX3/eoueiBcfBrB6az8PFuHwsScSE58E0DtB9pVdl1Dy4uCJV5K0tSolRbpqCFaV12+R
 mDilWQKedMApihRB0KA1FhN68vFV5ZLjrKyb9d0zuovdzO8nVGplaYWPAbvSNRUIiVPOb
 zrdy5eT6dkV3jsWKy3ZUAnhCRmU5VshOQYqNEsYTYPZNzPdj0bFOkrfMgYRwH25xkNN6C
 jymCLiyy8ahFVVl6dd38++/yogmjhqqTp655qOLXe9Tyx5TmN5NwphWv5+cfBPBsbFg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=aperture.us;
 dkim=pass header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=h9Ys19PM; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87D24407BC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:51:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3ad41b47541so38828a91.1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792525910; x=1793130710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DahnTcmnxk8wSOIc1jDf2xpKnA8k18YIFM480lvNT1Y=;
 b=KXk15sksLjZSc9yb+uQEZFZNpxMYz3XRWVexLXH74/ooKHT4G+5LpgKQAz1vfBIFtw
 i0GgL2N370BnwJlHlJmNMZgTP0mH1awIt0y1XWrrHNiy9M2LYTx5SXSWGngjdUsEdpLV
 JvecyARZCFLIX+K+SHDwPzUixlTgWrgSSJV/ypA0bnh+/1BCbL0CmwW8SZAJgBW6X/HS
 rbNyOqjfM77HvrEla9JiqFoJUxE9fDD7s9M87w5BELRtvJUhqXjm8lWCoZN+pLL5ND3V
 28zT8I8kGFqGh6Xtr4WJ3JHa7ghKAE2vcjupsO/Ep7BWNO8qE2rEkD0EM2VRSq0jwtgj
 U5kA==
X-Gm-Message-State: AFq9FYKmxu7lLtCUhhjz/HEDvYfnrz0wci5xR4JaGY16hzwt5TttZ3r2
 jWwWSl3/GHUSH9uSzfi+KxSwR4kgvY2hahWjj/nUV0UJlNqm1v0eheOfVTsewVQreoMdEaeYlUH
 qtSOjgXQ=
X-Gm-Gg: AYBFou336Hxw85J7aQAMbPyWj8pV34UPtlbfpMpoCN/MJPk7cOBSsmf2coQvy8ONwX6
 5L3LtpXDQZPV/1xHlKE4qoSoiiLFZmY1vmTaa3Y0wxY8ykLrh0bo6SbjRZDEUf3n+SgSjfN6Kk9
 xAn47B8pqxEVbq0SpFj3YOxuSNLv1HlLwdxW9wFbd8ksGz9cQDL4Oursw9q2V/Xnp4ocGnqCG0o
 dT3W5ydkHrrOLB8D6+Cp4+ZsgbDO7z/5pvscIeH85V9iJmJkqRII8qQKronz1Zt47kECsqi1xsq
 C+p6dIg7fdIy0c6jlzhWf3qSpwrVFxaEhHsS97owJ6KT+TmNddv7XfnlTuOOpPYkxlJeqh9mVyX
 WJgY1qeWCP1/fv+3NBmURhz21a75n53UcjsTdD/fzWvfwfTUAPB5Trr9XHIuV5v1Zcqs0pAVlN5
 uZ8Kisjekzyag9IDsBe11Eah1yjHXuE2ocFWamA0czmcxybCXPtsCBovG+GELXa0CbN1xMSujo/
 uxGMtul+vYsbdwh3zm+Z6doG4gbs0r3XZjgbA==
X-Received: by 2002:a17:90b:582d:b0:3ab:b39f:41b9 with SMTP id
 98e67ed59e1d1-3acef13e5d8mr10241911a91.61.1792525909666; 
 Tue, 20 Oct 2026 12:51:49 -0700 (PDT)
Received: from localhost.localdomain ([187.15.93.220])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ad812d3cefsm735659a91.11.2026.10.20.12.51.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 12:51:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:51:45 -0700
Message-ID: <20261020195145.32754-1-christian@aperture.us>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/pkg-golang: use external linking
 on ARM Thumb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On ARMv5, runtime/cgo calls __sync_synchronize, which comes from
libgcc.a. When cgo objects have unresolved symbols, the Go internal
linker loads libgcc.a itself to resolve them. With
BR2_ARM_INSTRUCTIONS_THUMB=y, gcc is built with --with-mode=thumb, so
libgcc.a contains Thumb code, which the internal linker rejects:

  link: R_ARM_THM_CALL, are you using -marm?

Go already passes -marm when it compiles the cgo C sources, so adding
-marm to CGO_CFLAGS does not help. The call from ARM code into Thumb
code must switch the processor to the other instruction set, which the
internal linker cannot do. Force external linking instead: GNU ld can,
by rewriting the call to BLX or routing it through a small stub.

Fixes: https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa

Signed-off-by: Christian Stewart <christian@aperture.us>

---
 package/pkg-golang.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 3e388cb257..cf12dd56b0 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -146,6 +146,17 @@ ifeq ($(BR2_aarch64),y)
 $(2)_EXTLDFLAGS += -fuse-ld=bfd
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS),yy)
+# On ARMv5, runtime/cgo calls helpers such as __sync_synchronize that
+# come from libgcc.a. With BR2_ARM_INSTRUCTIONS_THUMB, libgcc.a is built
+# as Thumb code while Go emits ARM code. A call between the two must
+# switch the processor to the other instruction set, which Go's
+# internal linker cannot do: it aborts on the R_ARM_THM_CALL relocation.
+# The external linker (GNU ld) can, by rewriting the call to BLX or
+# routing it through a small stub, so use it.
+$(2)_LDFLAGS += -linkmode=external
+endif
+
 ifneq ($$($(2)_EXTLDFLAGS),)
 $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
