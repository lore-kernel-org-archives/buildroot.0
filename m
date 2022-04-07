Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BAAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 01:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C7A83EEB;
	Thu,  7 Apr 2022 01:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWHhmN0hEeqL; Thu,  7 Apr 2022 01:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 200D883E8C;
	Thu,  7 Apr 2022 01:51:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7E9E1BF47F
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 01:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5A5E4048E
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 01:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQzQUZKYwoc7 for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 01:50:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C099A40616
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 01:50:57 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e1e5e8d9faso4918730fac.4
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 18:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ccUfChPcMPrB9nAxcfnIV55b0nw5g1eSBR3q8bTIj64=;
 b=W2/BWZJudUYpPLpipt0MjVCvxcbh75EZi27KnSx7vYfCJeyz2+21FsVG+TuOiOLOA/
 yjIVcDqWuOn+B4txG3A3Sfea+JFsV2xMumNe9fZkvise5WiR3I59aBQy+zPiZO6FIU1r
 im+IKLhErjGghcbL9gAd3KJWOItkRdEhBftinJRD9gYXAjIHZOVWWxoZHSfEr1sk35Z5
 BQk/2pc+5CQCgGeTOCdft7kdorTZ3VEC8XmoHuylHZwvv49+Z+txwbgG+R/E5gWYKqAJ
 6/iScBOnl8bjJa+0csSmis7knChHDh9Vgcq0/+KkfaapsNjVn0+IUicCnJYb68uAiXQ8
 0yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ccUfChPcMPrB9nAxcfnIV55b0nw5g1eSBR3q8bTIj64=;
 b=Z0FnTlOScSXbBA4jDqvzuTu6g/6M874V7JMSw2nClwGIUrGzHE4Jy5iyn9WDkeo0Yq
 PjLJP883BfkeOb3u4H/cVXGb590Ajv+dqS2va0kfdtlbmJyGQnPCZT9xF766rmSWMXED
 d1ZPMssl2jfHJNqdfjtlmWlbddactL8Gspk/Tdao+kIyueedx5egNFgUCp37KPaB3DqY
 sDBs5d/nGbXni8He6dsmebY9XMHqdTPuWSFhYtM2Q2TrvRFdRQmU0JTK8Vip17diFx8p
 x0JK+AsCCEBYZRPkXXQU1gLUwDBV7xqFxt2Q1Vs4ofJEwzHWxq+pqkMvzzkPeVNj7Og4
 8xXw==
X-Gm-Message-State: AOAM530A9z6X2OFyOz86PpwzKjBy8V8XW9zDI0NMNkEUdG3Sv+dxNGhO
 rno2gTkWGou66aPQwWm7rSv5SY5YB2p2BX09W6A=
X-Google-Smtp-Source: ABdhPJy53jzFmAuZzYJAifx6YHr/SuXxr+BTWAbURDS7XIZlze0xClDVEIhbfBVlcFsuy4LhmXlm+rX/6Z6VThQ39tE=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr4987686oaa.200.1649296256710; Wed, 06
 Apr 2022 18:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
 <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
 <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
 <CAM70yxDPCUobSnoq7XhH=k7Q8B5x9j2=DSWS9a-VN3iX6zg5pA@mail.gmail.com>
 <CADvTj4p_qDCOB5PysR+rNKpp9Fo4PCCn9n4AzpJ4mRkZnqtk_g@mail.gmail.com>
 <CAM70yxDMKEOTKfesTPp02oakyCCB4zM+BmigQ0fqMoaSfeHjnA@mail.gmail.com>
 <CADvTj4rvFLx28rNUEy=c5kgONHTiQRbBbyM51ehC6GUp8bmDhg@mail.gmail.com>
 <CAM70yxAULOdSF03JY+3MgSjy9HQsF81h1SYJ31w0sUk5HqhS6A@mail.gmail.com>
In-Reply-To: <CAM70yxAULOdSF03JY+3MgSjy9HQsF81h1SYJ31w0sUk5HqhS6A@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Apr 2022 19:50:45 -0600
Message-ID: <CADvTj4qCQBrn=Gah+x-xpRzU9i4Lvu1oHTLtyw60qcKnnb_1rQ@mail.gmail.com>
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

On Wed, Apr 6, 2022 at 6:36 PM Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>
> On Wed, Apr 6, 2022 at 8:11 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>> You might still be able to share it for desktop builds for development
>> by creating
>> packages and then overriding them using the OVERRIDE_SRCDIR feature:
>> https://buildroot.org/downloads/manual/manual.html#_using_buildroot_during_development
>
>
> We use Qt Creator as an IDE, and it integrates very well with CMake-based projects, especially for debugging. I'm afraid that introducing buildroot into the mix would wreck our productivity for development.
>
> The way I have it set up now with buildroot being exclusively used to produce "release" images for our embedded device is working well. Before buildroot, release images were assembled manually using a Debian ARM image provided by the board vendor, and then tailored to suit our needs. It goes without saying this was very tedious and error-prone. Using buildroot to generate device images is way easier and more consistent, plus we can tailor the operating system exactly as we need it.

Using OVERRIDE_SRCDIR would just allow you to easily generate release images
from your cmake projects working tree using buildroot infrastructure
which shouldn't
conflict with Qt Creator if that's only being used for developing the
cmake project.

The idea is that you use your existing debugging setup pretty much as is but
redirect the buildroot package infrastructure to source your cmake package from
your local development folder when you want to build a test release image.

This way your release process would properly use buildroot package
infrastructure
for dependency handling while still allowing debugging to be done
separately most
of the time using existing workflows.

>
> It turns out that the problem with buildroot's cmake not supporting https downloads is a minor one that I can solve it two ways:
> 1. Pre-download the tarballs using wget via build scripts
> 2. Install a more recent cmake on the build system that meets buildroot's requirements
>
> If this feature request is declined (as perhaps it should be), then it's no big deal, really.
>
> Thanks again for the advice.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
