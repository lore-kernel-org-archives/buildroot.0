Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E665C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 18:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DB7940329;
	Wed, 12 Jan 2022 18:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-L45QXrnq7q; Wed, 12 Jan 2022 18:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97DA940414;
	Wed, 12 Jan 2022 18:55:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6891BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 18:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C27784C2E
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 18:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TKsYt4nHUO6 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 18:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5735984C2B
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 18:55:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id 30so13809294edv.3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MYkIQjno8/C2X15ZsqjBYy0QOUC4+NNW12D+FF06MEU=;
 b=ZGu/vvPNEh31NswsWV3Oh0xE3pIXPyoGGwkW+OBgtmn+lhuuCNlOt+3DkXxBaivWyZ
 Vp+n70PS4s8DK6dKEojIzM73H6vOVzZknReVmiyDY7WDq6bNFgj1SN09UwN/U0gkaz3c
 SM9tJ33O+yo2UK3eO0I2h/61l3bx04sXjW5xuwPxXA44l1/gHBkVU3eUPQFwoZ2MdqD0
 GdZivgsvzX8QkOGeHAYgOusyV+dpIJ0Oq3quy+a4Pi5qZMMH5wpr34DwEbB4KJgNTPaP
 eFw33k6XnFsBayiIU0guIsW6+/LQj1EQa9bDyDUx5U3ZKCpq2hY1L0SzYh+Yvd08bweR
 lE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MYkIQjno8/C2X15ZsqjBYy0QOUC4+NNW12D+FF06MEU=;
 b=y1nnJb32BFupaUCpDDp4VJq9Xu7rFxlOsiGa319nKmFV/P7IPbVg6VHwwRfuglvq7/
 TDS3waFNXmsKy379vGfOPFb9Jh/1VFqk/sh88lgTJy+xffaYaCIh2gy9ITn9WUj3JO2C
 2kILtpJPIq0ocY0ZlvTWrYN3zPaiGnlWfeCrdb7KsKx1qFDrJWQrf08JQuTZs+AoIMID
 JL9TheHgax1XAs8a9dt3Md7JOX1o5WyuuZNVhpQPjdfBIgfAjgmagNgCvw+PQkwvJyHr
 jUzZu595MU7cGzjLvdv/aTKM5a0R5560SnplsKAu5xMo1sHLsLHAMy3UCZpekxg+jf1g
 QCXg==
X-Gm-Message-State: AOAM532wquWwhvjOKCHNazQhcdhzGPNInv3IHCKe00ko3zzJcUxAtC8F
 f6soI0AUuZ9j6ZP9T5VNq82xSw==
X-Google-Smtp-Source: ABdhPJzRCYakk3lDZvSi96L2SIWPKI30kLAfky0udHr8458usXWuIfVQCfdC78yqb/Hw0xZpqJ6N+A==
X-Received: by 2002:aa7:dd59:: with SMTP id o25mr914293edw.288.1642013704452; 
 Wed, 12 Jan 2022 10:55:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x1sm180152eju.18.2022.01.12.10.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 10:55:03 -0800 (PST)
Message-ID: <53b29654-5d59-26e6-4635-a1ecb87babe0@mind.be>
Date: Wed, 12 Jan 2022 19:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>,
 Alexander Dahl <post@lespocky.de>
References: <20220112132618.2634250-1-aperez@igalia.com>
 <20220112160512.GC6032@falbala.internal.home.lespocky.de>
 <20220112184729.GB23006@momiji>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220112184729.GB23006@momiji>
Subject: Re: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for
 CMake-based packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/01/2022 17:47, Adrian Perez de Castro wrote:
> Hi Alexander,
> 
> On Wed, 12 Jan 2022 17:05:13 +0100 Alexander Dahl <post@lespocky.de> wrote:
>   
>> On Wed, Jan 12, 2022 at 03:26:16PM +0200, Adrian Perez de Castro wrote:
>>> As discussed yesterday, here is a quick stab for testing and getting the
>>> conversation started about using Ninja for CMake-based packages (hence the
>>> missing documentation updates and the "RFC" tag in the subject :-D).
>>
>> I miss some general motivation for switching from Makefile to Ninja
>> generator. Can you add some reasoning or numbers to upcoming patch set
>> revisions?
> 
> Ninja is generally faster, tends to make better use of parallelism, and
> in my experience less likely to break in odd ways. Once I have a defconfig
> with a bigger set of CMake-based packages working I'll do some numbers as
> well to compare build times before and after the switch to Ninja.

  There's one disadvantage to Ninja in Buildroot context: until [1] is fixed, it 
doesn't collaborate well with top-level parallel build. This means that if you 
run with a toplevel JLEVEL of e.g. 24, you can easil end up with 40-100 compiles 
running in parallel. The problem already exists for meson packages, but these 
are sufficiently rare that they don't pose a problem in practice. I don't know 
if it's going to become a problem if cmake packages are added to the mix.

  I don't think this is blocker at all, but it's worth considering.

  Regards,
  Arnout

[1] https://github.com/ninja-build/ninja/issues/1139

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
