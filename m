Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68958606D82A
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mHXqiqDI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C6981E46;
	Fri,  6 Nov 2026 16:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5yuiEFDl7ff; Fri,  6 Nov 2026 16:10:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 712D481E41
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981451;
	b=U9M9ISEDzzkfDLvGjenxmgle/qyvhUR2kulmsJIkwmpnaHxU6GJ/aviLAIkBBOaDVLGX
	 C8hPM6ZkR4xfgqOznOOlc8yWcg5vd9TFGWpiWkGfq9lw9xIh/GBBRSpCDMLhSQuGy1MJg
	 H5Spq6W2tvRYc1982Ps/iJFJC19UKCUGDccFXY+trHtShnRWnYxIkU78rSoOZ5Vv7m96+
	 eGJNXzG+JlT3ibAPl/i0w3z5znTKd1kHMcEom0uAeXhW+HfzRE5TRMCyHepfHzIXvtzBF
	 KZ9qz/7t5jp1T9S1MJZ5nf2D/vTzAsexyV4J5RC7PGGR69V8w0wnVJMjGzFENxFcS1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981451;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=N8+oAGqngzARfQnWmiHefZIUbuKPlaxAm1OUYYg8JXM=;
	b=NS9vHsO/+WPkJpuMqJfhKFyswLOKmf/mKoKgvHrxt+IG/UKaMnSlwFvUQlR6m0UVZgTz
	 k0g/DOBRlIPNUuI5+BolvwGzB+s8v9QyD1G9+5ArMOud3s/rf1jG7xUL1JR8GtDd/kMeB
	 77vEcWT4D+Jcuq0/+clgYK+dn44pXJPZx3BmIiquLD226saK6wkYUsP2KmB5CgEDXow1w
	 YmdtVqqu6O0itXxO0+v07rcTM2AwSIHgCVUOHZ5jTngfHl6hzsl2egNFTK9Wxy6hgaFEe
	 g8864Wrxx/lDxOz6JVUbIKW+XdmWFxp4cEn/jjuGvySwsnZTgK620eInGBlnA7UPCOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981451;
	bh=N8+oAGqngzARfQnWmiHefZIUbuKPlaxAm1OUYYg8JXM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mHXqiqDISGF36DrQyGNuQDFbnb90uezw1ij5O/NEnSjg9Q8utcY6Kld+nfyg32+cN
	 aZw3kGoVPP3ma2m5oyy8MmgioHdFXBSrj/JdYxnYExwFDt8OfzZu0Nk210lCN1OfFB
	 QXDkKJj3fsiK7f7A4kI4RV8omGbsIbLdLKPcw6Mi6MjcrugFIETqEpZ9U+IGYQZUDv
	 7mEo7smvfu8nL/eGrwwGWtT6fWcFt0XQ6du4ofAzF6VDTCQUp5akFLzofL56EqZrTh
	 bFdkK+5wNDTQUKOiG25a+PDQ3ndF/PutSvG4DSZl7J1y1XpAD/89LCeSF2S/Btn4yk
	 HGei3G+YQ00Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 712D481E41;
	Fri,  6 Nov 2026 16:10:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93E722E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85AC040911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_jAnqYuvQxb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 93A2F4090B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93A2F4090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so7867485e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981447; x=1794586247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZnZkD0i9NPTys0OH+YVVUAyARcKAAhKs4wSDqtKhulQ=;
 b=hoCDeF6JsU64boGCeM+f0O8XR0MxF18OKZ7/busDHkZG4tphdu9xkNxJg07nksFj02
 qBDGEMNhXBvS7/JBozXGIrKhW835L0opymRpKlptV+gB+XBz+Eoeebgy0JujE0WCIkaN
 YJ8l83FpRzeaYBxV6zB1GMpOhtT5sQ2Ur4XoEnfnJStag+A9emtxnA0X5Y7IlH/faYKN
 0BtYLsZSxO0/CBpMkGsTsV48IoMGFeViumlDzUV9HAEw2VNBGRLehfmyum5BZQmwM5MJ
 wVoahj6NwzqSImhBADHlFlAYHgDwWvG0HznGITeHVPt+HZdC2NLn+QL87C8OwNIgXeV9
 j4cA==
