Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2485D606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YIH5V2AX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F352540D06;
	Fri, 30 Oct 2026 15:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZqkEqpVCZdv; Fri, 30 Oct 2026 15:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CAF6440CC4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374090;
	b=NAXHjir7P8SdmsR+ZLLWh9UbiJRoz8fZ2GbmsgTX55oAhXimkEFR+Q3dXWiCo/RfBKYP
	 y79GIFwM8z/ehItKbFWMF8fcs1aR6QcVvX+BNswDZn5ASTvSQLmw4vl9iudkBOMs+KI0e
	 LhUkzinWFD01ih0x+3J4M3Cg8MbH7UhpQQnQlQHnXEgytVoss4puK3Y2qA9GCR1ahtTtE
	 1EPkzT2XrPQiNu9mBQyIziCZE4RJTgXd0m+ZApqzZAM3MTq7rSwa7UebwJxiEw4X7Gba8
	 mW4zotYr3PxbYxcL0dhJU60Y+ErEZuXAEB5cPbJGjA4xYL6IJxGxTiOuzQdsq+fZMng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RXRFsohuEtcKASWhZ5g7S96bg2na4wHcuIyctMt8G7M=;
	b=snsTxpEgC3QVw7VNrnHUKbvEjgyO0Pfdy9Drl+aK2FMlIFrnWQgSLJqTuhuSmcHTY1mB
	 HTd5dlxsT/g8rh7BtUt+hhhtExhk4oUoI95GQ2Ruen543AGKbhDdLuaG3iAwg5lZRsKDQ
	 0v6RDRs9lfCnDWLHF2wWCY05XZJJ4JbuKsSI2oddYiL9Sr83JcymeA04IMVyY5jI9nLXn
	 mgZMR2z/l/q3UJDcRfe5DM8mFNsrHBLJb9p2LRE37jOKlFOMKxW1H9etHCJK5k8TnReBj
	 ilyYdYDxGvoNfNqd7GIdai2PB5vj1Mmq1zBFVT5iPZ7xvZuhT1Er2EQSLcm4dWgjG0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374090;
	bh=RXRFsohuEtcKASWhZ5g7S96bg2na4wHcuIyctMt8G7M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YIH5V2AX+XswBhMh5WoiFBYXpXOBtQ9Z+M8tTKcCiY+pTtvnXMNaFylKdfEGY5bSU
	 TOS4PI6HOd+vZMFjLEXNN+jKkIjR8zNvKF4jwEk6GotNITzYBVN7TRL034j265Mqj2
	 KfZn+PhquV4oVbQv8U93B43U1R7cUOGNw1LwQWURh2E62v36wVmCtxHyGVbjVMotlB
	 G3PtpU3arOvhIwJpeMkO1SROVJcmiwUy70gvNUwTKg/iFpHCFmy4G/z76bUg9HkjD3
	 EFx8qR3Y4ITyYf5f3/1j2cA2q/43mqvJ79mygvKB091BMTKLuAiS1KNdl0ORjBpg3L
	 xKWqYGBeBkzLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF6440CC4;
	Fri, 30 Oct 2026 15:28:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 484C8D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E3FB816DC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcZOtAg_aaO5 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 566778168A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374075;
 b=Or6QeJDlkTLy+G/p9d4ybo+q3AYjYI18etGZeic2oSU/cssdhBwRdlCFxhn0FfsBJQwP
 o+9JBql2srRbsLvamO13Mgd5vaqftugWXn4KgoO4iXP4zV6/UCNT/tWlzPyI6/8IYp+r3
 zIAKc62QXXKvfMilKOWydXcAj6Awp8JXucj2Q1EbtTeeUIp+KUojQX7gwa60B1NlnK7T/
 KmAohQUIAWDpWPTqwwjPSndkVkgguoL24Q/evcQnbmFoH6lHsMosuRJ7mn1Zs/BJyXYHv
 kOYqw4J4a77vKWtLAfHzuI17yA78KRwErFzPIh/rU/mUWxvky4SQskr7s4zVEivAweA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374075;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=kltnmgT/5iYSpDX5GmuNXMc0iFp7UH9jkeUtDIg4ueg=;
 b=J8qWHa7OpFspjMnt+UBk9PwnJVedwqeLkp7qm2F1RdEsJocFdv8aCHmmHRyA1edMMef3
 T2ko153aCI0llTld6/VPN7a2X1+QdbLieq3n1TZgtYRWn38iiHsAzKeiM1oDoGR5tajuu
 jIpg96f8UJYlZKId94WmH8+1zkmnP7mCgGtiDD5lY8JaA3udyLHpyIDMN2cKqIXLwk51x
 wFu/63+VSYoY2bXg7IDFiPaCiry17N3YqzSpR6J86lLIprUy2r865EMkJSgrTFqwuXx7Y
 v0gDqXkciampIbZAIa7ARUiyz33vX8/AlgtfCDMA0ltYV1mbuooZyk8aXqZBnytk5Ig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WgrIeDD9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 566778168A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso792571f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374072; x=1793978872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kltnmgT/5iYSpDX5GmuNXMc0iFp7UH9jkeUtDIg4ueg=;
 b=GiSuFjqYfor3tjIvvL89b8YV22KegNRU3tM370du8TZlyKyRrpJrhFg/kl91eNAo5+
 pwYCvaEfQjp0Wqinln/4pQsFdojrW82XjKI8FpNpillMYKjn13WtFrJlhHF4wI3h0ElL
 QB2Ncn/5B2I7k36xW+uCb8MY+ApZDsCfM0+dAcpQyDnF3PUFn0L3VIYAfPU0LSwuEMFe
 HsevOC/Y8J70xuO26ht2bNa0ZZDBbe+FPBPYbpsZKS4VL+nK1I5ToKt3MVHTigPKvj7+
 uAF0w4F6WUVtq6KaOP6z/cZOUMnecIitUumx+xO0pRiIOapQ2/x2u63lrwBMfN8fZARC
 Y9yA==
