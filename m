Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3D4C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7517760E4A;
	Tue, 14 Jun 2022 17:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6-16vFs5jGF; Tue, 14 Jun 2022 17:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D8C660B14;
	Tue, 14 Jun 2022 17:05:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 617FD1BF23C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F9C440B65
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hxi_HfXH9h0Z for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 17:05:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21E9540A9C
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 17:05:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gl15so18431254ejb.4
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 10:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8kL31sq09D8Sa9IPjOlG/EUdwJHYr7hqIWtqek4V37I=;
 b=gaszsaxT7y8DZaogxGvwz74Dd48w/Cp0hg+3ZEm9rSthwUwg0LUknbbmfD8+Q5SgAz
 oVeNuykUOOUDIksq0j1fkgcnyYwmp3x1w4IEubQaokwhxCysTPAWewSsIfGl4PMRI68K
 /5+y1aztJKLQTozQrme3GUMNPZYJ2CBvhmBpyweD/evGOF6/YANp8Wk1VBmz5sObc8nK
 JYqT/TVjshep9bL619phFLLyYBghlf6mLZMCyAtcl9+eT5IVPSd2eALashyjU5KRNUnV
 UqyrTSw4IjvC6g/JY0H7ucpY/CLONPStGYU6nrqyknQIzFQGTw9qwZ2qUK+wchNAbp9u
 rjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8kL31sq09D8Sa9IPjOlG/EUdwJHYr7hqIWtqek4V37I=;
 b=hcRSTlWMsdkP7S5OS8n71OvFhGa5eiFHZJ5QaNak3100OvorNn6qE0eYQ42GOU3jIx
 BsFehOs8vukSisOka0MECD68aDETRC/U3STAT0cVGmnz5vg5I5//c3ATwXGmdetqit3J
 T5PyGV7AoYETyK8vAYZcO/HYBQVl8WGrZBmA0JqlnlB4qPlCdW3cbeS3ElBVlmoQ3ZHe
 oErjSYT6UVfGzHI+ZxPEn17qnfl/L1p2gjUKavJvvfsogjgH0745mP2tuHC8jzzSnchV
 +BXWF7cUCUzUvY7l62SedSlnOanyzeFROnqqKYYoVCy5QUC5K0TdZO6LQUKxv1bXFUdt
 ZGyQ==
X-Gm-Message-State: AOAM5320cgSoL6M4wxF2oNV+kxgqQvMCOGtLY5uo88NvyQg1xSqh93mW
 Ms1IaT0rgtWy1Q0t3fj7sy7Yy+YuvC39Fg==
X-Google-Smtp-Source: ABdhPJwVZtUjvG9CPUhhM7got9HvwnOjmKdt5doxba25L2l9an3tpx2JhQIYSso0MgPUejnQ1/u8mw==
X-Received: by 2002:a17:906:fb0f:b0:715:7e23:bbbc with SMTP id
 lz15-20020a170906fb0f00b007157e23bbbcmr5194439ejb.373.1655226300366; 
 Tue, 14 Jun 2022 10:05:00 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 vr7-20020a170906bfe700b00706c50870a0sm5246559ejb.194.2022.06.14.10.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 10:04:59 -0700 (PDT)
Message-ID: <b38adc9a-7310-2fd7-2124-79942812797c@mind.be>
Date: Tue, 14 Jun 2022 19:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <48ac54a1-f946-8f98-42e4-e39d2ab7130d@synopsys.com>
 <6592891c-1b2d-d1cb-f34b-3e96f23e74cb@mind.be>
 <fcddbfa3-9d7a-e809-630c-b157b5d6c8bf@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <fcddbfa3-9d7a-e809-630c-b157b5d6c8bf@synopsys.com>
Subject: Re: [Buildroot] [PATCH] package/bpftool: add a patch to fix cross
 compilation
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2022 22:48, Shahab Vahedi wrote:
> Arnout,
> 
> On 6/13/22 22:21, Arnout Vandecappelle wrote:
>>> The patch file should be git-formatted and have your Signed-off-by.
>> I simply took the patch from [1] (which has your signoff) and added
>> the additional Makefile.include changes
> 
> Thanks for the tweak. I overlooked the "Sign-off" part. I used "diff"
> because of what BR's manual suggests [1]:
> 
>    If the software is under version control, it is recommended to use
>    the upstream SCM software to generate the patch set.
> 
>    Otherwise, concatenate the header with the output of the
>    diff -purN ...
> 
> The proposed patch was made for a tar ball release that is not under
> any version control per se. With the hindsight, maybe I should have
> checked for "v6.8.0" as branch/tag in upstream repo.

  Yeah, bpftool is actually a special situation since the real upstream (where 
you contributed your patch) is a separate repository that gets regularly synced 
into the bpftool repo. I think that at the time you sent this to Buildroot, it 
was not yet synced to bpftool.

>> (of which I don't really understand BTW why they're relevant for Buildroot).
> 
> That extra change (setting "HOSTAR") is necessary, because in upstream
> that was already taken care of before the patch submission. However, in
> v6.8.0 release "HOSTAR" is never initialised and the fix is actually
> using it.

  Since we set it from the .mk file, it doesn't actually *need* to be 
initialized in Buildroot context.

  Also, if that came from a previously applied upstream patch, it's better to 
backport the actual upstream patch. But that can be complicated as well for 
something like bpftool, so it's fully understandable to do it like this. It 
would be nice however in such a case to add a reference to the upstream commit 
that added it.

  Regards,
  Arnout

> 
> [1]
> https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
> 
> 
> Cheers,
> Shahab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
