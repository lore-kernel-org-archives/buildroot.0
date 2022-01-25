Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8A7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 20:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51732409C0;
	Tue, 25 Jan 2022 20:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFBjVnx8NJ1a; Tue, 25 Jan 2022 20:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C0C9409D3;
	Tue, 25 Jan 2022 20:49:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75A631BF5A1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62C92409D3
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W77J9PxGCwWH for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 20:49:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E8A6409C0
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 20:49:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p15so33434302ejc.7
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 12:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DyANQla+ueHlicmYpvvucgk1Dak1LjdgaQ1grF7Zyso=;
 b=BTq+OLp3khYhHSw1453KqR3r6LFdP8S+dZYomYxLC7/yOXq0zb/CPQ9ddP0tDAsY2s
 fSKIze3Q4cSjJ7eG7Mqs43Aut76V5gsEoa4TuuIkEeiSwhK91MTcpyxVrOVSJyWCKEyq
 S3ROhdScbvb5bSOYUeGnDtECFY9EDlLDEmqyky00euJl+oujQ41tv7Q/Zsa3XvYfzXxA
 O7R4/Y5kEgROtiiT288BnVIwykGuFoVoewlM8XjDZNbvAhTRv5S7AzodCvqYnIumX7fo
 Vtjr3ADLdy80zFvKZdJtHSy6Iesf9bIIi0CmBs/KBl2uuoD4a+JMRbSYH3qYmW3Uh5hI
 6Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DyANQla+ueHlicmYpvvucgk1Dak1LjdgaQ1grF7Zyso=;
 b=tn9F+vUPQM6OCArE4KTI5xRgkejxEOtXLZYjUZivPtT7rsYeB6mvcEu0N6Lq0qYav5
 1tJYAEfmHhwBT2+VX+VEGww1TG8OJM54C32JOvsy6eCO+UdyIKYYKfg2rS2WrCjBILV4
 DA7FoaYaH7al61lFvhNF0sVxkRVSf3xhttto6JIM0zW0JmEJJzP0xB9zy5CElPwO07CE
 Lk4F8ja4bPywQVS5a6EiAm4vb2NJ7a92HUn5eAfQtXeu1q2vONWpBFPr234yu9ZYEt2s
 VSWEkN5I48rpZuf7Dc5E1OTxrbmiSsSs9vJvNMoenw3aL0sLq9NJgucgQWf4lJSZ9WUy
 +aQg==
X-Gm-Message-State: AOAM533/IMdFml8ZADSuyJ+gId+o0O4tpGDTyynuifnBxnATNGnkSuCZ
 ATXlupk8373P+b8d9IUIh31/IYmrQABUvQ==
X-Google-Smtp-Source: ABdhPJxhNgPX5ruH/JhhS4YaWDkubh4VJi9PKf58N0NeiPa8YOsWFu2uBJZ3vHF2IBJPLyqDSSLTzw==
X-Received: by 2002:a17:907:a088:: with SMTP id
 hu8mr17084124ejc.528.1643143758593; 
 Tue, 25 Jan 2022 12:49:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jl17sm6687543ejc.16.2022.01.25.12.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 12:49:18 -0800 (PST)
Message-ID: <27e2c9f6-8ed6-b23e-ba39-9f04e29f4590@mind.be>
Date: Tue, 25 Jan 2022 21:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1642875217.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <cover.1642875217.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 0/2 v2] core: fixup PPD paths (branch
 yem/ppd-fixup-paths)
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
Cc: Louis-Paul CORDIER <lpdev@cordier.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andreas Naumann <anaumann@ultratronik.de>, Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/01/2022 19:13, Yann E. MORIN wrote:
> Hello All!
> 
> This series builds upon previous good work from Andreas [0], Louis-Paul
> [1], and Adam [2].
> 
> The first patch is the core of the change: rather than have multiple
> hooks that each cater for different types of files (.py, .pc, .pri,
> .cmake and so on), we jut do what we already do in relocate-sdk: we just
> look for all text files that have a PPD prefix in them, and replace tht
> with the current package's PPD.
> 
> The second patch ensures that we can build reliable files lists, so that
> files we tweak in the infra are not believed to be installed/modified by
> the current package.
> 
> [0] https://lore.kernel.org/buildroot/20200217212350.29750-21-anaumann@ultratronik.de/
> [1] https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/
> [2] https://lore.kernel.org/buildroot/20220106171720.12857-1-aduskett@gmail.com/
> 
> Changes v1 -> v2:
>    - use --binary-files=without-match, as this *considerably* speeds up
>      the fixup  (Arnout)
>    - rename the python fixup  (Arnout)

  Both applied to master, thanks.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (2):
>        core/pkg-generic: fixup all PPD paths in a generic fashion
>        core/pkg-generic: apply post-prepare hooks before monitoring directories
> 
>   package/pkg-generic.mk | 47 +++++++++++++++++++++++------------------------
>   1 file changed, 23 insertions(+), 24 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