X-Gm-Message-State: APuU4Z+HckCyIls2TB+PC1XEQQs/Nmr8OTOsimBJE+JXcvbwVevs4p5d
 IqGDxZ1zA8kurLI6Q4FlToCw4oEDwQX9s+PY6q2f3O+GrBo1a8Qc76ZPAQg87Du6TPtx3EUdTaQ
 H3F4bAk4=
X-Gm-Gg: AYBFou1Bm2aLf1WYxLER9CKSAXivXCc6LwYFiN427UVcAThrdw/KgAgo0fJreFiV8QT
 t1DzyrJzg2RDXRez5jMCdU6/Ym0JNQJoB+weH4AjRJbC9rReTeIVac0WU9HTjGJOMmwvuPGImZd
 V2f+2ZvhZYMVrhvGRRIgmUeGCWp23at2CMcQFnu0CTX3Gj2SxsMyTI93+R0kDfUDaoORHV2nSHb
 iSTBEtt3QPBpWUiNhj9sA0sd8g6w7azRqi2pE0MmgH/R9EdKK1uJyS2jvO4fY/6pz1ku3RgDOl6
 pTKnhutyM5YPfbSKIqiH6EgFP0eLMCLazd1GKCsS0EC0xDSNr8VqfIf3HMhTO+13Z1CoXUz+M/m
 lIDre+OUCBasnL2PudLCA2C7TfkT4540YRDmF83JWHw660G7g093vgv2XI+59y7IUmjR1bVuMls
 c3sfZQLKTHyjqfxrmTr8qQJyir1JTAHbGKI3h8t9TAX7a7fWqsek/s7o5Zol1ML3UeUmRapOdUK
 VNHBT7E/LlNFBV7pqoYf5jolAYyzsUjhzb6rs1n6BtUlSkVf5Tp6ONnqxCh6HFSjWTi/qiH2kLL
 I+/QqH9PbkbCM+pBsepb9B8LxEi+FRo=
X-Received: by 2002:a05:600c:310f:b0:4a2:18c4:61a5 with SMTP id
 5b1f17b1804b1-4b6dea69297mr48462315e9.6.1793981447042; 
 Fri, 06 Nov 2026 08:10:47 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e2029209sm77884845e9.11.2026.11.06.08.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:46 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:43 +0100
Message-ID: <20261106161045.607793-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030222648.270223-1-yegorslists@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/linux-tools: perf: explicitly
 disable BPF skeletons
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> perf builds its BPF skeletons by default whenever libelf, zlib, libbpf
> and openssl support are enabled and a clang >= 12.0.1 is found in the
> PATH. That clang is the host's one, and it compiles the BPF programs
> against the host's system headers, so the build fails (here with
> linux 7.2.6 on ARM and Ubuntu's clang 21.1.8):
> 
> /usr/include/linux/ioctl.h:5:10: fatal error: 'asm/ioctl.h' file not found
> make[6]: *** [.../tools/perf/bpf_skel.mak:87: .../tools/perf/util/bpf_skel/.tmp/bpf_prog_profiler.bpf.o] Error 1
> 
> Without clang on the host, perf silently disables them, so whether the
> build works depends on the build machine.
> 
> The perf tool does not depend on host-clang, so always pass
> BUILD_BPF_SKEL=0 rather than let the host's clang be picked up.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/linux-tools/linux-tool-perf.mk.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 3271fd5683..45bb2bd7a3 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -30,7 +30,8 @@ PERF_MAKE_FLAGS = \
>  	NO_LIBPYTHON=1 \
>  	NO_LIBBIONIC=1 \
>  	NO_RUST=1 \
> -	NO_SHELLCHECK=1
> +	NO_SHELLCHECK=1 \
> +	BUILD_BPF_SKEL=0
>  
>  # We need to pass an argument to ld for setting the emulation when
>  # building for MIPS architecture, otherwise the default one will always
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
