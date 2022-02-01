Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C2EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 07:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB36160F68;
	Tue,  1 Feb 2022 07:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQvpNmFmsMmu; Tue,  1 Feb 2022 07:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E0E60F67;
	Tue,  1 Feb 2022 07:23:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 201B21BF29F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 07:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1354840985
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 07:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqpSGAWPzY7X for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 07:23:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2024940120
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 07:23:06 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e9so22816570ljq.1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 23:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I72C8Li6dAaFLqFMIGHQl6IiODv2inscOhOoV3cbwxQ=;
 b=CBrG9aeDGmT/lpHl989C1aYPyNdBLqw8NgWw2VBw+eZPas1CMpcvYsuvRMFzoIzGeY
 GsTVJw+wpD6qJoecehOVR+s+qansg/RqCn+6/dBW69HuIP1QWXFRT2Dw8nOwWsxd1wuw
 HkpCuzI4lsAqy6epaaVkCjHVdh3YO9kaCxUk8kS95YNU2xxZl+Z+9plkPfW+3ic6JsVz
 rcNvItEEBqLos2+ZK69RMqmRUnZhKk8+rIKzWmLOee19d03xqvEUhdOFajxOnumifgjL
 VFdX2mRGSSF+rqZxOLtwh1KYiHoNHQWKEoQS7fbFRmNrCG+ELZQcq1ia6sEMzTe+epsS
 a+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I72C8Li6dAaFLqFMIGHQl6IiODv2inscOhOoV3cbwxQ=;
 b=HhC/9qs49AKJkjGfFY1EFV9kDw+R9qSfEtHyQQGnulZHAdyoDVOhc5b93EBR9UKrb0
 DbmK++FRCB07c7ZcDlO9X7YVEtW0J5lJgvQmRlitRvkhZJIMh0D3WvDZ3acZA/IYenb7
 2lkbzlQjUZsAl1YmIQ738ovLS8ju5ghHuXfRbbC2K4nnRzCUsu9yY3E4ZMjbrv1wadn6
 oeqbXYyvLL+qFe6qUOI7/LW+exvexmC6ooyQnJW1cjt868dO4hFVs3fKoZvSoKx35+t1
 ChlNW4P1MPDTmtw6fRelIayvbclKZaI1jUx9IQiso26BdHOUXFoGZLkw3mfXVwVZgB5/
 wjrQ==
X-Gm-Message-State: AOAM530Q/Iwj5F1hURW7XfBdIJABxC6USF5kHS1Rr7Q7IwhPb+RClr41
 bLuPY2oVZ1gDkuVed9qS+mpppBMxxYrf5Rz45VY=
X-Google-Smtp-Source: ABdhPJzVwJHko0IEXmvG2WWPLyQHsIKdy5EUgesxTsWmbR886k4gWGKqFGcH8A43aL6gq9HBVbEqIK7fE2Of9R9Pb7Q=
X-Received: by 2002:a2e:9916:: with SMTP id v22mr15379395lji.382.1643700184872; 
 Mon, 31 Jan 2022 23:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20220131153022.351662-1-heiko.thiery@gmail.com>
 <CAOf5uwkFjQCGBOD4JMn4MG_SR74-bW1SHoDFiEC7mqH_C8Xq7w@mail.gmail.com>
 <CAEyMn7aDyH24AYVMZaLvt9SQMtVu9yhzftPqbSsuJ671tY-kNQ@mail.gmail.com>
 <12be81a6-7f2e-35b8-4f44-d8a20fce74f1@benettiengineering.com>
 <CAOf5uwmeT8WVUc3xvP0DjrVDLj9egvJz0+JEvWhgojnEVhyTyw@mail.gmail.com>
 <86bf975a-1599-005a-5ebc-a149cc973da4@benettiengineering.com>
 <3ea22a9d-938a-5086-66c6-a8f5510c8573@grinn-global.com>
In-Reply-To: <3ea22a9d-938a-5086-66c6-a8f5510c8573@grinn-global.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Feb 2022 08:22:53 +0100
Message-ID: <CAEyMn7YVHM5B-m0ddBuNR7c1snGzzhP+f4NydCDnohX8vVBvbQ@mail.gmail.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH v5] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,


Am Mo., 31. Jan. 2022 um 18:45 Uhr schrieb Bartosz Bilas
<b.bilas@grinn-global.com>:
>
> Hello,
>
> On 31.01.2022 18:11, Giulio Benetti wrote:
> > On 31/01/22 17:42, Michael Nazzareno Trimarchi wrote:
> >

[SNIP]

> >>>>> I have seen that some people like to have this organization but it's
> >>>>> not really nice to maintain. I would like
> >>>>> to savedefconfig and use that one instead of having nice commented
> >>>>> part. Is this mandatory?
> >>>>
> >>>> As far as I know there is no rule how to do that. For me it seems to
> >>>> be more readable and clean. But this is only my opinion.
> >>>
> >>> As Heiko pointed it's a very good habit.
> >>>
> >>> One thing that must be taken into account while doing it, is to keep
> >>> the
> >>> various BR2_* configs ordered as they are ordere inside the various
> >>> Config.in
> >>
> >> There are good information indeed but even those information must be
> >> keep updated. Daily work show me that work on
> >> savedefconfig make things nicely. Some of your option can be at some
> >> point autoselect by another one and so on.
> >
> > Yes, you're right, I've noticed that too. It's "not that automatic",
> > but if you check the first 25 defconfigs you can see that more or less
> > the 70% use the "descriptive" way. So basically one should
> > savedefconfig to another file and compare to the configs/*_defconfig
> > and eventually modify.
> >
> > Anyway there is still not a standard decided. So maintainers will
> > accept both ways.
>
> The global sync via `savedefconfig` for all existing configs should
> solve everything. Besides, it should be impossible to edit those files
> manually.

For organizing "real"  projects I also prefer to use the
"savedefconfig" way. But here to have a new defconfig in mainline
buildroot I prefer a clean minimal defconfig. But I think that's just
a matter of taste.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
