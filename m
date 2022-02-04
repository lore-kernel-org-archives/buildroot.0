Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2368FC433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 17:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABCF2405D2;
	Fri,  4 Feb 2022 17:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vLhvtbcC7NG; Fri,  4 Feb 2022 17:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85E9340396;
	Fri,  4 Feb 2022 17:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A12A11BF368
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 17:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ACBD81C6F
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 17:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWs2YaqeSXJ0 for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 17:12:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E70080BDA
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 17:12:25 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id q8so9235007oiw.7
 for <buildroot@buildroot.org>; Fri, 04 Feb 2022 09:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28AA/Xi0K9pStOqLJdK6F24r8hIibj3jXTbzQEAvIxI=;
 b=qb7k21MzqWZZvJKf6FfsTrgioOHRM7xNCx9Tw0fpBvdQnQ4MfAm/EyTbT+Sl/brh7J
 +ihd4r5PrlDZacrMRRDVwZdaVQm8fzeVLqYOfQIp/fNbMU2bUM017MGXrP4EAdy4bQOH
 LKbTSBeHNkwY/Vf//WrJzPGWKP6qi7ZB/z46OiwHdtkvjzwVMMSm7Nb6Z9ecs1FNDSns
 2ySGj2GAW1vu3P2M/wIMKjac4+NWAz3YIBC+4HDOxnDIexhaIYW/KbSWYuTybt4sIrBA
 O6SOxm/ozt771AQDv3bnRopU0r9l87awrnZTQs+4PAOz0kGyiOXx7U0IDN347nspqJDH
 KrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28AA/Xi0K9pStOqLJdK6F24r8hIibj3jXTbzQEAvIxI=;
 b=CDc+pLlSllCJsSpnWuMIlKDwkKkpfqK4pWgu9sYZMWspSCIDEXH/6sifR/oFheFjSV
 arMHS7BDO15PcLyeLjwce5mOyXgI2vr7lGtwIS0ddVid0gvQhWfxKC779uKQMLZCqBwQ
 4Y8+if+sOP5wzkWkpXWdRvFQbz/fasfL1HrsX6oZBCI/f+KGcEE+j+iB6da6FH2nvRqc
 bvQeOnUFHiFdNDg0lrjOt4miv01g4CLLaMbG8PohOStCAkVYMXi/ZU2c7ycvdnZBycQO
 y+rPEUQbrs7X6zCDOc4IF53sJAVPRbsRCYsdw1tTxUFV+zQCsHGsQ7QP7DcvZqTVoYy8
 9U2Q==
X-Gm-Message-State: AOAM53351owknuQ+bTia5qMCLFXXXIy6/OQ50r+NamOHlxEdwcwMhm/g
 LUSz9vexGeCsiNgsLkAFJJ3Bv7avAy0qQLPS+RT4DoMi
X-Google-Smtp-Source: ABdhPJwWI6bg/U6PDpKJCcFLfn/593tJy5OBaaKHnHLi8HK0mk19TUV5ZGNFJIOk74xm1xKI0Zqs0oFNpzlEeEPopYk=
X-Received: by 2002:a05:6808:154:: with SMTP id
 h20mr1866243oie.103.1643994744492; 
 Fri, 04 Feb 2022 09:12:24 -0800 (PST)
MIME-Version: 1.0
References: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
 <CADvTj4qg822gvS8ufFWFB8w5Uv+EQ7L4ULJRueQ+rp+MY_ugeA@mail.gmail.com>
 <a07ea4e2-d37b-8596-8cfd-5c5dd29bc279@benettiengineering.com>
 <67349e3c-373f-905a-840a-55c4b8143906@benettiengineering.com>
In-Reply-To: <67349e3c-373f-905a-840a-55c4b8143906@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Feb 2022 10:12:13 -0700
Message-ID: <CADvTj4rhqY6SC00CnTMavUnFZED6z4C9jejzuonFr1i7xYuGiw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] qt5webengine build failure on gitlab-CI
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Feb 4, 2022 at 4:21 AM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> On 04/02/22 11:27, Giulio Benetti wrote:
> > Hi James,
> >
> > On 04/02/22 09:52, James Hilliard wrote:
> >> On Thu, Feb 3, 2022 at 6:03 PM Giulio Benetti
> >> <giulio.benetti@benettiengineering.com> wrote:
> >>>
> >>> Hi Peter and James,
> >>>
> >>> I can fix this build failure[1] due to qt5webengine, you're the experts
> >>> here, can you take a look please?
> >>>
> >>> You have to build using official docker as I've described in this patch
> >>> for the manual:
> >>> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/
> >>>
> >>> I've tried this patch:
> >>> https://patchwork.ozlabs.org/project/buildroot/patch/20220117114358.3814200-1-james.hilliard1@gmail.com/
> >>> but it didn't help :-/
> >>
> >> I've got a WIP branch that should hopefully fix this and a bunch of
> >> related issues,
> >> cleaning it up at the moment:
> >> https://github.com/buildroot/buildroot/compare/master...jameshilliard:qt5webengine-kde
> >
> > This is a good improvement, but I need something to fix the actual
> > problem and that can be eventually backported, so this:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report@gmx.net/
> > fits more our needs for the moment.
>
> I was wrong, I haven't pulled the master branch so I was still building
> 5.15.2 and no 5.15.8

The master branch still uses 5.15.2.

>
> Look forward for having your patch to test then.
>
> Thank you!
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
