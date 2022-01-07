Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C432C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 00:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8821D6FC37;
	Fri,  7 Jan 2022 00:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qA4TsBTyUfh; Fri,  7 Jan 2022 00:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E13396FC14;
	Fri,  7 Jan 2022 00:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E68831C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 00:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D49896FC14
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 00:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nINvFl1hSSZB for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 00:45:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AE266FC05
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 00:45:52 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id o1so7543104uap.4
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 16:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qf0/XjNdM2NI9WnC0LJktOSKxmFVJF/sm9zMT0/qf5M=;
 b=htwXrPYqpjNsO/kqDFs1P+/+9R0Hkufw/mbBKo4xzNBrGEHzPZYxKQ39r07e53M9SH
 CnvZzlrP1g5dyn4jWdhn2bkTayKYpBVZLM8r5UbEjWPUGQPHVQung/G0cb+VVbthEYHv
 rVBJjhvVzxPpEeQwjzGljM66dgXSTegv4v5odIHVLj0Y/eDE2eghVs+RxkiQfevnJhHm
 QrHaVkH+UzQ7EQQ3ScENjnOjzr1YIV5WE9geDqHgBoVcKEanFgVRnMMQQ0znzPOHiGfE
 sTgrD4fDnmii038J2agjjAGorv1jlg50jLw1WB7qUNER8K312YpoWnHdaHpZpVSamW3i
 gVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qf0/XjNdM2NI9WnC0LJktOSKxmFVJF/sm9zMT0/qf5M=;
 b=RFB+ynYEVepIPq5f2A7dII7i3k6ESTZCgdjTxsrLkctdI00On/nIl7pI5PPVl0NB/v
 XoRFKiFpzE1Un3AxbG0/POyvIm9XSZhHmyfDpY3kjrri/T+MyAp3N5FZH5l1YsefPi1j
 pManWYkNkFy2R7OqwfMIIMJxhK4MNshuEibeC59A79oqSUldutcal+EQ6e/I9m6D7XfO
 yS0fcWQ/tfMfFsfTw2ilEcGSHLl08Q25hGr5kSf2o+u7xzCBe4zntBIFxn7tWNR5x+Ih
 XnwEnDd6z1+k7SsRsv0q/RcHX6cIbMuvQp0mbTjY9Jo58j9P0ObWbVUh3c3EG33P/02A
 YP5Q==
X-Gm-Message-State: AOAM530PK/7V/kvr2KqNVcR/2+beZkymxMvbPJL3VpNJrEMFhFcI48kG
 jDWznZo7Li8rV4B/l+lyLeiVRfg+uwTaDQ==
X-Google-Smtp-Source: ABdhPJy58VqbWxOEu8P4mPzETPFmuS/YT/5d8n0ioWoQoOC4QC6QmYIv0//9BnKEKMML+yL5kHUCzg==
X-Received: by 2002:a05:6102:3e95:: with SMTP id
 m21mr6750732vsv.77.1641516350825; 
 Thu, 06 Jan 2022 16:45:50 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id h6sm2234151vkc.7.2022.01.06.16.45.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:45:50 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id x33so6150841uad.12
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 16:45:50 -0800 (PST)
X-Received: by 2002:a67:cb91:: with SMTP id h17mr20386859vsl.35.1641516349735; 
 Thu, 06 Jan 2022 16:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20211010234655.585526-1-christian@paral.in>
 <20211010234655.585526-4-christian@paral.in>
 <20220106220824.31306aa6@windsurf>
 <CA+h8R2osubHbw9jhui6hWqTLSOqUMTHeQBt6CFvhBPejgP=NDw@mail.gmail.com>
In-Reply-To: <CA+h8R2osubHbw9jhui6hWqTLSOqUMTHeQBt6CFvhBPejgP=NDw@mail.gmail.com>
Date: Thu, 6 Jan 2022 16:45:37 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rTo=mSsKSCjAz9f2FyQAuWHjEvSYKwjFWOPUHFMWS0Pg@mail.gmail.com>
Message-ID: <CA+h8R2rTo=mSsKSCjAz9f2FyQAuWHjEvSYKwjFWOPUHFMWS0Pg@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Thu, Jan 6, 2022 at 1:20 PM Christian Stewart <christian@paral.in> wrote:
> The usage of "go mod init" converts package files from older package
> managers like Glide and vendor.conf into a go.mod and go.sum file with
> the checksums maintained.

> > > +# Do the Go vendoring
> > > +pushd ${base_name} > /dev/null
> > > +# modcacherw option leaves directories in the module cache at their default
> > > +# permissions rather than making them read-only.
> > > +if [ ! -f go.mod ] && [ -n "${gomod_init}" ]; then
> > > +    go mod init -modcacherw ${gomod_init}
>
> > So in the end, I ended up creating the go.mod manually (with the same
> > logic) in both pkg-golang.mk and in this download post-process script.
> > But if we find why "go mod init" didn't work in the context of
> > pkg-golang.mk, we could switch back to using that.

One other potential issue is Go will append a line with "go 1.16" -
the major Go version - for compatibility reasons.

So if we update Go to a new major version the go.mod might not be the
same, causing a hash mismatch.

Something to take a look at. Maybe when manually creating go.mod, we
can append "go 1.16" to make the go.mod follow the 1.16 format.

Best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
