Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0480EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 16:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75CA484456;
	Thu, 19 May 2022 16:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wcrTui9nAE1K; Thu, 19 May 2022 16:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D06284447;
	Thu, 19 May 2022 16:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5D11BF37B
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 256FF84447
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5U2HTrPdxBFq for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 16:19:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DC2284444
 for <buildroot@buildroot.org>; Thu, 19 May 2022 16:19:07 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f83983782fso62040177b3.6
 for <buildroot@buildroot.org>; Thu, 19 May 2022 09:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+0AhZ29yDLoA1n6dEB0LFD2Uckyx24t4hlH8O7Gstb8=;
 b=eB3+u0cKsgoPRwiMmPPVjr73NMkpK/6Fn24dykNrSV8na+zuiebj1GoxLmEX4Hmluh
 Pvw7Mkwa6NfG/0QlLLNQ61UHDkuEDFIQ+09+6tnAW3raj3TPEofDGLVsXKmk55bKaiOe
 ADaDb9NGmxXDhuV0jpAyws6o4JHRwS71oHCJclb2VFgXHc9ODh9cy6UVIH7eQ3/WP7aI
 zYkVjxK7HlwSW/6WIsMlMhv3qFBJjWCNWC4Qq40yDXR8LO3FJsJ4l3wnFw/buvfrcHdy
 0AOkouf5g18xjn/95Dt7y1LmAQv0k7eHyYhETca2g2LS+tCKFZO+iN3ZBDb9LAfAETIL
 v+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0AhZ29yDLoA1n6dEB0LFD2Uckyx24t4hlH8O7Gstb8=;
 b=kdC3jmuy7Le7yLMzNJfWfYYTGOuJ76GQrnf96fml0hHNEsP73s71oS8G/uUeE0jzDG
 LqX6Y6Kj4Of4/5by/BydyQfrGjfOTJLZBDxAWRkJqWclATZOHrlhxaq4GEs2Ps9eZtAN
 I1jHEiNI4DdGyW9D08snyHMpt1OrO9HwTwjgBAety1ppL6KgtkyI/6o5xYhqmM+snFlC
 EhOA7sXxAc++dtcYz97xVWT4nnrh4Cyz4ZW/2b659mrVVazpAc1JS7bRp3QUVvhU3LfT
 XFL7wadFp0GIs/E5C8XUCr184jN/cRtaPUJqjeeaOxjvQA0fwicOtCZl8Yab5IcAqjAt
 A/4A==
X-Gm-Message-State: AOAM5325bycSqvsAPLQda2rn+/izBdHdfAJloYmD806lPq96m4v94kpO
 Y+HC5L74fQe9TwSVf4OHVQkw+Vgzuqm6d8P9W0U=
X-Google-Smtp-Source: ABdhPJxRkIpMgBYaSGUALUCCoIXWgTn+EU7Td0lSJ01KN6XDy2dzrSUHFDMiU93mwIwOz8KXyyf2ovfuIL7YK9r2DJU=
X-Received: by 2002:a81:cd6:0:b0:2f8:98ce:f053 with SMTP id
 205-20020a810cd6000000b002f898cef053mr5447997ywm.327.1652977145926; Thu, 19
 May 2022 09:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
 <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
 <878rr88joi.fsf@tarshish> <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
 <87zgjo6j6s.fsf@tarshish> <0f1fa89e-fddf-5448-b352-e70966056c2e@mind.be>
In-Reply-To: <0f1fa89e-fddf-5448-b352-e70966056c2e@mind.be>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Thu, 19 May 2022 18:18:54 +0200
Message-ID: <CAOiXNkAPgn1S4uvqQBeZ0JBYsm_e6hhHmP9QYw+2BB5JEEGY9A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Alsey Miller <alseycmiller@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

>   So I guess this patch is actually good to go. Updating BR2_CMAKE_VERSION_MIN
> can be done in a separate patch (but isn't strictly required).

Is anybody going to actually integrate/apply the patch so that changes will
be available in the next release?

Thanks,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
