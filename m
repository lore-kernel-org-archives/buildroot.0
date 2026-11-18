Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D32606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HGK/72nU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052BF81235;
	Wed, 18 Nov 2026 15:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXwxoYjxfw7Q; Wed, 18 Nov 2026 15:41:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F422C81225
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795016469;
	b=FuMtevVTcQhC+IOpKNAo+rqYOXlAPqdd+zHQgkd77ieCw7PNkPiIadMngFMT1+PcWJB0
	 WBsHIODM4wKmJlef2QpRaZkVD6DlBeyBabJ1ElG7xcJW39KO44G8O3UGCYVJZwVMAMkOC
	 sKgn/Oj8VFVIaa0RV49yg7BWIIwCJ/IE8eKgZVodFFiP8BFG0+UN5lneP6Ayed3nBqnWz
	 HZx1EjOYy1GHJw6gr3HUKxe5stj+LqPgVPDEWGloRmpO0iidOS8bAfDC9UNREBzY48WOO
	 5IayfFWviU7UGSLV7QT+YHZbFh0FbUP2fPMdc1oZ5gpD/6qYJhrq3Ad3YTFM22x706Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795016469;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C+Ro7SFfBpZMUt3p4H9rpsDwxiMJADVGZvqvcU54HFw=;
	b=CYTE2pWc+QR4xv4zC2pVKqxo53TTm1+niQttT4wlcL3/1SEplkaXMuIjKq5uooxz1CPl
	 IH4dgE9AHqAFaatQno4c8efq1jfQ6UE2ReXOT7YNxZS3P7VgDaOemkbN3W0Feg/8tpS+w
	 YgQFcVJrKrDTLWOgWgIQPT9UKDkX1Qu+WLwKKvpVeSqReDvB1Xm0B4w3Tl2SVXmpIwKEB
	 SY+QsZP99q/t8k7shGX/aCbjj6paqUV3r1mkAhbB/I8qQq1k6j3KEwj74ErAPugVorWV8
	 ATEtpJw0RFaxjlTZiDocICdwR1b4Elazk3jM+aueiHj7khbWeCmsyOi5924sLbqo9hQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795016469;
	bh=C+Ro7SFfBpZMUt3p4H9rpsDwxiMJADVGZvqvcU54HFw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=HGK/72nUs5uJWvVy3ji0dOVhLH5T/4RvXdh2Aah2UYUVZC6VzzUNlxFAMRprSdXnL
	 GBTgDf2sUVKqhLGuhGppC/2XlUht7+T9329CDLjtw8q+HuupQdjFbF6A859SLm0Rh9
	 oV+LHbBNn267FZOIbpqK8Yi6Fev8C5DyyByCCIdPRg/d6ozlaC89zov27xfZbqxEg5
	 MilR89EGmQAgzLpllV+mCzRxMsVT3/KPvLqROisW/QN/e2R8jq4ZPODfq/RJIegh9m
	 sW2F4fGkrmqQb02Rl6S//WQV9xzn1wGoRQI/1eRG38wK3eS2UmeQ7IMyXnCiEFl94c
	 71JDT9KR1o/ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F422C81225;
	Wed, 18 Nov 2026 15:41:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E18739F8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 15:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7397409F7
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 15:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKizmL2e1i6t for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 15:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE0E0409FE
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE0E0409FE
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 15:41:06 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6b8815693e2so1569345a12.0
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 07:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795016464; x=1795621264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mrkKDtADESY4rSCOyXcS4g0cW0s9KoM7LBpNrfkqvzc=;
 b=GvTgakKZHLrK+QeBSB2A1Vx8Q0ue9jI21sXDh40dUUCXNcSJRmTyk/Jp3FXWuqarEG
 fgAUiN/ZHiqdS4auJxOhsYK8cxtuQcBu60iDvXCkDeVgBUjyZ++F063XzU0o+7McBNvS
 VfonSlNceR+KkBlHEQZwsezSyxGBQQ66521g5VG+81wydaqiZRKrwmTzep+kDMJwLw/a
 PPEBgDBXL9DAkW8VVHtM6an6n4u4UkPv1HDabC6KtzklDfjDiRw0HtosPDbtXKvZiSLO
 QATZH6LYDF+CdT+N/QTvSXptSDdhlO7EFI4N8eeyjP75Ar4mYjv8SJOfXccaBL0MEO2m
 gZJA==
X-Gm-Message-State: APuU4Z+dxbEB3IBb6qmQXTjKKvdGTXMr/RzFFW7v1DmePH/THoes2aDW
 KBoZYSsoy1wnhPm+Xj4CbPAg9jTy+9A7FRZyZJLM9kue1c5Y+Y2S0WuCy8mGdw==
