Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89B6C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 19:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 241B540A4D;
	Thu,  6 Jan 2022 19:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pa60_aQmlfDk; Thu,  6 Jan 2022 19:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0896040B9C;
	Thu,  6 Jan 2022 19:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E16951BF2A9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAF7740A4D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdxmh8ZkULpJ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 19:07:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B889A4019A
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 19:07:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l10so6692208wrh.7
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 11:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Edz7u43Ud7EafoKGDHCS4z/87W8Ym7qg3xyMZ6VJ1o4=;
 b=WiWDNYStlgYMitM4XeS+jBnkjllzDXg3XwYoeB1f1esXrr0beiLqoSJrbjjKFqZYNT
 klefthwNcSMcbrVH6dWMHUpJpG0hVevNYRWrIAH0ar6UyrQKQShKpIQjNN7GAm4Ls2zw
 b7fbi1lA4ww4sYBrxbL/ElWoLn72J2N12q7Cm+YygwgJsBA5a7S5qOA90gdmLJ432qev
 CwzESPpPJfjCp7gwu2J+lx/KXR21sFYBEwazXM04UxESwK0OUncX2nY0zg3aGSjgOn/L
 OAinxWi618z46WMMVNZpVif1iwYrrnAvOKrdxYkGH7Ja/Sc0HYC08hNG4VEwnOFS354K
 ob7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Edz7u43Ud7EafoKGDHCS4z/87W8Ym7qg3xyMZ6VJ1o4=;
 b=U3CbwZwV38xv4WsKbk4ueKwLcDgeCI30ZSsUQfXMpvB71sFOPNHiISmZOUjZCgShJP
 APFTUWahRB+L8JrC65w39HeQBjYrGAt/fH8vCTsqDXhf6z9h9Yu9vJ533BWPIrb9fvSS
 3vuzK8cYqyiWcJnNeERbaJe4ZOjFJunyQYRkxo7AWIo77cSUb0JLno/jL8YQ5WyweMSu
 H68It3+qzARC3+fn6xmyFpBlus6wkFv8T2ZwL92ougOVmUXWe0kiI1ZFMlLQgczkqEo8
 u0zN9FK1e3yhIFECUNbf1y/urI26ytn8ea6RrBnyrtVmTmsGJM8dkAYngo9i3y6ceJk/
 A4bg==
X-Gm-Message-State: AOAM530Ieb9j4qxyeu0WE155DvTCcMkf8B5sJf24YepK13a/FuHTifu4
 1U9H9P/iDlOexMt/MtgIfZVIww==
X-Google-Smtp-Source: ABdhPJynC4vKgaBa87NaGUOFjyl51URb8/aoRvjithl2rx6sdvRH1Z1s1scnjCVOC+/Z1Z59uPivCg==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr36984001wrn.177.1641496019934; 
 Thu, 06 Jan 2022 11:06:59 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b2sm3010331wrd.35.2022.01.06.11.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 11:06:59 -0800 (PST)
Message-ID: <de9d6912-6bbd-4412-47f7-094d1ea7fe0b@mind.be>
Date: Thu, 6 Jan 2022 20:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106185923.0cb1bb9c@windsurf>
 <CADvTj4q5R0TweMiHhtk_7XM6XT3u5mQ3_TF+m_M_D34Or6r1iQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4q5R0TweMiHhtk_7XM6XT3u5mQ3_TF+m_M_D34Or6r1iQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/4] Makefile: only check
 _FINAL_DEPENDENCIES are selected
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot <buildroot@buildroot.org>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/01/2022 19:51, James Hilliard wrote:
> On Thu, Jan 6, 2022 at 11:59 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Wed,  5 Jan 2022 23:24:04 -0700
>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>>> _FINAL_ALL_DEPENDENCIES includes _FINAL_PATCH_DEPENDENCIES which may
>>> not need to be selected in kconfig in cases where building is not
>>> desired, so only check that _FINAL_DEPENDENCIES are selected.
>>
>> Could you expand the commit log with some specific details of which
>> packages/dependencies are causing issues? I haven't followed the
>> problem and it's not obvious to me what this patch is fixing.
> 
> It's needed for this series:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=279567

  Well, obviously, since it's part of that series.

  I think the patch is wrong though. A patch dependency is still a dependency, 
so the package should be selected.

  The problem is that you add two target packages which have no Config.in. That 
is simply a no go: target packages should always have a Config.in symbol.

  I'm going to reply with more explanation down the line though.

  Regards,
  Arnout

> 
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
