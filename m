Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D658C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 17:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC228408C7;
	Sat, 17 Feb 2024 17:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qNNxYv6CZ5V; Sat, 17 Feb 2024 17:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E67408FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E67408FD;
	Sat, 17 Feb 2024 17:40:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB6091BF5A8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B18407B3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EITFqGubBC45 for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 17:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF4D1406A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF4D1406A7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF4D1406A7
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:40:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4125296400cso9917445e9.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 09:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708191628; x=1708796428;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fjHw9n9gGwUESRXPq1nO6A2F6M8j+gA5AgdYeJHhra4=;
 b=AEb4ATCwqHoSfK3SHzv3n3Ls2qV2/EO85BuozmcFPGIu2JE8e1GYnkv7AmMD/aL1M0
 pLse31K2JFeUH5v4JsqEDlEKzFUtxkSC0VSNOIzhWjvfXLYNQq48CD/3zSm2TJhpGjJU
 qPEPvp639rc2BqwdcsZo2jO3KedlNRZ8dIF+W8NQSg8pwR9Ejb7z3KHXVukqUcFw8lB5
 dwuj61HcnXe9NsIfvssDEW5Rklrux/Iytx8Rsv8n5dKkk2BpWd1xSXQZxbMt7VbV2DKN
 cWUhq3tfFdhXIr5tkV9sGUgFoBrRDAHBzGp5eWz+PNR3yEUYnpp5C1L41MShmtVKPSIs
 Ib0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvjfaLdhi+MJGBM6CME9I9tq2zT0KQWi7XreWwzcx1rCv12P12uGT30KGdLKk5NF/kYURtJIvoK4ER693MQotqDBuPO/nakw==
X-Gm-Message-State: AOJu0Yy6NCLAUDeW8yFHHZwi16vzXtjKYyiojALN39+aBJU6pymzrUfU
 wmN9KfFNs7oy1tNZ7LzPkiC1KTP1PzM4aod0/y5bTfDWbUrblooI
X-Google-Smtp-Source: AGHT+IEBlYMBcX/9Eyh1bBm70c9d8Vwx3M5ABg/t2oUf78sHfTjSxH/GHhEwR9dawjuCmDEp0ftG5Q==
X-Received: by 2002:a05:600c:3b8e:b0:410:726b:6f87 with SMTP id
 n14-20020a05600c3b8e00b00410726b6f87mr6091749wms.32.1708191628107; 
 Sat, 17 Feb 2024 09:40:28 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b00412157dc70bsm5909506wmb.30.2024.02.17.09.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 09:40:27 -0800 (PST)
Message-ID: <4a8d7f2252b46118554a9e22c49901822e461f2f.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 18:40:33 +0100
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708191628; x=1708796428; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fjHw9n9gGwUESRXPq1nO6A2F6M8j+gA5AgdYeJHhra4=;
 b=BeJL+p75YPLGcsIVscXqwtg90Ezs7pxD/sypzKDBOHhrKZozWrZC2KunMo1tQwJafX
 v4zytKoMRwEoZQA9IPhVOwIq6PvZ4Vf2+pZ72bAbr16hjqXoFwG85hNoiwdvXGBXTDHq
 wjUWWeHlgZnTjozneSeJbuJGlaPZqxeG2Iq7kxeHUF67lLyZ0uEFkeS+YWc8vCk7Lc06
 rwdXcOQhOFeGjisM0S19lmji9JZnhnFlGj9QnDxh0IUZPerjCvCG7YCX9t4Ddj7r5Rl1
 HRTr2gCxLHxys2CLJeytgiZmCTyPvlZrsasrUc0qMXImQQ0jGQO+/02/VPM6L53CJv2H
 1sBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BeJL+p75
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario!

On Sat, 2024-02-17 at 17:02 +0100, Dario Binacchi wrote:
> This series, which in my humble opinion, should have been immediately
> considered to correct the compilation errors in case of HS-FS devcies, has
> seen an increase in patches in version 4 to remove the ti-k3-image-gen

I wasn't aware of the preceeding versions, but...

> package thanks to Binman. Additionally, it shares some modifications and
> views on how to implement certain changes with the series
> https://patchwork.ozlabs.org/project/buildroot/list/?series=394840.
> Therefore, I think it is necessary not to run them in parallel but to decide
> whether to merge one before the other or to consider a single series where
> the patches can be coherent with each other. I am available for both solutions.
> Let me know.

... as the broken HS-FS went unnoticed, seems there is no rush to fix the
build now? I'd vote for a combined series, because yours and Romains do
overlap here and there, but I personally would pick different parts from
different series. I'd not introduce secdev package unless absolutely
necessary, and I actually build HS-FS images with yocto with custom keys
and using upstream U-Boot binman alone, so maybe I miss something, but
I don't see the package as required.

From my side I can offer testing on SK-AM62x variants, both GP and HS-FS.
I will definitely test your v4 because in contrast to Romain's U-Boot
v2024.01 bump yours may actually boot...

-- 
Alexander Sverdlin.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
