Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70301C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FE040B8F;
	Tue,  4 Feb 2025 17:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3Fj8E95W_SE; Tue,  4 Feb 2025 17:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196CE40B42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 196CE40B42;
	Tue,  4 Feb 2025 17:33:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5709512F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ACC060C1C
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_r7P6lEfh9m for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17E7160D53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E7160D53
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17E7160D53
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:33:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso41258785e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690380; x=1739295180;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uzHZvj7wZ/RCS8Jra4qb0B3jIOTntTU4v9WhkfgN6pk=;
 b=uC1g5MvsaClfhzdlQxxSYTUDOjyuol8H1TAJq1BEYXz0rfEI1CBDz0FzUXYIQdi5Dq
 x7x2xcN/Xl1eXlrL9ZLlbQUU6iIBCPMvLFUnScA7LlpgjZiSNLawGoUejnxvy+2iv5Xu
 qPMkHXz9gHpxoMWUAig+LYmiBfp/zVglMhWmsGhfalOghu0zacO/9xpXDbwTRzvrYVlI
 ZJ6mr+OUBetFUxfOTv1wlinuLAx/r+KLTwmaxWhMZD04ITHUcp8/0BD9weqCbhD/DUJH
 3g2gT1BSuOOk/gxhmE/rwdfEWrz3N7IP6VOsmtTZnydthE+oE98u/ZA5OdGaHINPzKhs
 atVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF2XtmcRDWDQZl60BZ/LJJrgwA/yUhdU80nOjsZpYk+SIIM3e7xgLs87VVKTEQDPqDj3nF0ECrSc0=@buildroot.org
X-Gm-Message-State: AOJu0YxhCwAFuKdyuKTho4Dg6Z1axOZlS6Blw4OIVXcge43RDmusMKD1
 m37JeIqJMZKxWhOENVQtwCt1Up52zvPZyZM8xBVz/CdlMalRvdeAlFVoAbtnFeM=
X-Gm-Gg: ASbGncu8a8dRJCeFTBaWl+c8zyJGeTBNQyCegci9AdchPWH+tVBhNfUMco/5O86vPVI
 4eTHhdGVF5EeSprurgUk0TmvfZU46aFfQcfYoG3N7yur7+A+D0HZ89Zc1wfO3C/LD9a9dkLP7Ef
 uGzAAMvk3YolNehE0023a1oznkCyP2XoTxWvgYGJsctOF0Z4YI9dP9Pb2X/aT4DWtovdmGh7RE5
 47xob5B0IwKVyk1VVIyfY47uWX4eMT4ArHFNadEXElOAeESQbAQQmnnWYnqFT2urcE29pbCodF+
 8g0lBrXkm6x/qakpztLgw+2JTBzQZiYbBEP1vQrQ6PzAQfk=
X-Google-Smtp-Source: AGHT+IHsx/HfIWtRZe5Ge0HHaa1Wzlk0+fRnkEVdYf8Vc2zJhOCZE7zry86Q4rl2s1Ius0wckhEajQ==
X-Received: by 2002:a05:600c:138b:b0:436:faeb:2a1b with SMTP id
 5b1f17b1804b1-438dc3c7b6dmr228940985e9.13.1738690379885; 
 Tue, 04 Feb 2025 09:32:59 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13139sm231230625e9.3.2025.02.04.09.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:32:59 -0800 (PST)
Message-ID: <b74670aa-6beb-4a4a-82ef-255f1de9ef53@mind.be>
Date: Tue, 4 Feb 2025 18:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20241105-support-b4-v1-0-2963298c1a58@collins.com>
Content-Language: en-GB
In-Reply-To: <20241105-support-b4-v1-0-2963298c1a58@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738690380; x=1739295180; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uzHZvj7wZ/RCS8Jra4qb0B3jIOTntTU4v9WhkfgN6pk=;
 b=c8H1/2DX771KgKYE83p0jjEj6OiQniIBcfcIsCzXb86oGnjYQ72NSQpIgdyeZy1GCj
 mk47OHPSSQl6Jg5RgB0Iin2WMxcqhbh/i6QdCnKdk33nSmESQw49YI2ap0lG3TK1ALl0
 H1C5qdILW5T6MMj+oTYSedIv1zLiVd94T8KNN1xxsm+/dXXQkwybviNzmf+3Z8hSpxmU
 uew19dWRnlYVsfVubAItGLQKSQ3dRei2Kc3lQUzkZ9irGIzahB28TSJfPbYzg0AQZgxy
 mKzV5HxgKLkxveEaTwtjaMBGCfqIkqqagR7Yg+vgCsTFD1n2z6peCzmelsravhA/6F4g
 zbdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c8H1/2DX
Subject: Re: [Buildroot] [PATCH 0/2] .b4-config: check patches with
 ./utils/check-package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2024 15:37, Brandon Maier via buildroot wrote:
> NOTE: This requires `b4` version 0.14.2 or later as earlier versions had
> a bug that broke custom prep-perpatch-check-cmd[1].
> 
> This series registers check-package as a `b4` "pre-flight check"[1].
> This way a patch series can be checked with `b4 prep --check`, and `b4`
> will warn the developer if they try to send a patch series without
> running the check.
> 
> The first patch adds support for checking patch files to check-package.
> 
> The second patch registers check-package as a b4 check-cmd.
> 
> [1] https://github.com/mricon/b4/commit/0741bc9a5b45578e4d3804588dd3f63fe4848059
> [2] https://b4.docs.kernel.org/en/latest/contributor/send.html#passing-pre-flight-checks-v0-14
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

  Applied both to master, thanks, with a small modification to the first one.

  Regards,
  Arnout

> ---
> Brandon Maier (2):
>        utils/check-package: support finding files from patches
>        .b4-config: check patches with ./utils/check-package
> 
>   .b4-config          |  1 +
>   utils/check-package | 37 +++++++++++++++++++++++++++++++++++--
>   2 files changed, 36 insertions(+), 2 deletions(-)
> ---
> base-commit: d74a5a218fabee928abb347086648ad142f7d5a5
> change-id: 20240626-support-b4-41d61b8e4d60
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
