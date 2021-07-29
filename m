Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159FCC4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 15:27:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A40B60F43
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 15:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A40B60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D3CF83AF3;
	Thu, 29 Jul 2021 15:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id so9Sjuj75K49; Thu, 29 Jul 2021 15:27:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAFD183ADF;
	Thu, 29 Jul 2021 15:27:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 371DD1BF292
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 15:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26B5D40585
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 15:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WxFmhCkoLX8 for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 15:27:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82C56404E5
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 15:27:17 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n16so2329885oij.2
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VlrOC1GbIvIUf6rRlG//K+wFJWcAm1vpmrdQ9h+PVz0=;
 b=YpC4BDFeH1ajq0UBSqBkT+NWp/fz1Jea3yvnv64V//2hsahZYZC4q9zPuwfCWTAYxG
 mddnZvgggj9/5q10iYf5F9AFib8GTcKBKfaZ2hucAkriJFiFDYhlXw49lxEuSDY/mO48
 +QR6Nr4ntxwKsO+9dJmuCpksEdJhLrammoryAXkmDyjJoTJZe+jKDDS3BGtloexxY09a
 +PhiD0CLh/c6H14CNSuotVGCJ4l1RC5aOtB/Zb1vWDQETSj46sVX26dO5SfbkuA4q29T
 1OHH6dspSwmlhSPhy+PzWQJ3bA3//p9HrK21u8ckPU4IA+sHoEb1aIAkxv6bjfSbpnng
 mnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlrOC1GbIvIUf6rRlG//K+wFJWcAm1vpmrdQ9h+PVz0=;
 b=P49MqVEClJ7pKORgU9Y8jcklxYk73LAbsC34ZphyNOne5fighV7HBdAHaO7RSq9nL2
 OMyY0F6k59M7Jwie0S2K5hEz19EIc7SSxGRLZOonA8KKSnUartVfKH7+vSVAYj+6ezk2
 PoISqVN8P0AflXhUt/nEl/dnskk0hh+hNWfW17XfKtakytOPyf+yHe95qr4p/s8Wdsmo
 +iR+ZbNtO88D6VmRxqU7aSCHO94RvZDeqaNOXW7OJ/MDN72dIk1/v+cALuzSs13IjpBi
 9YZwYnIvgMzpHvXMfepw15IDxCmB6dDjaHs+xVSQNIPuRSJcOokuKNlnlgLUI5iUJqw6
 3ChQ==
X-Gm-Message-State: AOAM5322SjXDcja9cmKw2xhSdKzzRavNNSyiNiB3HesE1P6wOQPr6RQD
 LfXaHvi7L8l165DAoseRGKc9rl/cTXBvkpJWesE=
X-Google-Smtp-Source: ABdhPJy8LLXqKJ+8erTWfpyK+SesMlft6CG8HH/Tmzb0syiAwAoUSBFIUdAXbh9ewLIgn9crSGI48R8o/qEIqGL4v4Q=
X-Received: by 2002:aca:3144:: with SMTP id x65mr3392146oix.157.1627572436523; 
 Thu, 29 Jul 2021 08:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145946.854654-1-nolange79@gmail.com>
 <c995a5ea-e83c-47f6-6e4d-08f1b358474d@mind.be>
In-Reply-To: <c995a5ea-e83c-47f6-6e4d-08f1b358474d@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 29 Jul 2021 17:27:05 +0200
Message-ID: <CADYdroPq7RJf1xgWOTFRyPPCq2xcPB5NXVRopJopJGFAzcwwvg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/gtest: bump to version 1.11.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Am Sa., 24. Juli 2021 um 22:42 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 08/07/2021 16:59, Norbert Lange wrote:
> > Python is removed as dependency.
> > gtest uses python for self-tests which are not run by buildroot,
> > and the remaining scripts are not used by the build, and aren't
> > maintained or supported.
> >
> > Special handling for gtest-config and gmock-config is removed aswell,
> > the CMake Buildsystem now does take care of those.
> >
> > Installation of the python gmock generator scripts is conditional upon
> > host-python[3].
>
>  No it's not. The location is conditional, but it's always installed. So I kept
> that part.

yeah... unless you dont build host-python[3], then things fall apart:

/usr/bin/install -D -m 0755
/tmp/buildroot/build/host-gtest-1.11.0/googlemock/scripts/generator/gmock_gen.py
/tmp/buildroot/host/bin/gmock_gen
cp -rp /tmp/buildroot/build/host-gtest-1.11.0/googlemock/scripts/generator/cpp
/tmp/buildroot/host/lib/python2.7/site-packages
cp: cannot create directory
'/tmp/buildroot/host/lib/python2.7/site-packages': No such file or
directory
make: *** [package/pkg-generic.mk:280:
/tmp/buildroot/build/host-gtest-1.11.0/.stamp_host_installed] Error 1

>
> > Since this is one of the unsupported + unmaintained
> > scripts, installation probably should be gutted completely.
>
>  This may be true though.

I am not sure what they are used for, seems they were necessary
for gmock some time ago?

>
>
>  Applied to master with the above change.
>
>  Regards,
>  Arnout

buildbot failures incoming?

Norbert
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
