Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF3EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C48CD40185;
	Sat,  8 Jan 2022 22:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mP0a7Kz8oBNY; Sat,  8 Jan 2022 22:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6CAC40232;
	Sat,  8 Jan 2022 22:28:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 126D41BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DACE81465
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIX4MCjCXNdC for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:28:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0CD981460
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:28:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k30so1179344wrd.9
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZIM52xLQk8TstAGIRHWFwKhlOH/TzzXVlR/BtMxKTyE=;
 b=LNQlDSXhUrZ4KzKrjLObrjp7G98weFKes5d9xr4AuTUfNkCuWrtYuSnMntMaAE7K/A
 kV7vwB4Aag86XSqvghcLjTym1Wd9oOJXNn84ORCyameMSuOwuY/JK3BaA9YCl69CAOOB
 vvxGIitWo4hyz6XkHG+UORQeae1tukb0J6ddriNwT2EXGgtrpPolBNj3N0S6XIg1o/j2
 5EHlFN76FhckpX7DFkYztPDGOe5iWKT+XyoLRjjkrxFNB1QP9glBo+XGjPyXc2M4GXJm
 txFu3qHYD41PAJZ5XKbPqk0lQWiWT/SnDZBQ1wBOtQSUInpzBh7TQOmlUTxz/XM17DrX
 YWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZIM52xLQk8TstAGIRHWFwKhlOH/TzzXVlR/BtMxKTyE=;
 b=mvBZGGT8tc4JbIo3HE7wotVJavyQzmZsj7gMlkD2YfLhmTDAH7MZTp9t8FitauiJYe
 TLiUcnbU01/05YWf/UQxFma9KJS2IwUWviBRKlRGvdOugjCdl4YoZ6eosht6TPH39oIh
 3pF3Rkmz++2sZvpj8zMzCxovX912UesOLVRZC2/TFGB8zaJfzYf4o/eWdbwe9iinJaAH
 XvPsZJpC4VOwd1DpMpq12Dfu4dmW3SNH231of836Aj4XkzcSKbSeaCD+dyOWZ2AQw7yX
 p8vBuhQ8wAWzkXSKiVf76I82u54eAV66YURiFK0/kGIMWHLKX7neLO64z7MPLyvdSxfD
 N95g==
X-Gm-Message-State: AOAM533nVVZPXJ38Y66y0sIj3inGpwqPvCJ1F3feNZCsfSbi+3ATiCct
 Fj6F9XL0UUo69lSGf6B3TLBVeQ==
X-Google-Smtp-Source: ABdhPJxY5mgdhmcc+8kJKmK2PYTdNKmLtg1q298s2CJGp54kVIuJFGi1UnPl8aMwWZZhtDsRYeCVFQ==
X-Received: by 2002:adf:f5cd:: with SMTP id k13mr4591774wrp.673.1641680930110; 
 Sat, 08 Jan 2022 14:28:50 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id q8sm899534wrz.66.2022.01.08.14.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 14:28:49 -0800 (PST)
Message-ID: <516a0c55-6d67-f46a-b60b-4475b043c971@mind.be>
Date: Sat, 8 Jan 2022 23:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>
References: <20200825000246.4035-1-joseph.kogut@gmail.com>
 <8bcace28-352f-1da3-51c6-0de868fa429f@mind.be>
 <0570b1f3-5229-5c0e-796a-53f8747b540a@mind.be>
 <CADYdroOi1mE2a1bgMgnX2dVuS5SOwPO6qNEkz_zTwEOud7pCXw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroOi1mE2a1bgMgnX2dVuS5SOwPO6qNEkz_zTwEOud7pCXw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] systemd: ensure tmpfiles.d/legacy.conf
 is installed
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 22:17, Norbert Lange wrote:
> Am Sa., 8. Jan. 2022 um 21:40 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>> On 08/01/2022 20:12, Arnout Vandecappelle wrote:
>>>
>>>
>>> On 25/08/2020 02:02, Joseph Kogut wrote:
>>>> Systemd doesn't install tmpfiles.d/legacy.conf when sysv compatiblity
>>>> isn't enabled. This config sets up /var/lock, which many programs such
>>>> as uboot's fw_printenv/setenv still depend on by default.
>>>>
>>>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>>>
>>>   After all the discussion, I did finally apply to master, thanks.
>>
>>    And I ended up reverting it again - legacy.conf is now legacy.conf.in and it
>> needs to be preprocessed, but that is only done if sysv-compat is enabled.
>>
>>    So if we want this, our only option is to enable sysv-compat (which is
>> probably something we should do anyway).
> 
> Why the only option? you should just ship your own legacy.conf, it wont change.

  I meant: if we want to use the legacy.conf from upstream. But you're right 
it's not the only option, we could also manually sed out stuff from the .in file.


> Adding sysv compatibility, which is alot more than just the mkdir and
> symlink, would mean adding alot baggage.

  Ack.

> Baggage that wont even work as Yann spake thusly [1]
> 
> a tmpfile.conf with those 3 lines would be enough:
> d /run/lock 0755 root root -
> L /var/lock - - - - ../run/lock
> d /run/lock/subsys 0755 root root -

  All right, I hope I remember this by the time a see the patch :-)

> 
> Norbert.
> 
> PS. I am too lazy to google everything up, but I believe I brought up
> this very topic before.

  I'm also too lazy to google it.

  Regards,
  Arnout

> 
> [1] - https://lists.buildroot.org/pipermail/buildroot/2020-July/287275.html
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