X-Gm-Gg: AYBFou2Pvi+har1+FTixuePcj68enCu61UPgGz1icEfrMowhaQSn3Bhaa8tthjtHpH9
 03DJZ4y9g2u/3xDxtU/EPkBjIWBXsBHWeN+XziKFsVh+3JTgtf2BSHcWzeDRNsbWQSI4HdqbZeN
 bcdI1SQGrH4ZNXLpKxIelulocWDKNDLZkQFF8kjmbbriBZF/XvK6NmNGt+Hr2HaSvhx6NmKreJw
 iE0lUVZGYw02dgB/lRYIcTArckBo05LOHQ7YGuZFZY2Zj9EJJOfKio39LKJm16eZ3aQn9K6F9DK
 bcVheiUXer1vCJ8PlAN+/USjx1u3RSlx1eeVziYPy5v28wZK35LO+Iw251IeQBiu56b91/YilvH
 BNL2pqm98ORE7CxNQMsudwSsOcdg6b7Ajdumqwwj+la/X+NXu2SJs6Dt4vppKtGj69LxFYZFMqB
 /vup6SULOe4HfzBtWXbcYhSp2LCINymSidhPWBzIXx5WhrGMoK13gly5w0IFhNUVDviw2BZ0PGp
 sGQSoI+oR6uM4WWohj19ILAH5v/2JqcQgy+bhZRq8HYaZfkbNfOJcBzx0QwX/ZRofMf/sok5c6M
 TS7BvCdAJPF3R+K9VFg3CRtQgrOqm+oqLZGmDDfLxaekJ4b85oFT4NWwmCtiecOv//7PyFwmGC6
 I5jcciFhU
X-Received: by 2002:a17:907:94d3:b0:c2e:6a4f:a88b with SMTP id
 a640c23a62f3a-c510dc7e08bmr284584766b.0.1795016464065; 
 Wed, 18 Nov 2026 07:41:04 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c51233c4015sm12824066b.23.2026.11.18.07.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 07:41:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 16:41:03 +0100
Message-Id: <20261118154103.1925436-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-tools: perf: fix BPF skeletons
 disabling for kernels <= 6.6
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
Cc: Pieterjan Camerlynck <pieterjanca@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit d2f3cd8cbe33 ("package/linux-tools: perf: explicitly disable
BPF skeletons") passes BUILD_BPF_SKEL=0 to perf. That only disables
the BPF skeletons since linux 6.7, where they are built by default
unless BUILD_BPF_SKEL is set to something else than 1. Up to 6.6, which
includes the 5.10, 5.15, 6.1 and 6.6 LTS series, perf tests
"ifdef BUILD_BPF_SKEL", so any non-empty value, including 0, enables
them. Without clang on the host, the build then fails:

  Makefile.config:671: *** Error: clang too old/not installed. Please install recent clang to build with BUILD_BPF_SKEL.  Stop.

and with clang, the host's clang is used, which is what the commit
above meant to avoid.

As no single value disables the skeletons on all versions, look at
perf's Makefile.config at build time: pass BUILD_BPF_SKEL=0 when it
uses "ifndef BUILD_BPF_SKEL" (6.7 and later), and an empty value
otherwise, which "ifdef" treats as undefined.

This issue has been present since commit d2f3cd8cbe33 ("package/linux-tools:
perf: explicitly disable BPF skeletons"). It therefore affects
2026.11-rc1, 2025.02.x since 2025.02.20 and 2026.08.x since 2026.08.2.

Fixes: d2f3cd8cbe3316484d6953f73db4a31277adcf7d ("package/linux-tools: perf: explicitly disable BPF skeletons")
Reported-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
Suggested-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 45bb2bd7a3..1f76846b3e 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -30,8 +30,15 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
 	NO_RUST=1 \
-	NO_SHELLCHECK=1 \
-	BUILD_BPF_SKEL=0
+	NO_SHELLCHECK=1
+
+# Never build the BPF skeletons, as that would use the host's clang
+# and system headers. Since 6.7, they are built by default unless
+# BUILD_BPF_SKEL=0; until 6.6, they are built whenever BUILD_BPF_SKEL
+# is defined, whatever its value, so it must be empty there.
+PERF_MAKE_FLAGS += \
+	BUILD_BPF_SKEL=$$(grep -qs '^ifndef BUILD_BPF_SKEL' \
+		$(LINUX_DIR)/tools/perf/Makefile.config && echo 0)
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
