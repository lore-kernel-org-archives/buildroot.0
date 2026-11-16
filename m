Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20762606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E/EI01Zs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7FF040733;
	Mon, 16 Nov 2026 15:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdZJ1kIKbNND; Mon, 16 Nov 2026 15:39:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1164A4075C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843545;
	b=biG6gFMX18XullwUP/MkpAPjPBSWq6GOlRHMTGrRAF9Hs5x8y3DQF6ykDc3JIJw5/Cbk
	 VTEZz7uy7uwPgvOT7c3Zl8MHO/4++Eq2rp9CrlvK+bZF78GE2tjtizRt41snAq/OjyAkw
	 m5upmMhfAnAPDR7N8H2LK9e56K6RyUviJ4OTdej7AIKdP2i9rvipTXPDKtUmpH3In59pa
	 6sb59pMD6kQ0jmborXBVeo8DIfUgREwPj/+ZuUlwBfkw+CbwOjkj4uahScXy3COOTiQLe
	 jo1BGpjI64b3RE0WuJ+pNSlcDz1tr7WfBgUq4VpC5rBmFqpWzxAZEOkez95GU2I14yQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y99ar7acs9mWwF6vqrtUx6SHz/AT+fbqLV0BU6+yxXA=;
	b=lJbWoOiRck4T0gtG61sCEuBOtMT7Ok+XG84FtlMSxZh+T81HH6uFx0CKY90ML8sznmUI
	 iPjpYrFt183UlbfGIZJeDUlZq2aGQw0ooTDDrMD4J0kETOzFi8tKJtoPM3e3eyDsH1nvd
	 iNmA9SnuFUt+nLO2oHSCocib5m1Bhg8NmIRJywL/BIPg4kP72IdPLYgpZ51EFhI5uMYd9
	 3LwEAt1vXIUAD5NonNnYE+qkH2eaYuEouZpv9DIokXU3vonnk4WOZe+Hh1zjtoRAEvd5x
	 LqspugMU6eo3uBzm4pZHirGnQ8j9LoHrrapqL6iZu2M9dpyQHTcCfXLXo3Uc+5L93Og==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843545;
	bh=y99ar7acs9mWwF6vqrtUx6SHz/AT+fbqLV0BU6+yxXA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E/EI01Zsdu4l87eD13D65gO0cEFa/Zn0lEjSudoCkcpTBSDQua5Z1WqACwxRi10vK
	 TTvZFszAg/yug/rfpomYlqpbe5AOEcUX/sJvD0p5e16Sxu94qvQeIJZ9YSHfb8/8QD
	 Kf7hPoJRHKQ436vZhv5rZz/lT/ZdLLb2YlPZMbNG5NHpO7uK7bXlB/CyYD2pjTFiki
	 Anb+okjdIyPsd/qs7FuibSRNJTNAUZh5Rf05uFbDPEj1m3+HQK2Yh8KCFoASPt5D0W
	 qXzi8MEjfeV0K1bnNhEVhVhxaPjJxdwfcMFF9hBOjvu3JXAe8EuwXcbDdoohDCiPxv
	 +a9cwqgd38DrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1164A4075C;
	Mon, 16 Nov 2026 15:39:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BAFC2FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81E7840282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgKSsu6FWbEV for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5EBD94009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EBD94009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so23149035e9.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843540; x=1795448340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qebL+aB/lRVS1i5HNL2QpbLOtAudssFbjc+pLrG7Y6w=;
 b=g8Gl/ilZ6WA6K7nAGY3GPMTFPnh8t9Wb8jswu3AL/qQX3jMsuOWciui5TbN6AgkMoI
 PkeCQlStQU+3XZ2QkTCB85c1jWMSiKu3fdWIQNFo1JNzewGLIMfZD34cuG9F3q59eOxq
 vmmqzf2zg0SY7lD4sXUszOYzBN1S0XhqclgIQWRzftMBvpGUIfKmwu7mQISpOfxXUwSC
 wDlpN0khU7wy7N0c0YvWLgdZ4AuMAHIQV2wms7XICAOynREa9g9wGsqQifH5orvnrOPv
 kUsoZ5A8YdirLm51cFI75ApDhJiGfI+AWiNgTQwYV5CkoLAGbe21lTp6rEeKPVe/TL/t
 SUrA==
