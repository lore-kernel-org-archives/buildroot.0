Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C7606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OtLRsIBS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AEAB606F1;
	Fri, 23 Oct 2026 13:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uPujbqn4E2I; Fri, 23 Oct 2026 13:19:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7D95A60886
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761598;
	b=CkIV88d496DKTrksrgNGy0AybpV95FYEFBLK0SoaMNghP7U4KLJmMG/hYgi05N7pvmBB
	 k9IZy70cYxpePH4ixaoU41pZFe8Ve0R746tgMiGxQamb+FFLQEGU96cEba2EJpZezvL3y
	 cZr0nZ9sSXcMyTwIxwzrZU4gTtQe/ikHa5QnmU8IWAjwg/Vy+fI5d4j9/bepEhrTCJeiF
	 HOSrMY6D3UUxeUgVf059e8mEKUypPbyKSOC4IfT0ZVr8qlOOvL0JAYggWszdzwwX5rKQ3
	 NSiC5rf3lIGxgMXIbOMuMUO15EZemJAbj7Yh3IiMIPyj4q2nlPZoVKcr64wKX17AI3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GbsH7beHkOIaf2WEWvS4dW2B6T2ogEhA02w6gIyIxXo=;
	b=lTVsBtgSh6xCeyKs82MRU6Ape5fbPTENqhnwBXbn/u5v6ZZuX+ZyCTOl3I1PQFYOZzMe
	 p3HDOD/vI0LGzig38Y1nuDrJ8nf0vP3b22xGz0lkwArIV/NcgFf0JNM73UBzSpl9Q/BFl
	 FJPOZpW1GCsgKSzAGYUs6jD1x9TTQlW0w8U+Apck0Woe+Qd4c2NEfFml8zwbHwzXUJ61F
	 8rR18gLNwY9Lf1/qotNiihnjwEZ0umuthXnRUxwKef9gwhA+nwVYAi5TvvsBqpDKyHY7b
	 mIMRaBmrJU4CtFtRx+Tz7xNH2PgxT7IoksaNasQvWdwRrc5kZpACINmt9iPqwaUOJhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761598;
	bh=GbsH7beHkOIaf2WEWvS4dW2B6T2ogEhA02w6gIyIxXo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OtLRsIBSs+udF+LPgabsEZiuASysigBNGnbgUYdWycvPibB4yoSyttio/dzPp6rhd
	 hR/ZKDfqpNgIsl6af1+svtlwsN/bsU7LLKV+iN84gNFk1MCiG0PRwyvWoFXOnjUpmi
	 UM/VzzFLxOO3nQZg4Q6K+XeYl98RBkMeAVrQFYDxsEqXFXNtDjTa34szhwTa/XtZT5
	 xQywUHyKMxT42yvpoPVPa8joBJc6bYux1c8TnYxWuVv77uukcmYBRgR3QoPLgvdwoP
	 q5ArrkNy15/p1dS+c6F/++nc57SmFGqGo1FMgWch7eIL9BUhAYv+8IFwuKn6naFvBd
	 m5Gw+rUrhfxmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D95A60886;
	Fri, 23 Oct 2026 13:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B75AF3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A916E81496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RUx9OHrS9B1 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:19:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C5E328148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761593;
 b=JhoVnLEMgIWVszS0QENElh1lfDciDaoH8cy59vvB72vl8SF6ZMdUiruEiu8q/7o5O7UD
 yL0owZCKOpLC0vOYW0xMHgZlMYrqpADwDSgZGGNDdU0J/Ixu63WvwF3pW8OK8tPHBEQxJ
 SlW3aaXfrw0j2O3W/QVFrwvwWSyCwUQAVLji82Oa8wGOx+CWIDdnqoMH4u2wthcVmwjh6
 i31ooeGaneMpl7LYmnYaYAp2d54ZHggDPT7rIDpmOxOsebSH0PXAZ2midwRyLO2fykevr
 AhB8ptxhbZii8qHSEk+Mm/x8MoQLvG0KKYPCSs8JHxCB7RLcDwQ7FbymbDvW09Xbe0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761593;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=rr61qCVMIhQ++siEzp7Hm56YYWurz7w1eOaOv8QvbvU=;
 b=f71dSK3qVnXbxvQ+VcFz8tp2cZl4Op9IDjyMKxPXaaEZq9nsPnVOattQzZTpeV9jTnWO
 XiZb1aXy6+mceCPdyr5xuq5VIcQQzSBQEDx8UwhVTB+YvJhp08kk5PQOOATp5Fn4YtVEP
 TUR5Jk8/PSllv5j2DnadB0H3Bj8ufxFPdwWWaJHklij1YG/Wf1iY5xwCKKx3jDSgAqnIm
 2ZKqXgbdYckjfeOJ/SCkQJbyvXHLp0pclkeuQaagATXRkWOSKNXZmGomab9xcSSmDe79R
 Y+oLSaKsq8RDAprzC80UWVgvY6v9hegA3fHOrUr8JCSwFq2P90z1AK/nAHNWfudIOBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Oyfuoxex; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5E328148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso6652165e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761588; x=1793366388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rr61qCVMIhQ++siEzp7Hm56YYWurz7w1eOaOv8QvbvU=;
 b=uJ9q3+MeNkt0NK2AIXWsc24ZZxix5QBP60u6hhsY4JxmTYGS2kVhBmsMZ9iIWDGnAS
 tW6YtZ2z2BD+r0w/dzc6YgEADmShXiQztVDeFoBWEwNhhZB4XUjGma6jB9BQ57Wf77dZ
 QoK1ICrwvTVnDrdXeTT3/2eJVPg9BdKW23GIek22mFuL8LDr7pdP5gZpgbpwlkZZQLRW
 blcHNwXVKeRY2Sn+osco0m9rp/dXw6XGUD6OOUPWf3FQRGw5o+quXk7URIGDoNdLU1AO
 xSPmspYIzmWocFyYwJK9Tr1h42NReryiucLDYMTEcsInybX9Lf/FTOocviCKI1iYDbQ+
 6YKg==
