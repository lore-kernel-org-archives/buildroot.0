Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC00C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D15E940103;
	Sat,  8 Jan 2022 13:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jE4MOzIBEJE; Sat,  8 Jan 2022 13:29:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0682440128;
	Sat,  8 Jan 2022 13:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32FCF1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB6381761
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYx8ExzFu2Pt for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:29:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D73318175B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:29:00 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l10so16717238wrh.7
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 05:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IpnuHDUt2sE5E2TOzWoPGOfUEF+n50sYVDnjZHxtxfo=;
 b=NAm5Bc0iQIkl8b5PTWDHqtuVyhYBAhsoRwXWg+0l64Q5wcgxKKCk36C0nK9xsVIwKB
 GcaUjoSroZVwvrbN89LpMERmwrg6fVyUGBXgGgEq7pe1ExqTmiZkw3IilmVsWa7s3iYz
 wNb0Hvf2L5L9rAeijtmsroCSYtIIF527gBokar0Bbrn2BmLillxCck4DiGPC4BNSvLge
 Id2JNbIPIbDZhlhQXKv/toikzs0lW6y7vvWiG/lusknaXAYMAeSChCo+mtlQDjU/jP5R
 TvrN6vBuU00z1k14H5u/xu3qt6Bq9vsYBEiA6QCub13H8bAtQCXZWIDqMSw/HKT7aOCk
 XoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IpnuHDUt2sE5E2TOzWoPGOfUEF+n50sYVDnjZHxtxfo=;
 b=UhWQg0ufSCins5Tg/5250DfAkL42ffNtnXZX+HAO6A9FEK7u+ObHncJTD/iPLmFkbS
 NWOTZ/7DXbOZWkE32qoN4pdaMNnSdreepDF1gvRlmA1qRWcOsnMQV7L0dggV+6ME3i6z
 oYN/ngLaZ7gK+a8oyDXdNwHuRPV6DRQy3A4r/0YObpNXxdfdlMyVkuduQ8ZxG7uzLuEI
 2VHp/1F3hIe7MIGIL4Ar/QQO2GLEBVGv51q2K8AJAI6j5sMzqdcOmTh/rRA7MTvw5QSD
 d8ivAoFXM0Le7xkgX3SLLv9c4nPlFD8FtddtxvL+GOgCvDymAv7zLcJibvtLkFUNHBZM
 KJzw==
X-Gm-Message-State: AOAM530P8tF41478sB7CNtm+P3/4C/aUCpBh289h/vPiTZ0zXwJA+1vM
 IP5dHgsTQr42Ws1sinQVss9Bpg==
X-Google-Smtp-Source: ABdhPJzc8WpQIFQBzmW4A0IA3Pu+DVjRcsQB24Fwxmt7gpaeMWF3c9UwU+zOP1xDh0NmirlgFUii1Q==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr56928176wrx.400.1641648539232; 
 Sat, 08 Jan 2022 05:28:59 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id r9sm1868901wmq.18.2022.01.08.05.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 05:28:58 -0800 (PST)
Message-ID: <44537b02-fabc-6533-bb37-d20268ff508f@mind.be>
Date: Sat, 8 Jan 2022 14:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
 <20210107135307.1762186-2-maxime.chevallier@bootlin.com>
 <20220107223624.3ba7d348@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107223624.3ba7d348@windsurf>
Subject: Re: [Buildroot] [PATCH 1/3] package/refpolicy: Add patches pending
 the next release
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
Cc: Antoine Tenart <atenart@kernel.org>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/01/2022 22:36, Thomas Petazzoni wrote:
> Maxime: do you have that patch 8 broken down into smaller pieces with
> reasonable explanation about each piece?

  Just to be clear: "reasonable explanation" means:

- indicate what the problem is;
- why this is different for Buildroot than for others (i.e. why it is a problem 
to begin with);
- possible solutions;
- why this specific solution was chosen (which can very well be: the others are 
too complicated).


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
