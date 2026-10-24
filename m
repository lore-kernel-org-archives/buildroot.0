Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qogYuF5H
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25521406A0;
	Sat, 24 Oct 2026 22:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNaL2kjBWAoS; Sat, 24 Oct 2026 22:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BCF1340F3B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792879763;
	b=smuZx4ypsn+btesOtx30WDIKctu/oFZBzXfe/Mj8cLjJz3uVvK6lAZVXgPAahjllHXxn
	 SQrVSjA2gAFNcKLtozs4tWtejOvGlfqSnTdrhC1PnG5rBh9YQFDF2QdQL25YAKfSkFjei
	 llaM9d+Wb8FPXw9JBOTFXmauDGMcVwfWLGus9dCbaex7rQ80rNUZa/BkDH3ClgaSYztUk
	 BW6mZ+Lzw3SPzOVuJaKgcaEZ24moocUfpxfbsLThxCaeeQwvU5w1C2oupHM/8/MxQJJbS
	 9v6lu/ERO3iSK9hncfJfl+dhNfn8lMO9jrCLL8GJEipGL6UWrd2uEdA/nZqRCR2nHkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792879763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p2W3yle9do8Etk4hSl7MgzROfbzhK1C3Cd8Sfgd1eBE=;
	b=K6DT2vSVuUfJ0lGwOKqAHNJwKOrAGQNvMbUHL8HCc8F7zsRD0P+pHoSwQ2gktYTjbtOa
	 KZLU9HXLJmsilr7FmnW3fQZxTwrrjd00wb9Kin53xNOhsBkQBe7IUPzkO8zIhuhv3YvbA
	 6dEPUHoyIjep8gk85lvEB33tKIMI2k1PWXhQJUbqTSDDafuqkRXTJ9hHA0v2QHQz0Ylmq
	 XNjyu7NbAml9LI3p2tdTxugAKWZCiX66pmkIYaldYDpfbZvCcihAU3GGtLWm2Xj4AuSGp
	 gF/z1Jh8xfI80+Q08WTJrQzkMOf6TBlv/aiI55tz2tv9lRKErlddHbUKyhDc/cQ+xjg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792879762;
	bh=p2W3yle9do8Etk4hSl7MgzROfbzhK1C3Cd8Sfgd1eBE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=qogYuF5HugRswO2dwTG5ayWP3CVd/RqIU/DAWYjt3yzJZKS5fCHubCqI6BvhuqZwH
	 aNaoQU0obSPX9xL9peGmm8PmOvGah0EDztgh4i7IjkllKER7/yB7Bl6dgXAzce4FhD
	 kdBEcbuwM79/jcwrJGdCTWtYv62Vt/SFJaGCL3XSfzQZMmKZeeWtrDVPhsREo4fadC
	 qBYQk9rQbYl9DChS8P9S+raL62XU1m+eWyVRaEqhWYDBcLNvWrOfhSkeWLNE5/JY1W
	 Gvb5VGNEDlVuHqhPnrk/sBxgbPR1z429uQVjqXEnSitA/59vKwkMPFaL2xc+Hq//HW
	 GkhkJEf4nniKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF1340F3B;
	Sat, 24 Oct 2026 22:09:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A34B7356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 898BA406F4
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gq_U6pB1NT0B for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 22:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6ACE240670
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792879744;
 b=amT+bJ9gnPEZeLC4ScRumaDhsFiYZOUCIVHeC7MVu81S+ABMH7Gediv8hZhhhzLo2B93
 jhpGfg2Fmw1J/dYSxRK3+Y/s6QxSW/0KfqBB6ILZKRFPOY9Lp98mmzGccMadBcMAFwXDx
 xgrluJfUMxgfkLE1B2BuY65fFQnVcJndvZhSUm7Bho2Aqgst2jJFV1N/qzX/irWT/3xIw
 LvvLNm9H1zx0a8tqwZy7WbgvvyQgEKD21+JK9MaDw1Tug2ID3iDYakOPPLhUh3ExAZsnP
 4ZVf2tkYPxuNFMT8byxKxn6wINmKzTVCszjoiWH5KOMQfJEkLO+Sjvvicj2GG+bWegg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792879744;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=VCNpf6pmuxRUrhIWdW0eUdeISLr1KxGKovQT+a7z1SU=;
 b=TRkjhOwxenDdYbt3wNW2FCWo2AGy9GG2G3PnuQ8eWvNrt4b2W6SQPVWLl7OyE2mQ1QRJ
 Kqmj5fEe18rM2d1Ocr3Dxtr0vhkw4lKWaHGBUX0QT2R4DLiqIGjXNQFZ2qpnsMxVB+IgA
 bQX0LSIBp4pK5qiuDR/6OFQEefVj/QnBuQtA5Pr4oO2rNX50iYfyf8JsO3uo2yd/Kg6/Y
 WCD1QQaFgb0m1kKdQFUUqansKQiXkB/spRzNnQLDspM92D2kMCiSMNwTltZ+CFyy2AKY2
 rhnWs60ThSSjH+0EQ75V0nCOGQvyR3mwFeYKHeIqv6xKX+r8d8EA2laJADrupNVNkSg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=cg8whz52; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::532"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ACE240670
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:09:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6b1b13e09ffso2591841a12.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792879742; x=1793484542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VCNpf6pmuxRUrhIWdW0eUdeISLr1KxGKovQT+a7z1SU=;
 b=w4Qaetsb2ZD6njBCJWwpsUmT5SsrdiurzcVE3+yroCZlMheeMWbJtrxB3zzvSejcYj
 eraUzFImSbEc2iKl4+iGaYIDC059D+J/WRKRPoDNNzL2eOHZss8D/lY1CmJYK2xqLZcx
 580Tue+njoYYHsZSAnM5Bo6+KIqCaORH0s7Whi668G++3so+7r2+famF7mt6dIUhqTRk
 VcLdJ+yOOfVXiUpukYPtwr2N3yMr5B1309ki1PVZqknBA+T7vli8JYuFgDknccFBUHRw
 I561XFMhPRqs3LrVGLAUQ6Eq5z7k7w8fzofrm6Y9UOZcYaaPWTxpxd8HddG3aAA2pfsF
 SU1w==
