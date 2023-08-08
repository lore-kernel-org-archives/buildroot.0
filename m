Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F04C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C25C82130;
	Tue,  8 Aug 2023 21:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C25C82130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xh8zUFS9Seo9; Tue,  8 Aug 2023 21:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5708210C;
	Tue,  8 Aug 2023 21:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5708210C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4679A1BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D01640494
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D01640494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMJe9yrOzF1N for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:56:59 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E4754011B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4754011B
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-565331f0736so45808a12.0
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 14:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691531818; x=1692136618;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGuyFWKLlBZTLhujVXLPsd2Dvx97zVH1tn1bRNP4Wjs=;
 b=fhRUFZwcviGN6GIaJVahWuZitvpSOnHG/KtYVrlU/YhG7KxEImhbqYEVl2aoJ1my/q
 ZPHPhK1KQa+LxpgHwo3kbBi9R0IjPjapQvN8BR+LOphfTCD45AjHwda+oLXNN2ILGffY
 3cRlQ/NPFKomchOe8Ke3seue1VoO/dW8VbAhrSTLtZFDJwGRuxq6jKFMsQU+3wUZ9S6F
 bDmUsniLzYcio7nhtD6TJMYkJA0oL0QLgLJNVFfHKk6zfHE8b4mp9aRmLvDJ4Yn7nYHc
 izOY4JtCAAvy4mcfB88HulILIN6JCZ2KK0xVUjhtIoxI2P6Um9EXvmItB1Qyjx78HgdL
 Lo0Q==
X-Gm-Message-State: AOJu0YwR0quvk/XkR9ZShIB9rm78YfjVs+7/oEZn/F2uWoWgrTkLKme4
 vf7l9LWrwHCM8myref5gZOLBwg4ZeyY3bg==
X-Google-Smtp-Source: AGHT+IGMQvN8GZC2byPhIoCLcgVbwrcE+5nT8j6DUQs26Rga06ulSxlIC/ui6LcjtjcVm055ci87mg==
X-Received: by 2002:a17:90b:1284:b0:267:f66a:f25f with SMTP id
 fw4-20020a17090b128400b00267f66af25fmr735393pjb.11.1691531818366; 
 Tue, 08 Aug 2023 14:56:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 8-20020a17090a198800b00262fc3d911esm23404pji.28.2023.08.08.14.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 14:56:57 -0700 (PDT)
Message-ID: <a811b514-4a8c-7659-c70a-f86c8915251c@gmail.com>
Date: Tue, 8 Aug 2023 14:56:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230808214153.1453666-1-f.fainelli@gmail.com>
 <20230808235433.671b0ca3@windsurf>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230808235433.671b0ca3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691531818; x=1692136618;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGuyFWKLlBZTLhujVXLPsd2Dvx97zVH1tn1bRNP4Wjs=;
 b=E0/q6jBUMyMmXxfP0lg9z5J3DGNHxKet7uuHb+5LKfSEp6gtNLvMA7HRbwgUWV4oe4
 3o+JCx+znbVPs0fF9fXcb/qqfkCKKTJlCV6sdfQ4xl3sj3UrBJKlQgVPau6vY0eTvvLs
 02YdUO+yok03IQ4yo5URK6P4bYkGYVL+Ltkj4ipvnC0SLC78+/qqQ84F+vHKpBX/nbaP
 J/HSLLcm3hF9bfRUHt2zIa+cG4EtnuqT4EF8wBvAL2pwRwqIS/BCQnwNmvWiP4Rw1eEU
 H3Qq/R9vEvl09N/BA1exRBmOpIf/PbGyd8N2e4waaboJt4yRidaI3EtLqmRhGXbpekdb
 0xqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=E0/q6jBU
Subject: Re: [Buildroot] [PATCH] arch/mips: Allow building for MIPS IV
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/8/23 14:54, Thomas Petazzoni wrote:
> Hello Florian,
> 
> On Tue,  8 Aug 2023 14:41:53 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> MIPS IV is an older ISA than R1 but is still useful to support older
>> MIPS-based systems (e.g.: Cobalt Qube).
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Thanks for this patch. Support for MIPS IV was initially in Buildroot,
> and got removed in 2014, as part of:
> 
> commit dd45fe0efb678a8a674330ad46b7641a3284dff9
> Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Date:   Mon Dec 1 11:16:59 2014 -0300
> 
>      arch/mips: remove deprecated mips1/2/3/4 support
>      
>      Remove the support for generating mips1/2/3/4 code since it has been
>      deprecated for more than a year now.
>      Also remove the unnecessary kludges in packages for it.
>      
>      Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>      Acked-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>      Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
>> -	  64bit capable: 64, 64r2, 64r3, 64r5, 64r6
>> -	  non-64bit capable: 32, 32r2, 32r3, 32r5, 32r6
>> +	  64bit capable: mips4, 64, 64r2, 64r3, 64r5, 64r6
>> +	  non-64bit capable: mips4, 32, 32r2, 32r3, 32r5, 32r6
> 
> This list is quite odd, because it's not even an exhaustive list of the
> MIPS cores that we support.

Good point, I suppose that should be addressed in a separate patch.

> 
> Is mips4 supported by glibc, uclibc-ng and musl?

Yes, all 3 C libraries still support mips4.

> 
> Since IMG kind of gave up on MIPS, we have difficulties in getting some
> help in Buildroot to maintain MIPS support and address issues, so I'm a
> bit cautious about adding more MIPS stuff.

If there are not too many issues, I suppose you can CC me when you 
encounter them and I could try to take a look.
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
