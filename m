Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49C1C433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 22:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CF29610F6;
	Fri, 18 Nov 2022 22:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CF29610F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dh5-qhAHviKy; Fri, 18 Nov 2022 22:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7689A610A6;
	Fri, 18 Nov 2022 22:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7689A610A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12A611BF358
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 22:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2218822D0
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 22:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2218822D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Cy9jkq-3Fpb for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 22:25:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45645822CD
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45645822CD
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 22:25:44 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id e15so4088480qts.1
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 14:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NVSUsGOr5sAoIfRgHf7/7vgNGPwmjC1NCKeIHmVilCk=;
 b=Q+BbbDwYErJI4/tWxsnCxPQdg/NIhHKVJYf64h1ANtDdAoHEAE443OkKMzvUrD/iA+
 88PcTMS4kIEgKj8smTyY/iWccWbCBGCSzsEPRSFAzwUr9tGAZbX6Yd3rFoarZBMd7rW4
 8kiVnY89RTsCQn0j5Dgip0L4U84e+0cYOj9b8CA6S7JYaRjNIXXSOdapr2DMY7Y/9vQA
 bF91ldRtrJkpJuprtQ+C00DYpUH7PXcTUZaRJRoC7K/fIe1ltn1dmLJyfzDgOe1eqMLZ
 9JC6nM+5HM36Udhao8vuE6L5ehgD1XrdxE010CzNVSJ/htc1OU0f96aXnOIGduvrq1Qk
 S9xQ==
X-Gm-Message-State: ANoB5pniSzwS5NK5tpYzPbXBL1fhS0uLtJ4vDsCswJmJXN8vBdsWv6La
 374/waw6oDcgP2aZleOwND4=
X-Google-Smtp-Source: AA0mqf4N7L7g/6oQA3vmX9EJqZK+i4E30Vqhvm4yzBPceQGV4GWG0CIDUMb6I1PNIFXYg7kzP80Rvg==
X-Received: by 2002:ac8:5204:0:b0:3a5:6a35:bac8 with SMTP id
 r4-20020ac85204000000b003a56a35bac8mr8519024qtn.615.1668810343008; 
 Fri, 18 Nov 2022 14:25:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 cp9-20020a05622a420900b003a527d29a41sm2668073qtb.75.2022.11.18.14.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 14:25:42 -0800 (PST)
Message-ID: <0f7c25cd-ed40-e158-dc5e-457995ab10ec@gmail.com>
Date: Fri, 18 Nov 2022 14:25:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20221116171156.112638-1-fontaine.fabrice@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221116171156.112638-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NVSUsGOr5sAoIfRgHf7/7vgNGPwmjC1NCKeIHmVilCk=;
 b=SYfLwO3fRYpzTwRQSPhCD6BfTsA3ZhP4Osi9rkQqQ4D2Fry/5gGUrM0TlSXDS+xn/U
 uW9PZiQTVNp+6fwnlpQKgnR29PcfkSmn4x3lGWjybMuxXLTJPnXCjUNodw4pX2bMdliY
 jvIMWg9tU9cb3c3a6F+C84ahIF7g149XWXOD75y0htCnsfrCCAZcrDGUI3QQ78SrtqYC
 97ytJnhIpODVoommR54vmilB33pYHG1ospA052kFtLp+/8xcYL9QiZaSLE4yN/piKNtM
 FG8Iyx01oct3yPgALIZ0808cvDrjXEAQn9jwckpJp4M3ctPDiYooUbRCGgauFqP/pfUM
 XEnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SYfLwO3f
Subject: Re: [Buildroot] [PATCH 1/1] package/gptfdisk: fix runtime failure
 with popt 1.19
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/16/22 09:11, Fabrice Fontaine wrote:
> Fix the following runtime failure raised since bump of popt to version
> 1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:
> 
> Problem opening  for reading! Error is 2.
> The specified file does not exist!
> 
> Fixes:
>   - No autobuilder failure
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reported-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Fixes: 895bfba93f6e ("package/popt: bump to version 1.19")

Thanks a lot Fabrice!
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