X-Gm-Message-State: AFq9FYKiA0Y84Vy1YD8eGVXuDtbz0iG7XCh3xGGNaTz6kzoRFVZWNkSS
 nXMrGpdkPsQz4Q/Bj9TB1oMPtN+apbczojTlLIKJP/T3KNFbrLXp/cGIt4U78aRXaO35TDZEo5l
 g9/StLI8=
X-Gm-Gg: AYBFou0Dbzb+ioLayILTnk0NPYUkCnY2WC/SjUMOCnPUXApqF9L6PRo3qMoAUKVmMwU
 qe7ZVYlu+XwMW9ijCu+OIsn2tU6LZBfiBtR6N/xMPyY7m52pSZdXkzf6el4d74FvT3LDS7pb4Mj
 DbmwORwd7dJ1K3QEfCtj0iMqMGN4ST5GNOXZmZ+327YHWCl5PGGbczse9LvFAPjiIANqdgYft8k
 iPtWwo04FJsMc5wiPX4gPRwVVPgUYFl3YvnMjw50u7zEc+soQbAhl++HdzAf7XYX78G4tpIMXcR
 yAfvIc9nCb9XbXDGgW6LggatRY+A6c1Ew3i/JwQzv0obw8YO1QOODu3y5ato6IF7EDFSUR1CzTQ
 w0CUBRPRI/kyM19nl16VLmkci7yWqQrOsOkgvJ9+HAgZNQvSJNOYx3Gu5IRdhyt5gbiA/VAYxgX
 Gzfb3iO9ZLKPQ9a7mnKQ47Gk8jFAQYI9X4AsHtspM7Kk8y2gTB5oBwRFmeHuUTuAVtlLJyb/xBu
 ATsbc2ziAKqQUxyhyBDZkoPwyL7DGY6Z/orgXxzGEC54r2UHYMDoivxyjZqxrQsa19mTf6qJUcc
 AhJFp8Grtirmj4oiua22C0wZ2/TvX0V9bCVQF4k5IEIcMfPkRZ9JyzC48rzNfa8pbaLtI2+O
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id
 ffacd0b85a97d-48e6e5008b4mr6702131f8f.26.1793374072058; 
 Fri, 30 Oct 2026 08:27:52 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba24f6sm3681921f8f.51.2026.10.30.08.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:51 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:49 +0100
Message-ID: <20261030152751.1906994-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021184139.1135207-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/libplacebo: add optional
 dependencies to lcms & xxhash
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
> Buildroot commit 006aab8d64d2179d77df9a696b3fd8636f541640 added the
> package at version v7.351.0.
> 
> This version includes optional upstream support for
> 
> lcms, added in v0.5.0:
> https://code.videolan.org/videolan/libplacebo/-/commit/eb14d3bdf22605263a9b6025ed6280eb1515a89a
> 
> xxhash, added in v6.338.0:
> https://code.videolan.org/videolan/libplacebo/-/commit/cb1009d1455e64787e52c5c3b6f7042aa37e5c14
> 
> This patch adds handling of these optional dependencies.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/libplacebo/libplacebo.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
> index e03f224971..c3a2822fb5 100644
> --- a/package/libplacebo/libplacebo.mk
> +++ b/package/libplacebo/libplacebo.mk
> @@ -12,4 +12,18 @@ LIBPLACEBO_LICENSE = LGPL-2.1+
>  LIBPLACEBO_LICENSE_FILES = LICENSE
>  LIBPLACEBO_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_LCMS2),y)
> +LIBPLACEBO_DEPENDENCIES += lcms2
> +LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
> +else
> +LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XXHASH),y)
> +LIBPLACEBO_DEPENDENCIES += xxhash
> +LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
> +else
> +LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
> +endif
> +
>  $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
