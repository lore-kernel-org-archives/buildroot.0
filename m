Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48380C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 15:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9F2940146;
	Mon, 29 Apr 2024 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EedZSzbZLcZ; Mon, 29 Apr 2024 15:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0310402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0310402BC;
	Mon, 29 Apr 2024 15:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 270F41BF419
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 15:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 203C881CA7
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 15:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15vVB5HomsBj for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 15:38:37 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=gsmecher@threespeedlogic.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9ED8980E84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ED8980E84
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ED8980E84
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 15:38:36 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5e42b4bbfa4so2802704a12.1
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 08:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714405115; x=1715009915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tANiMishe/mYcEjgwuhXrLxVZUPsQ3pPEGw0rmPqlic=;
 b=iLxDVxMJs8Zok9NmLSH8oWJWQ7wgQf8jqo0rSvJqohfQT09zHijoa03t0Je2Y07h62
 TT/Y0U365wpVzRkiDrlIAqliMhKWqOfkKzYZPBjaqIGn5Bt/bCdERq6nibhta0H9tpg7
 xsIEKCHtyQ/ZOgGBJauh+7lYTtuSdeUAOAhmBGewYc1qpwPq+XE1M0hVXzGRr0D057Di
 aa+80fgLfd5t38TpG3wKoGNlm1aRMWwfFx/Nest5B0VwJO/W0iGx5bW41U9ReLTD0O/n
 UIcmmn0XKWCSVib2dGZmGM43ypiumxmLXVTqQ9DQwx07QsIjyO0mAfo+uTyJcS8L+Ctx
 9E7Q==
X-Gm-Message-State: AOJu0YzCJMwCP+4qiqsY8c3SWsMy8/aFHdgpUmeOlRD/orRwHCY3dRh+
 /krfTVmBjp9g6TEHHwDsX5RGaRQGzArFDAZnhG9Rzgb8fu20IzqLbD6+gj1UWVkIPz9+mMtq0RP
 xJ2g=
X-Google-Smtp-Source: AGHT+IF686eiyQJMa4JTIGU/zpRWGMbmqy60aAnOb3Jm2Ae7bQBGuUX0sbPdvIFWFIPbNoDRH5sWPw==
X-Received: by 2002:a05:6a20:438f:b0:1ad:8335:1a45 with SMTP id
 i15-20020a056a20438f00b001ad83351a45mr14350683pzl.55.1714405115243; 
 Mon, 29 Apr 2024 08:38:35 -0700 (PDT)
Received: from [192.168.0.172] (d172-218-135-26.bchsia.telus.net.
 [172.218.135.26]) by smtp.gmail.com with ESMTPSA id
 p38-20020a056a0026e600b006f3f0c79aa4sm3976853pfw.51.2024.04.29.08.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:38:34 -0700 (PDT)
Message-ID: <63379d62-658b-12a9-1e17-bb18675ca168@threespeedlogic.com>
Date: Mon, 29 Apr 2024 08:38:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240418222607.1487698-1-gsmecher@threespeedlogic.com>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20240418222607.1487698-1-gsmecher@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20230601.gappssmtp.com; s=20230601; t=1714405115;
 x=1715009915; darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tANiMishe/mYcEjgwuhXrLxVZUPsQ3pPEGw0rmPqlic=;
 b=qWwxb9pUBbmV5etw/xT+446xoaWWoYPFOdrSbuXkXqEQgHJnMdSi+xZNc9N+VBSw7k
 xN4+atfajYXkr11viSN5o/TuMQK99qVkZq7l52cbJH65xhScVW3dOwp4uBu+pVOkDogM
 UvM5ARytuTfngNPPPPpb7Lx0Wpblm6X/HYWKaS8L9nFHa6xm8JEwcuDQDap/Sj9/kRA2
 3ZmpLEO6F8bKvpuNdlDQ3+PAD+/tttBmMbBqrwjMWsTNnchAQrrMoPOtf3IQw7KlwcvC
 iTdZHkbaRvabVgv6J3NBuR9ZGt0n0fCbbEyPbGA0G5nTlFRvE7RczbAPVEaVLDVoGu0q
 0Fbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=threespeedlogic.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=threespeedlogic-com.20230601.gappssmtp.com
 header.i=@threespeedlogic-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qWwxb9pU
Subject: Re: [Buildroot] [RFC PATCH 1/1] jupyterlab: new package
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 4/18/24 15:26, Graeme Smecher wrote:
> JupyterLab is a "web-based interactive development environment for
> notebooks, code, and data. Its flexible interface allows users to
> configure and arrange workflows in data science, scientific computing,
> computational journalism, and machine learning." [1]
> 
> Why BuildRoot? JupyterLab makes a great
> interactive front-end for embedded instrumentation:
> they replace web-based interfaces, encourage open scriptability, and
> bridge the gap between interactive and scripted use-cases. High-end lab
> gear (think: oscilloscopes) generally comes with some of these ingredients
> but it's usually vendor-specific, often half-hearted, and usually
> inherit its ergonomics from IEEE-488 (no thanks).
> 
> For example: JupyterLab is already used in Xilinx's PYNQ framework [2],
> which uses Yocto as a distribution builder.

I haven't heard any comments back yet - I realize this is a large patchset
and is going to take some time to settle out.

Comments welcome. Please also let me know if there's anyone missing from CC
who should weigh in.

There is some earlier discussion here:

	https://lore.kernel.org/buildroot/ed1bff77-5934-f09a-ab39-ca4eea6b4b12@threespeedlogic.com/T/

best,
Graeme
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
