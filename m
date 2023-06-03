Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F35CC77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EFFF41BF8;
	Sat,  3 Jun 2023 19:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EFFF41BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSQrJPccbNnT; Sat,  3 Jun 2023 19:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0899641952;
	Sat,  3 Jun 2023 19:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0899641952
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E19B1BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 373C260A92
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 373C260A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2S-glbQWfepV for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:14:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 620E760701
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 620E760701
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:14:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-973f78329e3so510417866b.3
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685819660; x=1688411660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lRjnDDQqagw5X5ETCo3KF7b2bMun+/eCREqsFmyE9No=;
 b=AFlPyi23iTimTxD0I4xmwdu9ZsRM/x+626xttjVT+P06NQVvUT/UF1OsZ8QT9UkFJG
 6eo50cpMmgKcu966fmtDIYO6prCQPDAFNwAmZCD/pL32/ByF4BMleGR1rOM39ak33VEf
 YDDtX7WfMLkxlqFrpvYz3685+OBAMs/YNqFsMkSErk6qvjm8SDeTrGsHyq75/3ZzJUTB
 XxnYpnNFnXumCk/WRUEgcqf8Zd8oLTj+2GHXc28AmrUKdtRqGC4TqPUmFtKK4y4HynoO
 Ip3cZ8ZeCQNmrlwn8lbivs+Q8rI/JCUhk4DJzw/7eg8XkP+rjcWcuTSRg39WfRDdx2pU
 X7kQ==
X-Gm-Message-State: AC+VfDwdvLtkkuci6yCopMvgaF2zvxAPv9cRChIii4VFgocivRNuzxqB
 +HrZ5WPYS7zcR8DKtf9yyr2BzQ==
X-Google-Smtp-Source: ACHHUZ7vPAQLQsnPZ/CIb9t2gSZNmnN3AT4ScjrEf7nODtyAXLTb7EFBkiuDZ6dOzyOXwGCFgTJwYw==
X-Received: by 2002:a17:907:3f9f:b0:96a:63d4:24c5 with SMTP id
 hr31-20020a1709073f9f00b0096a63d424c5mr2494667ejc.77.1685819660561; 
 Sat, 03 Jun 2023 12:14:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170906924200b00977c88d70c6sm710336ejx.192.2023.06.03.12.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:14:20 -0700 (PDT)
Message-ID: <bdcfec9d-d9b5-2e80-49d1-22d9b414ed6d@mind.be>
Date: Sat, 3 Jun 2023 21:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Witold Lipieta <witold.lipieta@thaumatec.com>, buildroot@buildroot.org
References: <20230526094219.3374291-1-witold.lipieta@thaumatec.com>
In-Reply-To: <20230526094219.3374291-1-witold.lipieta@thaumatec.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685819660; x=1688411660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lRjnDDQqagw5X5ETCo3KF7b2bMun+/eCREqsFmyE9No=;
 b=espvl9Eu+eV1Gp2VD+SiyyM+eYqY6AvwIzWkIo7CSfTL82farpHu0YLuQr7g6qYOxJ
 kTBeMtfwy8ElGpjJeEvRhyhcHCpZ/G0fHA5BjsdZTxgJ6gEkUWgn569x8a7cn/p20UPc
 b6TjN+UWqDCA4WYu8TaaNaHzlIGR3XHh0kNFlkLUIiy0txx+UO2V5SXaMcgVU/H/kwy+
 G69RODsSAz8OuElicIv8pO0IHwfMb2jhXiS78sGXEEmY/DCHMU6bvm/F0aofIjjZDY7H
 rEfHSLYf8Jufu7STs4AaSO0O769W37/5dUHYrEHrKc8bnSSfejBqPPepMkU/EV3gXpNe
 +J7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=espvl9Eu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-matplotlib: add Pillow
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Adam Duskett <aduskett@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/05/2023 11:42, Witold Lipieta wrote:
> Pillow is mandatory dependency since version 3.3.0.
> 
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>

  Applied to master, thanks.

  It would be nice to add a runtime test to catch such issues (cfr. all the 
other python tests in there).

  Regards,
  Arnout

> ---
>   package/python-matplotlib/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
> index b936777662..8a9281b8e7 100644
> --- a/package/python-matplotlib/Config.in
> +++ b/package/python-matplotlib/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
>   	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
>   	select BR2_PACKAGE_PYTHON_KIWISOLVER # runtime
>   	select BR2_PACKAGE_PYTHON_NUMPY # runtime
> +	select BR2_PACKAGE_PYTHON_PILLOW # runtime
>   	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
>   	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
>   	select BR2_PACKAGE_QHULL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
