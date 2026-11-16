Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE92606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ToqjnSx+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA6B40522;
	Mon, 16 Nov 2026 15:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTowqmnb7NaP; Mon, 16 Nov 2026 15:39:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D329B4054A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843565;
	b=hZ6fsZPtTGZ8Y800UmGyiJZSbwUQ32+SDdwNbq/z2Zazw6vLqzJHqEvJnhuSVc65Hz+j
	 k5U1S+FVpHSKKtqfIrl7Bvtm24BunbIf+3fm0/GfrmvorO38SHHlPQpswqMJ7RyKXaetk
	 4ekcqyf0npefPwz+cpIXnF/k+9bV4MHd7rEUirfEy+DDuCY4PndPCQhiWlgvWanYsQi5+
	 HEYIkYNSgbR9bS4zJ0GM95zW0pKUjdTRpyr7N5lYV7uqAISmOlBSH5Ce0cCrSVmRjQtDU
	 4qCZK2gyosFc47Wmzt506jaFDmV/R2Vs4Wn5cRkqlWs2sufmcobrArBrD8ifM3IolDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2/zBcP3wR+1c7aAfPvG0WH4PTaN+t6DrqJ1RTCWQVDY=;
	b=FVTxumvb1DpZP7nTGS4i9ViM1+zhv96kMmNejwsf1ybtkq34sEw8dpRY4Q9Y7YUchBtJ
	 N0/PnA+B3r0v9cIq4tnPvrrlcjZmeDbx6E18a6akBNqsJ30hrkPubuVLed+zUEUUFcJAS
	 dbELi9hJQQFgC7re8kWijjwsHn7xmsI3YzczUuYBU5D2lF8lwyDI9bEE8IHolN/Lnu6TP
	 c2cJ51m+rl1XDplFN/YH5kbsmp1cLySdUiUewHHDOmjHcYaaEVxglKHWOzkOZeoaU9lz7
	 7qVqvUyAbtgIJe9yrZX5EvBQIB3lkWq7fwyogAjyCathwfAqplOhq3/zJ3bv+T3OoRw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843564;
	bh=2/zBcP3wR+1c7aAfPvG0WH4PTaN+t6DrqJ1RTCWQVDY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ToqjnSx+0lVw92Cn3NeMD/JebNkDJQ2X5SHSN70ejdAYNvUzg0PERp9sPtBHl4K80
	 0vJzUqgloaR810Fd/uokWvW3cuTWvzIdv7vMEPJlO3Ox+6bs3AGX2Mqm8Y/k7fiNwP
	 C4+wUUim1kcT4aoSZsn34qI75e1Vjq1QN7spTKRuPUSmm2kfHuBdKtS1XpUdFIcm7O
	 EmK6STsksKHGBJ+o2LcFtyZsZBaNxcfFXk0p+cMi6uu8pRnkITZVBOiGuwN/KfI1wL
	 B6A8z2XyImdWq2BQwp4xS5FJe/YqlBSeSMXe+b9qXmweJjJ3Kq0ijfsx+1LCYhBsQN
	 s5idihbbtqFnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D329B4054A;
	Mon, 16 Nov 2026 15:39:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0756A109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECFE5607EB
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWUlCK0i_3p6 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BA4560816
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BA4560816
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a14so17627565e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843559; x=1795448359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+TTYFg/BZBopsetUH2hzQ+zmXhxTR8IGtOi7HlrzIVU=;
 b=v3vzbi1eDl434aCF/iDauKWCWa+EJPuv1o2TDkOA4JPE9+pZdgsA9Y67OAvwh6OaiH
 b3DxUYMACoLJmbIOs5hU7qh0v8As6j+X25t2tuUtT5cybXGUEKB2uLJ5eBQnM9HRVEbd
 LKjJnQE6N1NS3GnyCqyGgayvUJMd7M29rg4mpKN7HMdIyIi4cKzxJ3uD8wk172H5bFlj
 fhD5NzADXObQ1zQcgzp3Ny6aS3h2jcSCm2KpDTrq1ndW6uY1wCHItokG0y6cqfaZu7HJ
 OEIRta5UQkE86MqQMihP4fJUNQviK4IzKB7H5TNHP8aESAZmSTaSpYUdVED64sTwBQ3V
 uj6w==
