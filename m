Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73AA606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ersnfrB2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8304C608E7;
	Fri, 23 Oct 2026 13:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZ5ub-qD529F; Fri, 23 Oct 2026 13:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA1CE6070E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761647;
	b=h/egwKH32clRHDfsZjCWaNH346X9zRrwIrWucG5fe47vtIZjpb2MimMBI8GY5J3WQqH9
	 kHrYNOX9oygBZONxiKxtYAPJEVkdED0BE1+Dcrdr+O9eayClBHT9c7KH5o3Q/p2Qalujp
	 kmYbotuqPmbbvekWK6lZXj3GakOTvETDmTc5+BJbhu5N8AqydTwFeXt9MamVtH0G4fWN9
	 /3CZPBmRJ2mlroqIUNKxgsej96Ga+U9BWDMVm5I3eLNzliqRjZ/ImrjwzX+j+hAdImgXa
	 auiuhqpoOCi2LL11lxesTR09iIgpLCQaLouu59yB9yMCZSNf76JRYNBCusXxyhtgooQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=naOmzSy2nCgtoau1fWLaLFbqAzNtvDWcc8wHO/QpFLQ=;
	b=ciZL/wMaT/C6sJusoMnkLsNz99jr3GLV9faOokm0NGQ3yC4DTfhMxt9x21m7PMg8FsU8
	 bzpZhfhg1q+kDVeiaESYC9DetC2gf1sMNDS3guILSUcsVAHy9jKuSwLPPs56wP7BEANqY
	 s9XFBo0I3xn1fa0S2r8x6RYt4JA2AmAIbd8wVUhmPW0tMqSslQl4eC6wi22reDCNad650
	 T6QPwRQ7xIo0V79h7PNwbWpGlcyH/rrrNSuc2F1djR17p/ymgq6nOCFlNfToeS9K0XOyT
	 moFLjfuG8PttS+FpWALiMvitduxzwrLPQaBjpRkLyJjkpIOFJWX89WvXpkvbXltdgLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761647;
	bh=naOmzSy2nCgtoau1fWLaLFbqAzNtvDWcc8wHO/QpFLQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ersnfrB28Q8vpTQIg7wspCIDp9OWxBDUK3lnpF1XRJ4NDqMjytaQXV4/gxX5SabyW
	 Htkh/+k+FB6ZYkuJJEZ6H/Xui9jWe5zy9Yn+VvuxOYDsMkThPTTWmdPgnFwwn1bPzL
	 pNeS++pPfcChsnLIKSWyxL6jpP4EwIYyvKGSTOkX/c+BbtKj29tbTt1WweuY6fuslJ
	 4QgbIqVlTFthcg3p4m+KZicZ804CuE3x+vIbr9nmaeu5tU+Si2msHOFR/IFHNfMtIb
	 BivXCgQ+y7hObeN/snCiBuSyJof9+h/wnaSLZ4xSV8fvP931QjVIc6OdrSCPoPIRpW
	 budWF/iMjkNZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA1CE6070E;
	Fri, 23 Oct 2026 13:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AFB3356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 414C581496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljIvSpfboM0D for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E1838148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761644;
 b=K0+BfwAUjNBsuHQT9uf3b7OlafvDaER8fFLr6DDxiyh9szE65wWuTWtvGlcI9lr/6fmN
 aTDVIbF7aHjH/f2eUN+PmR8b6eoYjGohRuPxXIsEDspw/bV0wmG/KqAuNNnFMAfqMFaX6
 U46dRCNzVU2xP6+c+LD2YOqAIFjy6iQk1coeEvA81plynEm8teZOyFgX9uMkK8wKXpdwE
 0VskRlk+FDXsKNN1APqoWSAxBbutYjcu5VZYIHkHaVEXr8rM0nY9eYTDXtCdJPLSah4m8
 cs9S17s2tIhGBdDA2lt6taCl9QBpF6vT/Za6qRlqfckkEwZJKT3VCNXsGg+uBL95qUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761644;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MMLDoQE5d3G9M5q5bk7EV+2m6V3X219BiE0O/bN/uHE=;
 b=au0kYtXd/GiSvars/Q6DH0XJQggYa6ghhmvzQxfE8tlgl1vRHU64uk4+86TG8TtEmi0H
 tdgFTmSDKaePTCJ7ToqTw49LFOpQr/nYABQj/gZdge26A8EcwdZ4QZn3umyuIIRdaUuqN
 rzVoI2jLpuJdLyoqvBjuxS0r/dLlEXOEhscAVpeyQ6lXbRDmcXn+tVq7/qPap4QFji2Al
 O8yZcTcJtvteEzkeRfAKzqcigRKK/reeWaE+amAZcu32POmRtm0NGDNYVGIPjK442kRk7
 npP0wZNgV1+AmpitIQunrWkTPb1OBqru9HwH74qZMRihk/DmzswYmZnpNGWyYhuomxQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cw5BL3nM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E1838148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so576067f8f.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761642; x=1793366442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MMLDoQE5d3G9M5q5bk7EV+2m6V3X219BiE0O/bN/uHE=;
 b=ihzRL2A6W3ELD3im4NhV51chSgleuB8Mnu1dYTHZgfGCW3cKWZw6qUT9zZDNEtTIHI
 ClU8gkGwQY/TeucdyRmgp6vCVaRDiLnbUDL/rNo9KiSapahBIC5oEs8bT5qwKRL/fvzI
 lW1GvSrasLltUYQr4sqF9tLgRmOHh6WCbmSWjpCNlnbUSunkR/RxX6udONx4HuqQmJ95
 pOvJF7/OGUitOCOycp7Q8zJaa9i5xjL3pbQa0BdnXaeIYgX7MevSyQY18rgg0hkkF/pP
 pXPpI+/bSV4/io9UFBZocWwEioYYseHNEGB80C08WkSqwytzUcJF4JxnIcr8qzhE6DQj
 v0cA==