X-Gm-Message-State: AFq9FYJTF9f38mFIFP4YcCndGMGwmV8V91pnHMAd5IzBs1iOviGEW0LK
 1BmCGiW6h1tYvcaWUCGWgREoLisKjen98TyQ5gPB+N6CGyQposFfTotGkGRZrw==
X-Gm-Gg: AYBFou2KC8CVO1iB67aOMEuuW0yUXWAwWge1AD9zXzWmhiICq/Roh69hPCswLOn9yhi
 9GclfxOUROqO2lqBdiIGgXQa3rbhTrgCjNYmlB8dyhtrhYH2opU1qdpMh36IfMhlyLlu+H2N8KH
 MeKMqaQsAmjjnZllEkbOE+qIma47FtAL4Lov+DWgmMMRmisYzkSzNXJn0LgA+JJKOvhqykcv9lS
 kdr+NgZpFqTWk7Iw3vBYdTstEOrWYxbuUcFKeZ8o2m1KTM8LWjUpvfVWnRaHV9mPMsBPgQAPLhD
 5fOIBZJNka5jN9fdko8MZ7lHNKNjTjlSFe65z2dgE3KTRkiln15Hmlg8IyPwtAG5XqqtyZ8E2vP
 XwoZTl5kijQ061FttQ0aTFXNAc3Fkp2O8gOSCrjehwswx6rO67f/NFnC6wOzjYffuvCwtwdWtmu
 15BTrz+Bazph+mGRYPzSaeuDLPRdTgX94vEv1qPU+35v4/rgPIKj+P+5sJN/vOqRZNoeChBNKBQ
 S21cYt3mMuKfScCfibjZbaKxuEzlJVMjkrwtLkHK5Hn+2n7iLlyr3R1xIVN1lS6h4Fs7V4BcYVq
 eglgNkXjKqc2mFwntdyiVePdqzog3QhpuQM=
X-Received: by 2002:a05:6402:e0d:b0:6b4:20bc:f94 with SMTP id
 4fb4d7f45d1cf-6b442fd5c0emr3641197a12.19.1792879741877; 
 Sat, 24 Oct 2026 15:09:01 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b45ef2291fsm28849a12.18.2026.10.24.15.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 15:09:01 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2026 00:09:00 +0200
Message-Id: <20261024220900.1594745-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <at0gCbhfnKkq6NtS@windsurf>
References: <20261024161704.4144810-1-yegorslists@googlemail.com>
 <at0gCbhfnKkq6NtS@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ebtables: fix arm64 build with
 kernel headers >= 7.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

On Sat, Oct 24, 2026 at 11:16:38PM +0200, Thomas Petazzoni wrote:
> And is the "opposite" still working, i.e building with really old
> kernel headers? Maybe they lack something that the bundled copy had,
> and it was the reason for this bundled copy in the first place?

Yes, it still builds. I tested ebtables with this patch against the
oldest kernel headers Buildroot can use:

- x86_64, uClibc-ng, kernel headers 3.0.101
- x86_64, glibc, kernel headers 3.2.102 (the minimum for glibc)

Both build fine without the bundled linux/types.h.

The bundled copy wasn't added because old headers lacked something:
it came with upstream commit f4bdc80 ("Add kernel headers needed from
v3.16", 2015), which bundled the netfilter_bridge headers removed from
newer kernels (e.g. ebt_ulog.h), plus filter.h and types.h "to avoid
future problems with changes in the kernel headers". The remaining
bundled headers only need __be16 and __be32 from linux/types.h, which
the kernel exports to userspace since at least 3.0.

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
