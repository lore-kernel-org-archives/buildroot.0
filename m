Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C5AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 19:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7961360F96;
	Tue, 20 Dec 2022 19:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7961360F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDDQdeGWbqM5; Tue, 20 Dec 2022 19:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14DA60BD8;
	Tue, 20 Dec 2022 19:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D14DA60BD8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80D431BF36A
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 19:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C2B860BD8
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 19:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2B860BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ej-kLwv6465R for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 19:00:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E36607B4
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0E36607B4
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 19:00:30 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id f9so8933576pgf.7
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 11:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6D/tK7uqX+JiJt1i8TIa5FNfbp/HmUd/D4vvcJKlVQg=;
 b=pwl1FcRhWWsa2aLjshCTwUpaHvNNPFCgRkbN6AuxG57Y440ddKWXHoyLC+qt2rktGA
 7Q/eRc3jXNdhlqjSfANtbPlveyf6D4FgrlzvPKz14qL9q49zECNeNPSQoHh/tCHg+Rsd
 muQCVtUCw/aFCdR+ha0YRBhCTVBO3XPxybLaVGA/pxqhMCbp2j7UXl5QxFyFVmffgbs9
 WiiqBIs5K896753HRwn1U+vLgVL+qzdtxGT42h3F0AklhcMmRJg4vjkJfiurUXB77/7q
 59AFUkcQEjL774bagiV4BDZkVMt3e+QzuEJ743OLthNyIkbvfmsT4O3qcjhNxtyuSAP0
 PGZA==
X-Gm-Message-State: AFqh2kpvmRUX/c7bfhGZ6wWQXt/gYPnK5GBzq3/wv9K0M7Qyqz9tW/RF
 YjN0yQ8jeWHIhGPLXdxBPMA=
X-Google-Smtp-Source: AMrXdXuzNw+y1uqueQOIp/hioupVxuQuaPBIdcbZCLkfRQ6nFPJc0n80UMZ7EXDzxdLkLCMDCIABtg==
X-Received: by 2002:a05:6a00:813:b0:577:9182:19a7 with SMTP id
 m19-20020a056a00081300b00577918219a7mr20228038pfk.29.1671562830068; 
 Tue, 20 Dec 2022 11:00:30 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 a22-20020aa795b6000000b0056c3a0dc65fsm8968654pfk.71.2022.12.20.11.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 11:00:29 -0800 (PST)
Message-ID: <c6c980f5-c722-fb4a-5440-b8afb088d995@gmail.com>
Date: Tue, 20 Dec 2022 11:00:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221219230802.2602798-1-f.fainelli@gmail.com>
 <20221220083106.GD2909@scaer>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221220083106.GD2909@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6D/tK7uqX+JiJt1i8TIa5FNfbp/HmUd/D4vvcJKlVQg=;
 b=m/awyodPcDkTqm1b+CtF00WIQWo6suxVZ9JwcAse7zq/MMuC9Fw1BZwBN0PJl4ppAs
 FIgjotPSp8gyj0cfs6nu5LnAjvLs4iv8qrFL5qyTvSqhMso6mXCX7KvT4ezTlAaQE928
 aTR6Vo4Upeh61V5lAg/79r2GdmpSZ6+e+FPvir76fRIJgepGUPAOsVWxBriB3YUvp7+s
 3y2uwNtzSHzfViHwp4sCOWc1gTU0IBGzCqkZggdGff5w9oO8XcIB09m3giUh34n0Tdiq
 G8Sh8hPvzIzU88+bn7mrdYvmWlRZ4wDr+7EN7V+8beLG67GUJAFuwSo3tsY3+TJKroko
 G39Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m/awyodP
Subject: Re: [Buildroot] [PATCH v2] package/libgpg-error: Disable unused
 files installation
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 fontaine.fabrice@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/20/22 00:31, Yann E. MORIN wrote:
> Florian, All,
> 
> On 2022-12-19 15:08 -0800, Florian Fainelli spake thusly:
>> Disable a number of unused files that were being installed into the root
>> filesystem and thus inflating its size needlessly:
>>
>> * Disable the building of documentation
>>
>> * Disable support for other languages which is comprised of Common Lisp that
>>    buildroot has no package for
>>
>> * Only install binaries and shared/static libraries, remove libtool archive
> 
> As Baruch mentioned in his review, disabling the documentation and
> removing headers and libtool archives whould already be handled by the
> package infra.

It does, I was looking at the target/ folder instead of the actual root 
filesystem, my bad, thanks and happy holidays.
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