X-Gm-Message-State: AFq9FYKFp201Vuv5+dYD4E8EQ1eXUzGX2fsFVHk46fBu9lPxSYbjJ1gr
 MCije4qWFdBK4qa//l6mgYSj0xSp3Poi63MQCLmrz3uLhRjSn4Vs4Z/qHOv1y78+QPf01u2MxTS
 EqSfkQTE=
X-Gm-Gg: AYBFou1rqA2Ge8LESteSZ8fkmua2Tr48wfNy67sxTG0NLsXdz7thMj5+v4IDDeVksv3
 kg+R33UhUb+3hwYRJ+FYaKj2C2PMa9OzA8NAi5DvaswCd1kcvqMGVv9luTjcHPOW4QudQgPKhzh
 Bj8ACAvNhATwJu5FtnrFt5DySnrH/28Ucm0y1TcnuHN93iEQvoyNl0/rpJZN9JevUctyPt/f83n
 oxEhfigdWWs47ej4uXwTCXRPYsA/mneJF39xMp+RIfETg4H8Pq/Vb4oJisY/fItO07vX8vejIHw
 +CjNJgqbh4ttDImxaacxDPODAU1Q0TC9/z9A79VHz6bn6YQOC7vnrs3pz91AZaC/VSKxzN/yH9M
 LLD+yBS2HCYBS6ZC9JtqUw/0JIodJAbSesVduNfrDMe681c2SVa3Qgse2/5YrPASjr5Zj3FLHnF
 KlAAyWgD5EbBJn7p5/Qp4VfN6Z5ltmlsAYSRycIs2dS6GBS+APPvaz3ClPsdApRRaui1pcfnkO6
 I4up9FzGiJnNyBT3+G7rH1NQ80grm7EN4x2ZNfoMTwilqfj9EsmZe8kDA==
X-Received: by 2002:a05:600d:82e1:b0:4a2:59:f568 with SMTP id
 5b1f17b1804b1-4a211ce4c9amr36840365e9.14.1792761588182; 
 Fri, 23 Oct 2026 06:19:48 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2d6d13c7dsm1083655e9.4.2026.10.23.06.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:47 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:45 +0200
Message-ID: <20261023131946.1606422-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012182345.2187315-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: do not enable
 CONFIG_CRYPTO_MD4 for kernel
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
> This was added in 8c12a6bf51bc4b166948b4392e96344259a64778
> "package/iwd: enable required kernel dependencies". The iwd code
> referenced there did not check for MD4 then (iwd version 1.20), nor
> does it now (3.12), so remove the Kconfig fixup. It did and does check
> for MD5, which remains enabled.
> 
> Fixes: 8c12a6bf51bc4b166948b4392e96344259a64778
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/iwd/iwd.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 8f662ce5e5..bb6bbcd868 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -77,7 +77,6 @@ define IWD_LINUX_CONFIG_FIXUPS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
