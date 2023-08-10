Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAB7C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 14:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21B3683FC0;
	Thu, 10 Aug 2023 14:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B3683FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvKRJDd4Ewh7; Thu, 10 Aug 2023 14:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6127883FBF;
	Thu, 10 Aug 2023 14:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6127883FBF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0105B1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 14:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8BA540395
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 14:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8BA540395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmqjZ1mGI-y5 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 14:58:19 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AFB04016D
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 14:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AFB04016D
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c4923195dso143637866b.2
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 07:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691679496; x=1692284296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aaJxjgWWfoVNwG1UYQCwtPZQIp0wQh+txkTzoUERecs=;
 b=I+FzGqCW8k0snce8JiqRh0NNCC4GwSzIvhnGCsH4KXPLzCFWF2BCDW0eYbCUUqzsfy
 tkhcT1VGsRfmftmwdQeo4A0RCCn7BVHaoGhk8otFzUXRPhlW6VaLSP1yIJ4qbGEvrIiW
 NQQwLyveJwxy9KiipTlGTFJRio+zCNMtDACZnv3+T5Dphw+lk9ADQdRSfgkCfgNzS4Zv
 28tcHLO8DE3StGng9jMFXPFp6pHQTYH7j/U8MZ3LsudYxT2i+y2dzeOdYGtWDXRfUD7B
 vOLHsNZP0mBSdLw0wyl28FpLbQX8C/lCJhn0pdKodoVq5tIEOuvDVwFbUkmMK+4j2h9N
 E7xg==
X-Gm-Message-State: AOJu0YxMD5mEWPh9jX/h+GIiTpVL+3+hZ0hJsUow9kJ2bNpW5NoAU+ur
 Hpdeg6kOrZNqWvvCwDvhYOxSWQ==
X-Google-Smtp-Source: AGHT+IECI7dn5iCFS0R6qN0rIkNXF+BkwxGzEE2MWvCXDn+iY5/W1iSEjllRkw0Vh1xqkn815X1MTg==
X-Received: by 2002:a17:906:5a67:b0:99c:8906:4b25 with SMTP id
 my39-20020a1709065a6700b0099c89064b25mr2224258ejc.74.1691679496632; 
 Thu, 10 Aug 2023 07:58:16 -0700 (PDT)
Received: from [10.1.0.195] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 l7-20020a1709060e0700b0099ccee57ac2sm1041504eji.194.2023.08.10.07.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 07:58:15 -0700 (PDT)
Message-ID: <2dce28a5-8e0d-f240-9b11-d3ff08604e88@mind.be>
Date: Thu, 10 Aug 2023 16:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
 <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
 <20230810154241.3faee0fc@windsurf>
In-Reply-To: <20230810154241.3faee0fc@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691679496; x=1692284296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aaJxjgWWfoVNwG1UYQCwtPZQIp0wQh+txkTzoUERecs=;
 b=TIvfYCKK0om+a65xag2gS5rLiKFWyVirLEaY5ujrUq872cYQ3v8UNtnuWzauJvih/T
 fFAVyVZDS5Y6Opu5+/T0eBC8vCaTDv3TVS0+VlZQnsrS6VZN2cD50sqgGeDnhVrQELGV
 Oq0zKhBTJYzvcc5t7YGbDbyAAd0esLT/qTfk+HnpMlQKq/0ebVzKSuWfa/ueMjSkWo+z
 r2zURL9yGGCIA7FQIytsbh4D+HKxtZt3ECEogLg8H/74UBD4xzFkfk40JJRWM4Q/J93W
 8/9Y9w5M5B01sKxODdM+e85tQ/QQJ4Ji9TRvVCNT3SS0mD/iXAfyPzLCLYTfxGgsDmJU
 rXpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TIvfYCKK
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org,
 clement.ramirez@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/08/2023 15:42, Thomas Petazzoni wrote:
> On Thu, 10 Aug 2023 15:18:42 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> It could still be useful to have something to contribute new entries,
>>> for those packages that have no entry at all (regardless of their
>>> version number) in the CPE database.
>>
>>    This makes no sense at all. The only reason to have a CPE database entry is in
>> order to link it to a CVE. If there is already a CVE, then it should already
>> have a CPE entry. If there's no CVE yet, then will the first person to ever
>> submit a CVE for it use the same ID?
> 
> Well, that would be my expectation indeed. A package in Buildroot has
> no CPE in the database, no CVE. We submit a CPE to the NVD database. My
> hope (but perhaps I'm dreaming too much) is that the day there is a CVE
> on this software component that CPE identifier that was submitted will
> be used, and therefore our CVE tracking will work.

  There is a decent change that they would, I guess. On the other hand, I guess 
it's more likely that the CVE's CPE entry would be created by the maintainer of 
the project, and I guess they would just assume that there is no CPE entry yet 
and create something, without searching for a pre-existing name. They may even 
search for it, see that it exists already, and decide that it's a conflict and 
choose a different name...


> Maybe I'm dreaming here, but if it doesn't work like this, it basically
> means that for any package in Buildroot that never had any CVE, we have
> absolutely no guarantee that we will properly notice when the first CVE
> gets reported. Maybe that's life and we have to live with it, but it
> kinda sucks.

  Yup. That's why I claimed in my EOSS-ELC talk that the CPE approach is broken :-)

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
