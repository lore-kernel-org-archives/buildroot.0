Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4485CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 17:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B893260C14;
	Sat,  1 Jan 2022 17:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hFVqqrDEkDJ; Sat,  1 Jan 2022 17:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B62360C2F;
	Sat,  1 Jan 2022 17:37:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C47A1BF2F5
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 17:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B8960C2F
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 17:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHOWfZqSkzqt for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 17:37:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FB5460C20
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 17:37:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o3so3275365wrh.10
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 09:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NTBMCLd0BKm5VUS9UKwWvPsko9tUYKV4kK4t83gYYM=;
 b=DHmuuU3BtmGeISDidm3+r6KofM7giTBquKNzl/Ego6wz0ZsNKCEkcBCgTyheF7BURt
 hJiKegDspZ6hbzzqyNvnNrSe7nrsDK5MVW8rMb0ZvmSzz5Bgz1GgneOdkBKNFjFs1ScL
 /gi4zNVIC7njzqUj70tFtcEz8eUEdAnGH0K82mOy1TF27SYUG7d7+/iG6itxmLoM0PsI
 AdJhIiG8njazzeJ5TCEWOIn4UjkPd10cT30xsUeNw5dusbqT8ypej7Eq0qFTsNWxVba7
 0RxtH01q5uWnKaUlU8xNlTtVVnr/dQfCBhC89jwWXBEv0cAhZ1aaxbS0Ld8Ea73ToBVu
 nfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8NTBMCLd0BKm5VUS9UKwWvPsko9tUYKV4kK4t83gYYM=;
 b=3aFwz2RS7ZiRbEtMJNEpBhsnHVsVlAI2ZeujCUOiyf8ojXbkA+4Q+mF2xO4URuPiIP
 bCs6CoDT8ci9SyCjwcwqKUk/8In86w742Xq8fNI0tiLoLBvSWVhm/dBcCMD8nc1ADiNZ
 wlStsmW4Rw3kAk0LlRsUOnRKBJJ8HhsiHPhc/livQilvlpJn9PnqWDWrMDUK7W92SAUw
 hKvrwylsOCP5SmZCq8JoBMy1ewOFultu6YL68yGNWta8B8o3yrw8giT1DHsoTJXZBIBm
 o087lxSWgSo5aA31XoeSRPc7LILd5Jbk0+hxXFol3H54xZanHoCy6m5/bzHkQYMzjqlA
 L/uA==
X-Gm-Message-State: AOAM532Fzaew0hj/YN1nv1ffPlTqAC+6bwJu0tDenZctwdCHRBFY/xUp
 79W069iWE15j1Q==
X-Google-Smtp-Source: ABdhPJwxy88Fh6TkH43WzHXTsSi+iusS0snjxQ4EqL97nUFuAurh8J0Z0Skjp7tOK1GAQ31xNg0X8g==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr32881679wrc.686.1641058627699; 
 Sat, 01 Jan 2022 09:37:07 -0800 (PST)
Received: from localhost (cpc155795-brmb11-2-0-cust469.1-3.cable.virginm.net.
 [80.6.125.214])
 by smtp.gmail.com with ESMTPSA id r9sm31284036wmq.18.2022.01.01.09.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 09:37:07 -0800 (PST)
Date: Sat, 1 Jan 2022 17:37:05 +0000
From: Richard Ash <richard@audacityteam.org>
To: Jacques Samoun <jacques.samoun33@gmail.com>
Message-ID: <20220101173705.142a0496@audacityteam.org>
In-Reply-To: <CACaKL1yLOT159yE2Kptoay7Ng+1+vb+tCUxJoVqr9gLha660jw@mail.gmail.com>
References: <CACaKL1yLOT159yE2Kptoay7Ng+1+vb+tCUxJoVqr9gLha660jw@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Clacks-Overhead: GNU Terry Pratchett
MIME-Version: 1.0
Subject: Re: [Buildroot] Patching a BR package makefile
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Dec 2021 14:57:54 +0200
Jacques Samoun <jacques.samoun33@gmail.com> wrote:

> I had to modify a OPENSSH_CONF_OPTS of the openssh.mk package
> makefile to solve a known interoperability issue (openssh vs
> libopenssl). Now the fix is verified, i would like to create a patch
> to be applied to this openssh.mk .
> 
> However, while I already did a couple of patches to other packages,
> they were always so far applied to the course code of the packages. In
> this specific case, I do not know how to make this on the
> buildroot/package/<package>.mk file.
> 
> Is there a preferred way to do so ?

As far as I know, there isn't a way to do this within buildroot,
because the buildroot tree is (has to be) immutable by the time
buildroot runs. Put another way you can't patch what effectively
becomes one vast Makefile from within that Makefile without badly
upsetting make!

The only options I have found are:
1. Write a wrapper script to unpack the buildroot tarball and apply
your patches (note you may have problems if your patches change over
time).
2. Have your own fork of buildroot git, and then your own branch from
the relevant release tag with your changes on top. This means you can
rebase your changes with git's help when you want to move to a newer
buildroot. Convenient if the rest of your build is in git and you can
use a git submodule to fetch your forked git automatically.
3. Don't try to modify the buildroot package, create your own
custom-ssh package (copy of buildroot plus your patch) and maintain it
in a buildroot external (see the manual). Could be a pain to keep up to
date in the longer term.

I'm not in any way a buildroot maintainer however!

All of these are good reasons to get patches upstreamed (if possible)
into buildroot!

Richard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
