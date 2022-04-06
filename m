Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5EFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 22:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F381F40B0C;
	Wed,  6 Apr 2022 22:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHU8NXEJkRis; Wed,  6 Apr 2022 22:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 082F8408D4;
	Wed,  6 Apr 2022 22:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 424C81BF3C0
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BEF1408D4
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyPJVQZm9b0P for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 22:27:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ACA140386
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 22:27:11 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d6ca46da48so4473116fac.12
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 15:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i0EX17PvZ92YPgPb/VicL8j1SCN9iNKgkE4aG1hYrzU=;
 b=JBFopfirjKnv2/QObBGJb+kEnO2RRKYTuM7+GtFbgKQN0BKw6q1edp5XJOY3O6ykab
 ToM1CyYRFF80Jz75Y6W7/IFY/utaDQFN2u4/4xyqXunnuwA5qdHc+pS6frsbg27VCB1p
 f+x0PSvkgfiPxrJafDP+sWqaKzVcmVPs3KbFHG4+yk+3EmbpAdU79Bji4GKP96mPK/g+
 NZ7i/kj2z9RSaiERcGjywZRdkm3bzeWbMM4dKlr9t2fsQNlcfYxAGYp/RGHgyb4TbuLU
 KrWOzV7VZg0iLnBLsqKndFyoGGjFLGwHZNZ/awqaIPf8DlUDhnJqpEFCpiFyWdPbfi/a
 LTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i0EX17PvZ92YPgPb/VicL8j1SCN9iNKgkE4aG1hYrzU=;
 b=021bQwr7hVsZuHeVzzzPOdDuhTiK3U2ebsAYY+MaTXdXUl3fNuCwRX3LZj2tuyCr2a
 hr+Bd7ulkihXbngB61l0QB0zccUFAKaxnBU+SxIkAqaWyipU3uQZ05fHvO4RYC1Wqu3Z
 m6OBCe4ortlXAsQqhLpld8+C0pR30mMd0K2btIWbADH6vyoY6ozzK91culw0FfqdVYcD
 WisQH7C9uEIODLC/I02fQ03lEse7QLOVL9iDsmQTaN1qyzR/IJ8qHh+K+n3km2CYY0HN
 82UTGlfkWuqziMkVMj7z4HwX5SbL0plMlT82TFXw+lao4WPS4yBFhBtfakCMeFXrV82c
 ZIlQ==
X-Gm-Message-State: AOAM533V3otn6Ss3KYuh7NqqiyA3rG+MifQscYV41WWyDeeO9DJPCZ8c
 KukrxukGzi2ef1qob80E8CKznZryZB98lq9abi92NAfotkcr0A==
X-Google-Smtp-Source: ABdhPJxi6Ybcrj+9ta0w9A2RNnE83IKu6cidmwXs9RzmNsow8OTn5wFP0y/QaLNc+xjEj/gm2dUnkTJhpBtFifazd3g=
X-Received: by 2002:a05:6870:2104:b0:e2:96b:be89 with SMTP id
 f4-20020a056870210400b000e2096bbe89mr5083417oae.99.1649284030487; Wed, 06 Apr
 2022 15:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
 <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
 <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
 <CAM70yxDPCUobSnoq7XhH=k7Q8B5x9j2=DSWS9a-VN3iX6zg5pA@mail.gmail.com>
In-Reply-To: <CAM70yxDPCUobSnoq7XhH=k7Q8B5x9j2=DSWS9a-VN3iX6zg5pA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Apr 2022 16:26:59 -0600
Message-ID: <CADvTj4p_qDCOB5PysR+rNKpp9Fo4PCCn9n4AzpJ4mRkZnqtk_g@mail.gmail.com>
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

On Wed, Apr 6, 2022 at 4:15 PM Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>
> On Wed, Apr 6, 2022 at 6:50 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>> On Wed, Apr 6, 2022 at 2:13 PM Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>> > Buildroot's cmake is being executed in my post-build script instead of my system's cmake. How do I make my system's cmake take precedence?

Why are you executing cmake in a post-build script?

You should probably create a proper cmake package in your BR2_EXTERNAL:
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages
https://buildroot.org/downloads/manual/manual.html#outside-br-custom

>>
>> I think you just need to update your system's cmake to something that meets the
>> required minimum version:
>> https://github.com/buildroot/buildroot/blob/ac91235797fe9b234fb820c0112f21c26be1349f/support/dependencies/check-host-cmake.mk#L6
>
>
> Ah, that explains why I started getting CMake https download failures _after_ the buildroot cmake version was bumped. My system's cmake version was in between buildroot's versions for cmake.
>
> However, I think having to rely on the system's CMake version goes against the buildroot philosophy of an image build not relying on the tools and libraries available on the build system.

Yes, however the issue here is that you are bypassing buildroot's package
download infrastructure.

>
> What I have done as a workaround in my post-build script is pre-download the needed source tarballs via wget. Later, when ExternalProject_add attempts to download the same source tarball, it sees that it's already downloaded and matches the expected hash. It then skips the https download, thus preventing the error. This way, whatever version of wget is installed on the build system makes little difference.

So create a separate buildroot package for those dependencies that your main
package selects.

Use the cmake package infrastructure instead of trying to use cmake to download
the dependency.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
