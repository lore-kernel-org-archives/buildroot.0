Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C6CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 09:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9B5741CA3;
	Fri, 29 Apr 2022 09:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmU7liDryzfB; Fri, 29 Apr 2022 09:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F0441C9F;
	Fri, 29 Apr 2022 09:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74C711BF344
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 09:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60D5741C9F
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 09:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkzUqFGkUe5m for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 09:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11D5F41C9C
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 09:53:10 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g23so8422649edy.13
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 02:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ohpqSO6N6pZ3pQGJcMaTOS6reMAwtTYfivOnbJ9pYTE=;
 b=emRMkvBmdxLoEnziilUH9wsBfpk5ejlahXeO0NbQ/pYlcQvg3aB3iDkrK1kDj+DRqi
 8wK00Ba8D2oX+jgeFJ9JajP0XH1om08vpoZBzl+UOKimgGlO6t1cpuTuEhbs3LEEgKuT
 uxpMHYKjE51SBLQj2+6hK/Y9zZSgVigfrMNoJsufNjTc4Bhu2jsEuQPy4UxSg8/6JFm3
 /wahEMxKQyzuDJ3ZLtWHPh+jtsmrWp0fl3h6zl6ocYuNKolkH40dSTK/Cm8xYgdfWOH5
 sPIGF2hBgxzGCkSe9vU/NX161xHYK24wqI2skvUh7s18qpGCgXbmmr44WCfcWFN+n15s
 GJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ohpqSO6N6pZ3pQGJcMaTOS6reMAwtTYfivOnbJ9pYTE=;
 b=YZl32IBL4FgyXb2GPXNpM6govIEX5GHcaMRtxsrEmdyCN8EY6NN7R7hmfR5u1nRslX
 RgRRKGpkN6I7qr7fVHXQYNypoYggWveZldZQn2jylQdrxpwz7m4BEh55u1gWP906N0bE
 GPK9xYQ0zl++/QE3VTeo9f86lHGFN5j3DFjl7ls+m/s9SZyy1PxTIqeWQOUKrE360WTl
 2bu/AJrj9/IMN5U89esNgsURNlhq5q6GteOuyezzOdpOdWhZqQ6PdFCB1bSH3ZsF3zQI
 ntgW0VSOvPPaAK9QRKVU9eF+u5o95s2k+AbwVj7QJBDE7naNLNw4jNTUwAgTyWFBqbu6
 bs5Q==
X-Gm-Message-State: AOAM531nDBmA86q0MwLSG0A/P9CdOgyMDEPad9Y+7WopoHqq2TqOULFZ
 7M3wpUUhN+rVJfEE+LkDk6Nu7w==
X-Google-Smtp-Source: ABdhPJyrmoduK4o9eZ0BGmg0VYwk/n/vNQN99YnPOYNPcvDlPtQfe/WGYDAknp6W+2eGQldye6nl6Q==
X-Received: by 2002:aa7:cd0a:0:b0:425:bc13:4ccb with SMTP id
 b10-20020aa7cd0a000000b00425bc134ccbmr38577905edw.229.1651225989022; 
 Fri, 29 Apr 2022 02:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q8-20020aa7cc08000000b0042617ba637esm2737826edt.8.2022.04.29.02.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 02:53:08 -0700 (PDT)
Message-ID: <3ec51ca9-f5d5-bdcd-49a0-5a44729bb65d@mind.be>
Date: Fri, 29 Apr 2022 11:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220427035039.1664864-1-james.hilliard1@gmail.com>
 <20220427103102.7f934c1f@windsurf>
 <CADvTj4og7yAZT69jVo8=5yHSppj7ih7dsUAy6hH+zib7HEi51g@mail.gmail.com>
 <2c51f9ba-5d02-17f7-98d0-8a4c1b6dcf79@mind.be>
 <87y1zqi902.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87y1zqi902.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop libressl support
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 22:09, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>   >>> I don't have a very well-informed opinion, but perhaps we should think
>   >>> about this?
>   >> Yeah, not really sure, it may be useful to keep around, I think it
>   >> has an
>   >> alternative updated API to openssl's updated API that may be desirable
>   >> for some use cases, although probably not the most commonly used.
> 
>   >  At that point, however, having libressl as a virtual package
>   >  alternative for openssl becomes less and less realistic. Virtual
>   > packages should only be used if the alternatives can be considered
>   > drop-in replacements with compatible API. A few exceptions are
>   > acceptable, but it's becoming too much.
> 
>   >  We should also start thinking what to do with openssl 3. It has an
>   >  API that is somewhat compatible with openssl 1.1.1, but there are
>   > almost no packages that can use it without any changes. This could
>   > actually be an opportunity to get aout of this mess: most packages
>   > that are not compatible with libressl are probably already compatible
>   > with openssl 3. So if we introduce an openssl3 package, we can migrate
>   > the packages that don't like libressl to that, and leave the choice
>   > between openssl 1.1.1 and libressl for legacy and BSD packages.
> 
> That indeed sounds like a way forward. Do we expect most applications to
> (already have) move to the v3.x API or do we rather expect to have to
> keep around openssl 1.1.1 / libressl for a long time?

  Fedora 36 has openssl3 as default and openssl1.1 as compat. So I expect that 
the flagship packages will support openssl3 by now, and it will take years for 
all almost-unmaintained packages to get updated.

  Unfortunately I know of no easy way of querying reverse dependencies, so it's 
hard to evaluate how many packages currently still need openssl1.1.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
