Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 03:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF23409FB;
	Sun, 15 May 2022 03:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKRiJg2a6mWN; Sun, 15 May 2022 03:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57106409EE;
	Sun, 15 May 2022 03:25:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85EDC1BF962
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 03:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74E33818E8
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 03:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLSmkO3Dkj7b for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 03:25:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A135D818DC
 for <buildroot@buildroot.org>; Sun, 15 May 2022 03:25:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so10485027pjb.1
 for <buildroot@buildroot.org>; Sat, 14 May 2022 20:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9xmJEw+WksKcONziOYqCpbCMU3BoS+PDns03YoFLFYU=;
 b=jbrJyZKE6MXoIVFyBx2aDdDEvUXcyyTUw2TYYEwDOVQgakaQiHcmqWXn5b1lCvHqFx
 qAjfv3TlZ+7XiKJoPogmAJfVA0JPQHXTWF3dxnu0ufQ7U+IP5ItZsL0d0AsFeyorzMaM
 BhB1PJkFPu9okoafpLw+7/UVV+GhbXoGCE/b4ropCFE5UbbPVgIjVENmcl8yw6ehYfZV
 OeC6Yi7c8cM+M/8TVc9ZS8p8wrdx5WborQyTfztISpqCjgH0BTJ4i5Ue8Q7g44TNzRNu
 ZkXOubRHbB2Vqg79ZNhdZ7bdxiQMe+lyCqpbw0d3yT/DbqXnPgP4LtQNedGNjjhd4rRy
 qTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9xmJEw+WksKcONziOYqCpbCMU3BoS+PDns03YoFLFYU=;
 b=3AXunvtYewC7lbCsYFS+Fr5YcDo7GC0SBnRi3acaKNHguDNn7c0crSwtfXtnyAIXKM
 l4gRaXUzMocrbGIhXJQXbZsK0QCHlwYAx3anT32Uvhz4M23SPAVOR7RZ2eekQvvFp81T
 mXcpaD4ESSklfaGHeRkJU9EcoM4aSuzNKKtbwBWwXAEOslQtxQK3NHiFjY1JZLF/Sw/X
 XQiEf+eAPAVZkGJ0/dKeMniaDtTGBuFKHQrdFadsZvgXDU2jo4gEFvCf7HaCbLadQwhm
 HCxpocWJ/Hkr5ro2kHsxI/ZU+hmJTId88Y1GLOR2kFfX6ZYtFX8SoGetty3Hvj94Woa4
 fXbA==
X-Gm-Message-State: AOAM532vRTusAKjjkBhD/POiZHGw8PsksaI1vX6kUm4/kc0Ja9hZiRaJ
 ppnRHLS9QcfMwqZEGUenqtM=
X-Google-Smtp-Source: ABdhPJx1yRCldc+yUQ5hf/GChPM4qXolZVJwU64FJVGN30ZsNsMXKHn9e5wsCl4HbbVQTnPmPahOOQ==
X-Received: by 2002:a17:902:ea0f:b0:15e:ad75:80d8 with SMTP id
 s15-20020a170902ea0f00b0015ead7580d8mr12050861plg.150.1652585149965; 
 Sat, 14 May 2022 20:25:49 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 jg10-20020a17090326ca00b0015eb6d49679sm1616918plb.62.2022.05.14.20.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 20:25:49 -0700 (PDT)
Date: Sun, 15 May 2022 12:25:47 +0900
From: Stafford Horne <shorne@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <YoByu/uEWlDx+AT9@antec>
References: <20220511001947.2112747-1-f.fainelli@gmail.com>
 <YoBg1aDzr7cEYB/l@antec>
 <14506c30-bf1c-71b3-bda5-b9105adf85b4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14506c30-bf1c-71b3-bda5-b9105adf85b4@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Disable build on OpenRISC
 with musl-libc
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
Cc: yann.morin.1998@free.fr, musl@lists.openwall.com, mmayer@broadcom.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 14, 2022 at 07:14:21PM -0700, Florian Fainelli wrote:
> 
> 
> On 5/14/2022 7:09 PM, Stafford Horne wrote:
> > On Tue, May 10, 2022 at 05:19:47PM -0700, Florian Fainelli wrote:
> > > As reported in the following autobuild report:
> > > 
> > > http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5/
> > > 
> > > cpulimit does not build due to a lack of definition for elf_gregset_t
> > > which is not currently provided in the or1k musl-libc port. While this
> > > is being worked on, disable the build for or1k and musl-libc.
> > 
> > Hello,
> > 
> > You mention this is being worked on.  I am curious who is working on this?
> > 
> > I try to look over OpenRISC stuff, do you need me to do anything on musl for
> > this?
> 
> I posted this:
> 
> https://www.openwall.com/lists/musl/2022/05/10/1
> 
> if you don't mind reviewing, thanks!

No problem, I don't have the mail in my inbox, I've subscribed to musl now.

Put some comments below based on what I had configured in glibc.

    diff --git a/arch/or1k/bits/user.h b/arch/or1k/bits/user.h
    index e69de29bb2d1..3405bf771c0f 100644
    --- a/arch/or1k/bits/user.h
    +++ b/arch/or1k/bits/user.h
    @@ -0,0 +1,11 @@
    +struct user_regs {
    +	unsigned long gpr[32];
    +	unsigned long pc;
    +	unsigned long sr;
    +};

OK, matches glibc.

    +#define ELF_NGREG 34

In glibc we define this as 32.  Howerver, we define elf_gregset_t as
elf_gregset_t[34].  I don't see where ELF_NGREG is really used so I am
not sure of the impact to this.  I also can't remember why I set these
different in glibc.

    +typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
    +
    +/* or32 does not have floating point support, placeholder */
    +typedef unsigned long elf_fpregset_t;

OpenRISC uses the same registers and floating point and integer. This is defined
in glibc as:

/* Register set for the floating-point registers.  */
typedef elf_greg_t elf_fpregset_t[32];

-Stafford
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
