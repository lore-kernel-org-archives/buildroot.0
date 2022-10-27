Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629EAECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 22:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B075D403AC;
	Thu, 27 Oct 2022 22:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B075D403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxV3QIWAu_nX; Thu, 27 Oct 2022 22:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9D574013B;
	Thu, 27 Oct 2022 22:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D574013B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD941BF3BB
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 22:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0639381699
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 22:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0639381699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6C_dUSJuQUE for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 22:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E46A815CD
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E46A815CD
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 22:48:23 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id f140so3227901pfa.1
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 15:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZiJdNSMN117dE599ijzlT56Wg5UUsRQL8TnNLYGUvY=;
 b=wmqxFMPbtl7s7+yUlGvwiK2mzIJJdKuULqHGsvx5rRz69qikb5tPE30FcT4smJ2+uf
 gOc1JJwI4m8oH8p8Lr8H4sVS0zdrEv+9LZtSHdlmyAEjxdCZQ0DYq8O8kLmdIBM8H4c6
 8tMjEpSaiyLL5FoWpyCv2HNoCLKa0yfIDH3n0yclgoMlJSqtf6ytkYTB4ce8dZ8pz4Rh
 iaBUvBsU2SFHUEbG2OAB0a6MeruqTMMmrCv8BbG4+Ihf9xoh+3Uk3ops1EQThRKdnudI
 CblNm17vODwqRctY/kkw7BCDfyi/oW3tsJ7pqhL/fc6EVdrF/z1ESXO1eCMd5uVVYM0P
 CUsg==
X-Gm-Message-State: ACrzQf12rtKLNpirSVdnQNZSk+B9vSWTRQTkYzAcPGGz6RNsG8+7HUKN
 RgVe4z0nN63l13oqQ9QwVNwL8yx2DBa8TMtNkOujJCMbQY8=
X-Google-Smtp-Source: AMsMyM5I52gzIHeAn3fUEAZdTiVrNNEi85h45UWuFwEl+KWLRVnUh7X+JY51pYFDsYrGdyM8f+LtAphZXaV+p371Na4=
X-Received: by 2002:a63:df03:0:b0:462:cfa2:2871 with SMTP id
 u3-20020a63df03000000b00462cfa22871mr43742857pgg.225.1666910902515; Thu, 27
 Oct 2022 15:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221025142929.3089316-1-james.hilliard1@gmail.com>
 <20221027085615.2c78028e@windsurf>
In-Reply-To: <20221027085615.2c78028e@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Oct 2022 18:48:11 -0400
Message-ID: <CADvTj4r29X5bPW1V+sBQJ5aHps5q5y=KAZEAQhPZ8hpRKRv4DA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JZiJdNSMN117dE599ijzlT56Wg5UUsRQL8TnNLYGUvY=;
 b=OqFcnC3EnjBRdEECbnwOHgryevssM8wWvM3cHDvpJJgRUGHwHK+5QuBKz9kK9lcHiJ
 KUGdRZMricgRbrTYBbqJPUU9t1ByvNzqGSJXemc1pfk4CxT6sUiJtYXDhxkQEn7FVDp0
 m5x6MyamQmOCcqf98ICx1kOo5CBPO2qL5aTsha8wDYfqEyPsNbC7x0SMhUYi4N4zVDvr
 dCdsuZuUtB/1In8mj9Sibh+LOLJKabijRwKwK46NjWJ/rx2CVFBVlD6GNWdc+rBvmp14
 MUz0qNNwJjDNe6eFYfJmEH6zGUHjy8M1vMfMJNNFIiIyxhk7IUyc+XtVNcxN7V8eRnrV
 ulUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OqFcnC3E
Subject: Re: [Buildroot] [PATCH 1/1] package/kmod: bump to version 30
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 27, 2022 at 2:56 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 25 Oct 2022 08:29:29 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/kmod/kmod.hash | 2 +-
> >  package/kmod/kmod.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> We have a build failure:
>
>   http://autobuild.buildroot.net/?reason=kmod-30
>
> Not sure if it's new with version 30 or not, though. Could you have a
> look?

It's not new, but seems somewhat rare:
http://autobuild.buildroot.net/?reason=kmod-%

Same failure in version 29:
http://autobuild.buildroot.net/results/e5b/e5bdd8a04d845667f4234867625c3d8e482b3e21

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