X-Gm-Message-State: APuU4Z/id1S5I4tD627wS08nfQyaPtXsrmPUcHWesmU4TxQqpVPQ9JD1
 ts8mgG0FDyOe1196lU1qWOyHX/6+LRkLEW+X7JTwyjdQQfpCZ0WqeZPfia5Tx+AoSRsZj1FU+0W
 tMyCKprg=
X-Gm-Gg: AYBFou2MSMN/PrVWjaK14jRhp4MBbGX+1BzDRHyeveBTsBRslMOlFT8xj8vktv2V09s
 N8yCD2TRhBYs5U2DryaSLmT7tAvYoKBNRm/Eo5opVC7Y1dHZctoNCeTlaf1qhQz6kd42mrM7sdL
 HEf0iGexkEu27pdStOb4Cl0xKJETSiPvSB6ob1g4lF/T8tioOIzlzZp/AvoYKY9xHQhLAiEwxtO
 HHTyYVitMa5zBoR7RMKviKvmizPExKImEcWdTG5T9uW3KNTr8My2pIe21jzq5MY/G7pwjIY2lUB
 A3sKFdLNBLwiJP7reUUcKsHaXKjntciXYlMdzyMfv/inuzruwHBUxtGF46y7O3InCrDgnDlr44r
 XlM7cNrTezOQ44tN0vtgK6HDr3hNHcoOY8aSb1bjt+oToDPOIqUe7bfPmn9PpNdHotLoudP1Ofp
 I4P273pZoyWp0rCemPo329Gwi1rTAKwxEzeDh1j4anrH7CysY4/FWC2Gg3EeXVIurS7un1UaS6g
 w0MQ8dd42Ig+QfuzY8U/SsUUfZNK1LkEAyJWtd3JQICVvu6zTVQrn9VhF94D5tGNGX18esdL3wH
 QbRNjZ00Xxlet0lpYfvuh8nLrfXzUfM=
X-Received: by 2002:a05:600c:4f90:b0:4a2:8c5:5e5 with SMTP id
 5b1f17b1804b1-4bb55a47680mr230563055e9.7.1794843559409; 
 Mon, 16 Nov 2026 07:39:19 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5faf05f8sm179078635e9.10.2026.11.16.07.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:19 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:16 +0100
Message-ID: <20261116153918.725332-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101191738.2091630-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/ffmpeg: fix build on i386
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes build error:
> 
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  libavutil/x86/tx_float.o: warning:
>  relocation in read-only section `.text'
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
> 
> For details see:
> https://bugzilla.redhat.com/show_bug.cgi?id=2428281
> https://src.fedoraproject.org/rpms/ffmpeg/c/786464f23944a2a6e082404b589d1ec7ac568d00?branch=rawhide
> 
> Fixes:
> https://autobuild.buildroot.net/results/c3a/c3ae9a6e6f6c4060feaa1d62dbc2b08da2437f38/
> 
> The oldest build error of this kind dates back to 2024:
> https://autobuild.buildroot.net/results/e66/e665577347857b548f34f9b4fc86f2c573f27282/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/ffmpeg/ffmpeg.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 4ce129132d..6eb3afe277 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -584,6 +584,7 @@ FFMPEG_CONF_OPTS += --cpu="$(GCC_TARGET_ARCH)"
>  endif
>  
>  FFMPEG_CFLAGS = $(TARGET_CFLAGS)
> +FFMPEG_LDFLAGS = $(TARGET_LDFLAGS)
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  FFMPEG_CONF_OPTS += --disable-optimizations
> @@ -599,7 +600,11 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  FFMPEG_CFLAGS += -marm
>  endif
>  
> -FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)"
> +ifeq ($(BR2_i386),y)
> +FFMPEG_LDFLAGS += -Wl,-z,notext
> +endif
> +
> +FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)" LDFLAGS="$(FFMPEG_LDFLAGS)"
>  FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
>  
>  # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
