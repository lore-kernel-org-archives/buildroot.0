Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA364C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 00:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E227415CA;
	Wed,  8 Jun 2022 00:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tW2g9QoQrQx; Wed,  8 Jun 2022 00:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB02415FD;
	Wed,  8 Jun 2022 00:01:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B87811BF3FC
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 00:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4666844C6
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 00:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSF-7LZUo2gb for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 00:01:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4EA384495
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 00:01:04 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q184so9103835oia.1
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 17:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5v8jWtaG4KwDYuS5hkyY03iWyE4TCKNf0hO/MP5lirA=;
 b=cgfzq9Il+QS4uyoFPvKWHDDBGUhkjyqrihNXM17xSYVIXhShyUuuFbP4aHQzZQDTby
 PxSKvlknlC0x55kkkHyhftKgzLP8+AbDOnfc+Y/2HtvtpE5HzVfMwgc4kt0YcilDFYlS
 pxd5E9zP4LpZKY/cr25CRjFle1aoHVXE7WC5IJCPKfRBBYvnOkK701kndCqRJeGOqlmj
 kHbZJHdym2QhKkA4TBpLQZCSN7zqG1k4sgGOwUqvWXcs2FzWL2W4rU76mIP2Kcen0IaT
 xkE4RYnNKZhVjMR5RYzqRaiYNNwf/Y/wuxFIE+6FyOsvDM28MwMhjigDhB9SGMglxoYS
 4glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5v8jWtaG4KwDYuS5hkyY03iWyE4TCKNf0hO/MP5lirA=;
 b=JAIhiV8xLxMNdJ5R7WKkA3J77Vm45EXt0kvCmssO7Og120608VkhHHS3Eup5TDaxVl
 2Ft+B+y3LwEGppiF70IdXyhXaWO6x1YzCSPc0SS4CfeYggqiyyjvEZdTfTAUc1YkvKEP
 aBy0VWrMcpx48hcYyHp19Jv2LWFwrfdsG0oxEEG54WCGcYETfEJog99l6VVZMXm0Y5EZ
 Ah4e9D5DAKhuqli/xSVwefdEIdSdKMy5IUOKO5zk9Sb34p+jqolFJWaANnSIjcQGoPTk
 GETjbUi4rUrhOhH1VMZ00JiHuHuqbC3SHPXVlyBLGmGvZZi0qatO5iWgrD7gaPGrRFIs
 sSEg==
X-Gm-Message-State: AOAM531htachz+9PSubcvZoPY2mfyJZYtkJdAgNE77v0kYgbBTnStZcL
 RMRJUYpFp9uYzXfN0EgDcivl+TW7l/aOapnJmkrOrplMvCY=
X-Google-Smtp-Source: ABdhPJwP6BKefu3Wdw9zIIPvAznxkO/2JDcg0cG+1XYCHCOE83zHZEmgMGD90v0/A783wO/K7xuZ7FRiIi1WEiZH3y0=
X-Received: by 2002:a05:6808:114f:b0:32b:1be0:2316 with SMTP id
 u15-20020a056808114f00b0032b1be02316mr871357oiu.200.1654646463940; Tue, 07
 Jun 2022 17:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
 <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
 <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
 <e3350a95-d9ca-8d7d-0f48-22c86289a3db@gmail.com>
 <CADvTj4rWQx=g3MK6AoV7bbRS7ZOA4K7SMR2Qb+OhaOdX4y8odg@mail.gmail.com>
 <20220529214657.GM993669@scaer>
 <CADvTj4rxnoRp-ZZPhfB2ANhw3+294F97A2smcmhULR4WfDsqrg@mail.gmail.com>
 <878rqaxa0t.fsf@dell.be.48ers.dk>
In-Reply-To: <878rqaxa0t.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 7 Jun 2022 18:00:52 -0600
Message-ID: <CADvTj4q3AXT+Ca-jfrW1pNJOhxgUUrjUhi0CnfXqniK_Z0oVGw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Lionel Flandrin <lionel@svkt.org>, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jun 6, 2022 at 6:16 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
> Hi,
>
>  >> We were really late in this cycle, but rc1 was tagged on the 18th, just
>  >> a day after you sent your python bumps, so they could not all be
>  >> applied, except for python-flask and python-werkzeug which do fix a
>  >> runtime test.
>  >>
>  >> If the rest are related to the flask and werkzeug and need to be updated
>  >> together in lock-step, then they should have been grouped in a series
>  >> together.
>
>  > Yeah, the individual bumps were for stuff that was broken already due to
>  > pyyaml breakage so was a little too late by that point to do a proper series
>  > since everything flask related was kinda already broken.
>
>  > I did a series for python-flask-jsonrpc which fixes compatibility with the
>  > newer flask version:
>  > https://patchwork.ozlabs.org/project/buildroot/list/?series=300745
>
>  > These are reverse dep bumps needed for compatibility with latest
>  > python-flask:
>  > https://patchwork.ozlabs.org/project/buildroot/patch/20220517202422.1522574-1-james.hilliard1@gmail.com/
>  > https://patchwork.ozlabs.org/project/buildroot/patch/20220517202805.1524501-1-james.hilliard1@gmail.com/
>  > https://patchwork.ozlabs.org/project/buildroot/patch/20220517203235.1525998-1-james.hilliard1@gmail.com/
>  > https://patchwork.ozlabs.org/project/buildroot/patch/20220517220253.1554088-1-james.hilliard1@gmail.com/
>
>  > I think these are all part of the python-flask update dependency tree and
>  > should be applied as well to prevent potential compatibility issues:
>  > https://patchwork.ozlabs.org/project/buildroot/patch/20220517201550.1519884-1-james.hilliard1@gmail.com/
>  > https://patchwork.ozlabs.org/project/buildroot/patch/20220517201916.1521398-1-james.hilliard1@gmail.com/
>
> Is any of this needed for 2022.02.x as well?

Yeah, I think all the flask updates are needed there since pre-2.x flask is
apparently incompatible with jinja >3:
https://github.com/buildroot/buildroot/blob/2022.02.2/package/python-jinja2/python-jinja2.mk#L7
https://github.com/buildroot/buildroot/blob/2022.02.2/package/python-flask/python-flask.mk#L7
https://github.com/pallets/flask/commit/6d8b4ce9d037937ef8694067ab5754666240d097

>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