X-Gm-Message-State: AFq9FYJ7DiVCl+AVuMxPYhBW2XzW8o4Ye090/NsoHvYyzhpv9PUg09YK
 JbQS6WGTaN2d0czF4ldnJw0hJ6NATvk+J7xusDepmdmlkGE9nqJL+dVe1Lj65FwWrAT3+80lqP4
 /vfMLACE=
X-Gm-Gg: AYBFou3nDOGbjqCg09d1UDnMzz4rtc9hfiVZmtQTa5LdXevYckpC5kxOfys5LMpXEU3
 j7E56apFkTRpvj9pmrS1aQ1m5757tK8oQftgW3MED1dt7DespdSEFglvsUYWzxzdB4jKpivJPUh
 C09rDUrFtPpDkY86/BbTV0+vF9E+fO/ynvIrr5PVR3C2VG4iSWvjx6m1AOfIt4cQd/v1o3kpLuZ
 x8WpwxvevhytKc/4ddodczrAHTdwSwBYDuiRfChU+YHuYkayw/P/RCjVCJxxWKBmBo4nOJNHaYy
 t3NreVB7Jy7kLOqofTNUBjsljBZCNxNafzFFgXgGj6OgtFWSMuX0n7EYlZ4b+lP1ZjQoBtG3QDP
 /AmbiFaENsvgjeBfdx4aTyteVCuBsqXV7zvHhiJHb1I8xM3pv/u9oIm3JhSRyFNWFVj0yIkYufi
 1ysWrlNJYv04ntP7RrzFdGDXhmF3GQGG5Vps6ymmOW0zxeAHP3PUEYqpXCYOkNR6a8PSiRO+CEA
 hdF4Ht2ySt1l0AYfRVJNVVB1xBPqW9G+LUpwWUYtwCrHsdy1UWHa+Nl2w==
X-Received: by 2002:a05:600c:1143:b0:49e:7c8c:361d with SMTP id
 5b1f17b1804b1-4a211ede88cmr24760975e9.22.1792761642202; 
 Fri, 23 Oct 2026 06:20:42 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2b065eba0sm3875835e9.14.2026.10.23.06.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:41 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:38 +0200
Message-ID: <20261023132040.1606963-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017131247.1572149-2-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] board/librecomputer/lafrite/readme.txt:
 document UART pinout
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
> The lafrite board exposes the console UART on the GPIO header.  Document the
> pinout for ease of use.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  board/librecomputer/lafrite/readme.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
> index c439c5e91d..86afa855e6 100644
> --- a/board/librecomputer/lafrite/readme.txt
> +++ b/board/librecomputer/lafrite/readme.txt
> @@ -32,3 +32,10 @@ How to boot
>  
>  Insert flash drive to the USB connector furthest away from the IR
>  receiver and power up board. The system will boot automatically.
> +
> +A serial console is available on the GPIO header with the following
> +pinout:
> +
> +- TX: pin 3
> +- RX: pin 5
> +- Ground: pin 6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
