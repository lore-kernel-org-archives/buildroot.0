Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB50C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 21:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E498417AB;
	Wed,  6 Apr 2022 21:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtUjoneBfi7X; Wed,  6 Apr 2022 21:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DA2B417A5;
	Wed,  6 Apr 2022 21:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8601BF57C
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 21:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CA4A417A5
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 21:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lhyw6zyGn_uN for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 21:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EB484174D
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 21:50:08 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e2442907a1so4050913fac.8
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 14:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M2n1Mi4rRtzcw0e8OFWLbawA0cK46v/i3n5REVfCZls=;
 b=IlrKp3j5gr8SKT12xYWbW3nBJZOhetR2uvxwub4zZimdrG7arMVDrM5ygThv3VP4nJ
 lBLqoa8aeKEug+pjHszDhMwcgAaZzkAGH4tDEofskHenRb6fAfEAXyUsrNvySvVhMqdk
 qNPwSAquaQP6irKRtldisLR8nVHrL1Fzc/hM7O3PhStp/b6ZFZo98RWvqSgl2YeV/vUI
 N4n5dWZ/kQ9p7iaxN1J/jIwi7BconX/ch23PLjlpJALuHJWev6oFGtxmhWr1ziciSBVc
 1Yr3CztD8iSgncCTdZIcEGNuZKcCW/AjLB5Tyn11STR2l0HXnb6/nxk8y1fHtLs0c8gn
 1Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M2n1Mi4rRtzcw0e8OFWLbawA0cK46v/i3n5REVfCZls=;
 b=LB2wX8n93SbqWw0oWCDbL0bZHRhBrp5NvbALL4YXGDZrWa2DQ3gZAl82ilahSH+Kse
 KPNDhsJjGHk9vGPXTpESmWvF07vYy4CJBcD9evs0UGDhNxP0t8Epnw5+ToP/UBKPU7cN
 U7GzJSMSpL4BkTgE+6RQt7NIWRAON0ju7eBdivXuAJu63nALfmUmewcvnshszfkFReHP
 WN5DAqnwNJjKbxQZWGVlXrYxAKWvrp/lJfianveBWwo2jUUODWR62DKu65Nv1WecKQ9f
 xlUCyihC+A4WaJbfSBv6llskTrEyV9+XuTP5WUPGgzP75yFfT8QSwKRKFvoOWhErsk9t
 u4hQ==
X-Gm-Message-State: AOAM531kQ1PtKBUL7wzXeRwAfFpmw1HS2TRcGu9cv73ffN5JyVLzhhFz
 RYUZgXUi5xcbZbT6oEO3zDN1QTVsE1B07KnKfAM=
X-Google-Smtp-Source: ABdhPJzkZKp8ZkYP1y8yEqPJAu0G8OmRHtzqJmTQNX7LQ78D6/8MBSPcYL34epvp4eeoKowi+xWU5kPm+sW4ldjjG8E=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr4662736oaa.200.1649281807865; Wed, 06
 Apr 2022 14:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
 <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
In-Reply-To: <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Apr 2022 15:49:56 -0600
Message-ID: <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
To: Emile Cormier <emile.cormier.jr@gmail.com>
Subject: Re: [Buildroot] [Feature Request] Host cmake built with the
 --system-curl option
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 6, 2022 at 2:13 PM Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>
> Thank you for your feedback on this request, Arnout.
>
> Buildroot's cmake is being executed in my post-build script instead of my system's cmake. How do I make my system's cmake take precedence?

I think you just need to update your system's cmake to something that meets the
required minimum version:
https://github.com/buildroot/buildroot/blob/ac91235797fe9b234fb820c0112f21c26be1349f/support/dependencies/check-host-cmake.mk#L6

>
> On Wed, Apr 6, 2022 at 11:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 06/04/2022 04:06, Emile Cormier wrote:
>> > When using cmake while running a post-build script, the ExternalProject_add
>> > command fails when the URL option is used to download a source tarball via
>> > https. This is because the host cmake is not built using the --system-curl
>> > option (https://github.com/Kitware/CMake/blob/master/bootstrap#L660
>> > <https://github.com/Kitware/CMake/blob/master/bootstrap#L660>).
>> >
>> > Without the system-curl option, the cmake build will use its own bundled libcurl
>> > without OpenSSL support, and thus downloading tarballs via https fails.
>> >
>> > Adding the --system-curl option would entail that libcurl also be built as a
>> > host library. I don't think it currently is.
>>
>>   Not only that, we'd need to configure host-curl to pull in host-openssl as well.
>>
>>   That is not really great. It means that cmake (which in many configurations is
>> a very basic dependency) would pull in two more packages, which significantly
>> increases build time.
>>
>>   And the only added value is that it allows you to build something outside of
>> buildroot. If you need to do that, simply install cmake on your build system and
>> use that instead of the buildroot-built cmake.
>>
>>   Regards,
>>   Arnout
>>
>>
>> >
>> > I use CMake's ExternalProject_add in our project to download and build the
>> > static library dependencies that our embedded application needs. I know that
>> > buildroot provides various packages for cross-compiled libraries, but I have no
>> > control over the versions (and compile-time options) of these packages.
>> >
>> > Cheers,
>> > Emile Cormier
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
