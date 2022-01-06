Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD62C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53ECB428C9;
	Thu,  6 Jan 2022 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EN_RPKQLHnd; Thu,  6 Jan 2022 21:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC57B428B3;
	Thu,  6 Jan 2022 21:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0FB1BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BF85428B3
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DB7EaFirWVb for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:20:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F4484162E
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:20:39 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id v12so6797367uar.7
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBBG0x1pSz5AGfQLSPh49JBGUWWlRiVDAy3HAfnjWSs=;
 b=Or2nQru583KB5WnOpKuej0P5Bh4y9BHBssdDeRbwTsY1FI64Tgb6LadPA+qvphb0Ra
 8O20KsW5826lduAo0TWEaZYD+po4x3hN26czkLdl/vgg0FdwpiSojmPZUytqOG6nbS7U
 YTe6QNTUWO6ryrBLJzd4CjQT27qFXzlFz4wKMPRFpm/M3XJLi6EV4X2UQD4dho39mBhf
 uc1tnpOsb7/Da73pvXblfb2x/DJXai2dGkURXfiAExKZiUI5wWb9RuMGYr4ATTa9w8a8
 WUctDHGeAPTWdKk3joEP1AiwJy/rPWK8v4mYx49hGrtMV0+tfzTnacUUxWnnuNKVVGiE
 dzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBBG0x1pSz5AGfQLSPh49JBGUWWlRiVDAy3HAfnjWSs=;
 b=hDfVUtVMo3BDUnIyqxANnro0bBT/BHcUCnbzArVFdCdUVqBPKsBfOept1DzwECXMRK
 GGHY4D0c811XOqD7mtJquOjaxCMAt+q2f8qfNsIb3ZTJcCvdVFdwrKtGIRIxoeMBRsH4
 0CSrVLz08yH1sOYeX5MQHeoIp5mGFflaM8JGStMYtgvh4LAxqBq4HaS2kcZXYLdGT699
 sLukcacS5JKsgnGI1NOIc2ncVK47yMTh2aMfsGPRMLS6pBt5hF3do4MFNgQ4a9TyLV6u
 u+lZHtTvMJlOE9MCrNH6jCw5uxEK3GonjgRzFi3K4NrIG4NfNg+ZUBw7AXfPdNYFhuu2
 lryQ==
X-Gm-Message-State: AOAM532uv7jdaD1qBymvcev3JpYU334s8wa00+BXl4KSxZj0K4+oRKHV
 qBUNitMqrA82vnSj3z20Qvyu2p7EKnoXGg==
X-Google-Smtp-Source: ABdhPJzq6bXqPPtjGePF64yJgF+QJC5oU7r/xGIV7GL7KqDcNNriqRbBxpkEMMrFD9ueDAJsWsuevw==
X-Received: by 2002:a05:6102:1092:: with SMTP id
 s18mr18819626vsr.21.1641504037825; 
 Thu, 06 Jan 2022 13:20:37 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id u69sm1972348vke.30.2022.01.06.13.20.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:20:37 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id o63so6828388uao.5
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:20:37 -0800 (PST)
X-Received: by 2002:a67:cb91:: with SMTP id h17mr20096902vsl.35.1641504037223; 
 Thu, 06 Jan 2022 13:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20211010234655.585526-1-christian@paral.in>
 <20211010234655.585526-4-christian@paral.in>
 <20220106220824.31306aa6@windsurf>
In-Reply-To: <20220106220824.31306aa6@windsurf>
Date: Thu, 6 Jan 2022 13:20:26 -0800
X-Gmail-Original-Message-ID: <CA+h8R2osubHbw9jhui6hWqTLSOqUMTHeQBt6CFvhBPejgP=NDw@mail.gmail.com>
Message-ID: <CA+h8R2osubHbw9jhui6hWqTLSOqUMTHeQBt6CFvhBPejgP=NDw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH-NEXT v3 4/6]
 support/download/go-post-process: implement Go vendoring support
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

The usage of "go mod init" converts package files from older package
managers like Glide and vendor.conf into a go.mod and go.sum file with
the checksums maintained.

This is important for compatibility with some packages that don't have
go.mod but use other approaches.

On Thu, Jan 6, 2022 at 1:08 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Sun, 10 Oct 2021 16:46:53 -0700
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > +# Do the Go vendoring
> > +pushd ${base_name} > /dev/null
> > +# modcacherw option leaves directories in the module cache at their default
> > +# permissions rather than making them read-only.
> > +if [ ! -f go.mod ] && [ -n "${gomod_init}" ]; then
> > +    go mod init -modcacherw ${gomod_init}
>
> So here you're using "go mod init" to create the go.mod file, but in
> package/pkg-golang.mk, we're manually creating it.

In this context it's OK to make network lookups and download things.
GEN_GOMOD, it's not OK.

> So for the sake of consistency, I tried using "go mod init" in
> package/pkg-golang.mk as well, but running that on balena-engine caused
> go mod init to start downloading stuff... which is wrong because
> balena-engine already comes with its vendored dependencies.

In this context we don't want downloads to occur, so generating
manually makes sense.

> So in the end, I ended up creating the go.mod manually (with the same
> logic) in both pkg-golang.mk and in this download post-process script.
> But if we find why "go mod init" didn't work in the context of
> pkg-golang.mk, we could switch back to using that.

I'd prefer to keep the "go mod init" in the download script for better
compatibility with packages that don't yet use go.mod and go.sum. If
you want to keep this in a separate patch & merge the manual-create in
the meantime, that'd also work.

Best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