X-Gm-Message-State: APuU4Z+KGuPPDznqztw7zzGYoB1u3A3aEN1fSbLOM5EANbQWkQBJsXQL
 UBHQKOusWA8VsHJzRf2k3UOo8NnTlGrKN7hYjfP4DmG05+qFaWX2lJ1UrPPe9HZy+Ixcp/ZjLHe
 94Qw1wOM=
X-Gm-Gg: AYBFou2095rV6PypGofABokOaFlCR06ymqpo5K5LEJxuqlE2PUFrJj/YLHfFCqfUrT5
 l1QvTkWbYR4H798pwTGdNucaWMfV7EdiIjvKvYpldYuPWXpbgCbmG3LxNkFUaZSEzlc6y08bFHS
 69N1S9P2gsJzLA/2yhvOpwCXQywTfL/XtxBMwZ7ZRhbqaxN5lPZAa8n65/hpbR9+6rd8CD4kFqZ
 vw6XSzxBREDFFCemnwtOpGvh8456Yfr5bsTww8HuuE7hwCZb3ARU6+8G5XxIWuuwuj0Zf558Gwo
 SWSkj7/FDiQ3rTXW744SRR3b/m2DsbpdwrPtKHOi+3UGtglKHo5k5/xTFAn+KY2mEbbiTMhCj4U
 i5YQXNwhMkcv6g8/+BIDJHKTxbNCOUeGYVSEaGoWKEgElnrLzzR3vAveN5iz8eXS6QX0ilrfpa0
 B1Fo64/gH8Acd3lepOpZySVTcVliT/LQ62vdYsvc/qPXOGQhhLbbQtWasl6O0lOLeyMl+FN0Ovp
 h1HW36uqap/gUFcM6A4BmeRQI75nNTDZa8zafaxpTsfS4IfrXFmJwhMDwESQ0jWSUeqMv3LhtRM
 uBRC0f9ZhrEYIwa8TzZjr6bytQtjwVI=
X-Received: by 2002:a05:600d:82c7:b0:4bb:69f2:87f7 with SMTP id
 5b1f17b1804b1-4bb69f28901mr125786135e9.18.1794843539916; 
 Mon, 16 Nov 2026 07:38:59 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5671059bsm177560475e9.1.2026.11.16.07.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:38:59 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:38:56 +0100
Message-ID: <20261116153858.725095-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027055612.16492-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/x265: fix build on i386
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes build error:
> 
> [100%] Linking CXX shared library libx265.so
> /home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
> common/CMakeFiles/common.dir/x86/pixel-a.asm.o: warning:
>  relocation in read-only section `.text'
> /home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
> read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
> 
> For details see:
> https://bugzilla.redhat.com/show_bug.cgi?id=2428281
> https://github.com/rpmfusion/x265/commit/acff0da237beea2c1229d743a2eaa16c839e00b3
> 
> Fixes:
> https://autobuild.buildroot.net/results/6ab/6ab6ce2e82a4ccd9ca58b2233a3d496eff697cdc/
> 
> The oldest build error of this kind dates back to 2024:
> https://autobuild.buildroot.net/results/5a0/5a0040e1a5e352fdc7a37ac268083466ad80404b/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v2: split i386 fix from version bump
> 
>  package/x265/x265.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/x265/x265.mk b/package/x265/x265.mk
> index ad4285fb16..fdbdfc2cfd 100644
> --- a/package/x265/x265.mk
> +++ b/package/x265/x265.mk
> @@ -33,6 +33,10 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
>  X265_DEPENDENCIES += host-nasm
>  endif
>  
> +ifeq ($(BR2_i386),y)
> +X265_CONF_OPTS += -DEXTRA_LINK_FLAGS=-Wl,-z,notext
> +endif
> +
>  # disable altivec, it has build issues
>  # https://bitbucket.org/multicoreware/x265/issues/320/
>  ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
