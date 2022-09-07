Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7684EC38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 23:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A6CF83E61;
	Wed,  7 Sep 2022 23:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A6CF83E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivz_31e-rwKp; Wed,  7 Sep 2022 23:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E60083E16;
	Wed,  7 Sep 2022 23:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E60083E16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB6A81BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 23:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EB04402B1
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 23:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB04402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggwoJJ2Nbkd4 for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 23:00:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E844012B
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48E844012B
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 23:00:05 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id s11so3647831vkb.5
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 16:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kSHm8P11YF82tCndaGI0OOlYWzm4onr2ouFJvUsO7aU=;
 b=6W+TH+WDt+8scmMrtSRGHaNAg3OE+SMKA6kfSfPU8DCimU4Q/IMpWtbqGsc7VlOudJ
 s+CVJp4jmeNnzP+XlZvghkIQ1CubIKOz5+bCiqBywI3LD6/NOHyE0R9kHplYW5N5j154
 S9bij7vASNZGKeCt7S4ySQg8HfQunonTy5tVL6rgFNKuqUhOHlsBTBBXF7vJ62gf+JTz
 mSmnBeBzWqck302GaBjMU9BVXlaCnWeOkVh2dVvvHR65hB9yg0c9rxlXL3jkm8rdTLBG
 rpyhuOQLe4AxCYU3v391SD/tT5+VGPIYKPDA4e1Gbb/+SBoSv3O7S2HjONZ2zH2oKSZB
 4gIQ==
X-Gm-Message-State: ACgBeo122B/6sLM0LGzgooF1XSfVWdY4iZSiM649ha2CxAzSbOo448wR
 KOLhVnNFQSisQLjFQ+TmNuZVckJicJqZjp50JaE=
X-Google-Smtp-Source: AA6agR6LLvwB2BHmw1djaUi5P3bISoeYZ7JTiUp7lNfyeFi87Q0t4FrEKQphd8pGpH3Qo7L/7UTYZZ3XzQiMtACHSdg=
X-Received: by 2002:a1f:2749:0:b0:393:b7ad:c976 with SMTP id
 n70-20020a1f2749000000b00393b7adc976mr2182182vkn.30.1662591603723; Wed, 07
 Sep 2022 16:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220904200409.3153993-1-romain.naour@gmail.com>
 <20220906155656.GG1585594@scaer>
In-Reply-To: <20220906155656.GG1585594@scaer>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 7 Sep 2022 15:59:50 -0700
Message-ID: <CAMo8BfKHKuVC86uOwP0z8CzE425q7u0B_q6jdeU0Rw9upaiY=Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kSHm8P11YF82tCndaGI0OOlYWzm4onr2ouFJvUsO7aU=;
 b=BKiJ0GQ5ayI8aOkaMY2X5s44MlRZ9Ga5r96JIj9tkvRHITwfeyYl8iGLwM6Z+G21Ug
 3+mnwiR6k5Bs4EBddG1ibJVg7VAmHsxsOSLu/d6sfg5YZUKzohp3A7yOPJ4EiIO8P85p
 xJ4jZe3qOjUjE2iZgNkF2WtphArXv1vnD0AB71IKkftTNy4XZa6300Y0y5GKrq8KGPr6
 D2wi3UAat544flGwusaN5ElAQNEadSYkuEBB8t8GckCNjNUOhVC7aBU5sPj84s9guOmw
 +kvaJI+pdvbxOIoBOsEkjL93Qfl16OVI1vQBqATfJSKDHkMRSc9MTh9jVn97kFvizu4r
 rw1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BKiJ0GQ5
Subject: Re: [Buildroot] [PATCH] arch/xtensa: xtensa little endian target
 requires an overlay file
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 6, 2022 at 8:57 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2022-09-04 22:04 +0200, Romain Naour spake thusly:
> > Using a custom Xtensa processor configuration select little endian
> > by default. But xtensa for little endian requires an xtensa overlay
> > file containing a version of xtensa-config.h header for gcc setting
> > XCHAL_HAVE_BE to 0.
> >
> > When BR2_XTENSA_LITTLE_ENDIAN is selected, we have to check if
> > an overlay file is provided. Error out if BR2_XTENSA_OVERLAY_FILE
> > is empty.
>
> Well, why don't we always check for an overlay when BR2_XTENSA_CUSTOM=y?
>
> Indeed, whether big or little endian, if the user selects a custom
> xtensa configuration, they better provide the overlay for that
> configuration, otherwise that does not make sense, and they should be
> using BR2_xtensa_fsf=y instead.

This sounds perfectly reasonable to me.

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
