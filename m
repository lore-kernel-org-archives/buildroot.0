Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ECEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 09:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62AE83365;
	Wed, 11 May 2022 09:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwQOCDtI1aOE; Wed, 11 May 2022 09:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86A38331B;
	Wed, 11 May 2022 09:46:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAF3B1BF5DA
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 09:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D24EB40B58
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 09:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0lLr-8OqvqX for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 09:46:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F13674035D
 for <buildroot@buildroot.org>; Wed, 11 May 2022 09:46:07 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7bb893309so13977207b3.12
 for <buildroot@buildroot.org>; Wed, 11 May 2022 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M4asP3nygyP7c4JbTafe558wXJfoFw1gfCAFShh9x1U=;
 b=Udn5B6RxisxiDPBgPZbBzTmPRvYybdkAhOtlA5JH41kBI7eteHwM45Nqcxe4cbJV8f
 US65Ky5YYFnm5wlAGBbg3hSQXMuIUSXzAQnLdW9MFH7tBD5VSgDiEgrO+iMMMSvdzsz/
 jWuorrIbEXKY9YZmP1lktmD+n+dz00SgaRoZtxcqhE/DgNnNDsS414acjOyncE8m+xIt
 CLpR7rRIpKj4A38XwPVAyo4wVxXbrQPxB6p8hlw1U6YiN2nbWourJiU56QxwTTuGvhzG
 DeTcmVwhCIj3wEuTy518aKLOan9KvZA9q29IvBLSuWp3Slfg/qPrJR1PnHFvmHW2TsPb
 j5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M4asP3nygyP7c4JbTafe558wXJfoFw1gfCAFShh9x1U=;
 b=QqH5Wo8ofEuDzhYhqpjWgGtgMyAbOBa2gQCYIDsur1EjzaGNGeXEmcLSZO5bCPZg5L
 91KLhmgnqQ4IfYKWLunhIGmbN8+TJqRQF8/5JxFz/f64ftTUWpIFH4f0QG/v2SHVy7Op
 iXMVrMWBi+3lIo+dK1FwXk/iQPkqxIwqm4yG0jByFxVAjo+7CCaufG7a26gA48+hgoBJ
 uYIVOrgcN49VrCJYpPhOCD2VBjtQHI6QpTeEmR5Vzlrdop9wR4+HBpNBt4QluTFyQzE+
 L+sRVLefupx3WpEvn0gnS+UF9P9Q96S0Hr1vZROzde46Lvk2tL90n24f3IVYAGJE1c7v
 d64w==
X-Gm-Message-State: AOAM530Ra/TXE9KJ5DcNK4ls9ZMcYkRa3sSC5kCfv6O/3HCpYu7DcTpg
 oamFVziRM17pzpnvWDtoqs0+AjTCNCHo17eeXhN7ZQ1Zdvyldg==
X-Google-Smtp-Source: ABdhPJwntEyvM0P5m14wmHUlxwUquOfHxmsxkfxbPtQCF9oDOqJcjpTal+OoBe5VGc6rp+U/QZyO37LWoYyUEjQ6hE0=
X-Received: by 2002:a81:4113:0:b0:2ca:287c:6c1e with SMTP id
 o19-20020a814113000000b002ca287c6c1emr24397729ywa.195.1652262366732; Wed, 11
 May 2022 02:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
In-Reply-To: <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 11 May 2022 11:45:55 +0200
Message-ID: <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
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
Cc: Alsey Miller <alseycmiller@gmail.com>, buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> On 10/05/2022 17:20, Andrey Nechypurenko wrote:
> > Hi Yegor,
> >
> >>> I am just curious if the following patch will be accepted for the
> >>> upcoming release?
> >>
> >> What about bumping it to 3.23.1?
> >
> > At the time I submitted the patch (29.03), v.3.22 was the latest one. It
> > also fixes the bug I was facing. So it is good enough for me and definitely
> > better than v.3.18 currently used by Buildroot. If you would like to submit
> > another one for v. 3.23.1 it would be great.
>
>   Up to now, we've always kept the cmake version in sync with the value of
> BR2_CMAKE_VERSION_MIN (defined in support/dependencies/check-host-cmake.mk and
> updated every time there is a package that requires a specific newer version -
> like swift would, as mentioned by Alsey.

In addition to the Swift package mentioned by Alsey, there could be custom
packages added by Buildroot users with external trees. This is what I am
currently doing.

>   What is the bug you were facing?

Our custom package uses a feature which was buggy:
https://gitlab.kitware.com/cmake/cmake/-/issues/18299 (it is also mentioned
in the submitted patch). This bug was fixed in CMake 3.20.

> Perhaps backporting its fix is appropriate?

If the proposed patch with v.3.22 does not introduce any regression, then I
personally do not see any reasons for backporting. 3.18 is two years old and
it might be beneficial to switch to a newer one.

Regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
