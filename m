Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56499C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 13:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF3E441769;
	Thu, 10 Aug 2023 13:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF3E441769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9O3GcpodgAe; Thu, 10 Aug 2023 13:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0A9C4175A;
	Thu, 10 Aug 2023 13:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0A9C4175A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3A61BF4E2
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 13:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E606C4034C
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 13:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E606C4034C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCsyez-7ndha for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 13:18:48 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CAB4402AC
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CAB4402AC
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so1275694e87.3
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 06:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691673525; x=1692278325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PZ+kILf/J5t+fMNL7aCNQKBpVsy2T3LPYJnwqf2J2j0=;
 b=VXbv3b9V2TNOjKPiUgbp+YYEgr0qx9pJgvSTjo30ec5ZNcyHz7DI7LWOy52ffWrF6r
 u7dHrqMJo0cTDV81Ym1Bhe8lge7KyQpntsQm7Bq8m3ZM0jEIwOqbqj4AymFA8F4ZzSTa
 5lUFTop/VekVsBw/kJ68KcvuVozsX/kU04SrnzhSQdqrJ/F1DXfil/LtHo2iHx9CawVt
 tJA8OXQbpPX4F4Lvsds3qMJefOxquv3vSZOHUTUNLBKvjbVoNOORTZFXNtdiD16D4lQT
 LY8rt90+tZlq0RkLOginou4JvhnF+ZbpV8Y7b14VGOKwlAklQp2wMDyV/XtYKJZEFbUf
 CGHg==
X-Gm-Message-State: AOJu0YxqkMDuFeYzzgLP0+I2TVUU/6LYl6YoHHzWX0wt+nbfLFf4qakS
 dnVhmeLr0Z3rBlgwrvZ9nGU0AQ==
X-Google-Smtp-Source: AGHT+IHdw1ZmWzlnf9s5RSqr9EKpgNLepZpL8/ObwGqTcO/r7KnQM+vX1xANpECKVCBNyqabHxQQGw==
X-Received: by 2002:a05:6512:214a:b0:4fb:9168:1fc7 with SMTP id
 s10-20020a056512214a00b004fb91681fc7mr1650040lfr.51.1691673525064; 
 Thu, 10 Aug 2023 06:18:45 -0700 (PDT)
Received: from [10.1.0.195] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 c23-20020a056402121700b00523653295f9sm807705edw.94.2023.08.10.06.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 06:18:44 -0700 (PDT)
Message-ID: <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
Date: Thu, 10 Aug 2023 15:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Lang <dalang@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
In-Reply-To: <20230810090721.1e052f35@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691673525; x=1692278325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PZ+kILf/J5t+fMNL7aCNQKBpVsy2T3LPYJnwqf2J2j0=;
 b=JwBtTwsrMVyjVgCQyAtm0AfiYtednnJ9wMM4dWCz7EhjaReXGhxmhE34+3DYkmkjyF
 Me0wADoLDbuE+7B81J0zDNN3Ux26jl1wWS8KZACdKrfilMrOvr3DXDLDd59551YmLbM1
 1WXRR7OwwXFe3QWt7nYiZcC1SIN/Jp/WZdW5s4Mxa0iVAv0iFY9Sub/3plzjmlwMZGUj
 M6x0PoahiIzUC0novTJh3wcAyxr9/5IYm97EOpyRZodJq8vPqmKpF5Zb7ch+aEMFszcS
 jr7CCOgB7qRYvvRNK81/kmaHkbAewD5pwi+sSz9bKkE5qeiKMWESwWHSBFmwIPlnFO3U
 9krA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JwBtTwsr
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
Cc: buildroot@buildroot.org, clement.ramirez@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/08/2023 09:07, Thomas Petazzoni wrote:
> Hello Daniel,
> 
> On Thu, 10 Aug 2023 07:50:34 +0200
> Daniel Lang <dalang@gmx.at> wrote:
> 
>> The problem here is, that the new API (even the one for CPEs) constrains us
>> to a 6 second timeout between requests [0]. We currently have ~700 packages
>> with CPEs. This would come out to 4200 seconds or about 70 minutes, each time
>> we run pkg-stats for all packages.
>> The only way around this is requesting an API key [1] which allows "50 requests
>> in a rolling 30 seconds window". NVD still recommends to sleep in between
>> requests...
> 
> Agreed, but what you do in the patch series you posted is just fine
> IMO: you download the full CPE database, and then we locally check
> against it. Your last patch implements exactly what Arnout suggested:
> to not check the full CPE including version number, but only the
> vendor/product.
> 
>> On that "latest release" note, we have a second, probably rarely used,
>> use case for CPEs which is support/scripts/gen-missing-cpe.
> 
> I'm not sure why you call that "second use-case".
> 
>> This script tries to generate a XML structure for each version that
>> isn't registered in the database. For this script a lot of
>> information about the CPE needs to be stored.
> 
> The idea of this script was to be able to contribute new entries to the
> official CPE database, by generating the XML file that they require as
> input to contribute such new entries. I've never used it myself, and we
> would need to submit gazillions of new entries all the time to keep
> their CPE database up-to-date.

  Indeed, for the same reasons I mentioned, it doesn't make any sense for us to 
submit new CPE version entries.


> It could still be useful to have something to contribute new entries,
> for those packages that have no entry at all (regardless of their
> version number) in the CPE database.

  This makes no sense at all. The only reason to have a CPE database entry is in 
order to link it to a CVE. If there is already a CVE, then it should already 
have a CPE entry. If there's no CVE yet, then will the first person to ever 
submit a CVE for it use the same ID?

  So I would remove that script entirely.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
