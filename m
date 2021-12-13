Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8ACC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 17:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28027401B8;
	Mon, 13 Dec 2021 17:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TTRuYvbMINXX; Mon, 13 Dec 2021 17:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACC9401B7;
	Mon, 13 Dec 2021 17:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 377D61BF3C4
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 249CD60598
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wz7E1Ax4cMrh for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 17:49:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F85160596
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 17:49:57 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id v138so40259125ybb.8
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 09:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j2v5Ovtr/UhuD3cqVTGg2psVCg8Z5sIizAQ6NoGkX48=;
 b=SNjMh/2hvxp0shYmF58abUs12fG8RY0Ic3iJJuZQe2ktowpB9kVxWqdGs7eZakuO44
 3tqfpsiQEvFqy1UCFyyweExQnkhhNezdDBS7Ob6yLfbN6bJ9Ihddz5a+iaSBsE1J3yY6
 qroMlOys1p1nfV15+gIhq36dNBaCCwIHf7/6lKygfbgHl3DEsRf1pzs0oDHdyfj8Wkes
 GZt3Wf7gmlsTCadrJXaT8TjZ+kSROtdH5arFUBEHw4hkLox0EjcCFjDboeMH/vPAkx+c
 uJV02wQnf5yWyf7BqiI4m61Ht/uEJSk+SDYa69DLVeX3cArAv0XNmRUNMobzUWxmVNpe
 8vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j2v5Ovtr/UhuD3cqVTGg2psVCg8Z5sIizAQ6NoGkX48=;
 b=mqfNpCBb8KmdArBJBNhY+kFQH873nq9kVnu1/4VFjuMgyFKVRYZ/Lgd/TeB0eW/uJc
 AZ8j1PC9bqiU2Pdz387J6VWGcGIq1M+gIXz7VuTchaUgUhQmgmbiJ8tcm2kOkLAcuJOM
 9Zq7dEOTIudZfByn7X9NIF6UB+wxGgepnh8OSX6AoOESHSjtNz/L4uAtbgBs0XvnbNLV
 bpylchq2zCODaGmu/TUVByczjx22hMMovcvQENaSEMHqsoB0hXku4NKC+zG4nepQXxVO
 3oFTyOE2Awdr2uBnU2VX2cbgwG2S4p1pbdZSCVZZsaMrfoh1sixfiowZZbvwO6Xy7oWq
 t8iw==
X-Gm-Message-State: AOAM533xxZV7X7PCAuzkx/EYl/ii1g5VGaCgqQ58Z0doSc7HuyIn3kJ1
 SXFqjNUWvmDNOKmR4DXx8pMv4T2tk6Jhy6OcrUA=
X-Google-Smtp-Source: ABdhPJyQGmfkwGTpJuo9OvQecQSqshLvgfXAekpA3daOdnbOw45mz8+iGuGI8KggaOwETtOmnfTD0xaIChJxzVmLdt0=
X-Received: by 2002:a25:ac42:: with SMTP id r2mr31937ybd.126.1639417796012;
 Mon, 13 Dec 2021 09:49:56 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
 <20211209151054.3799fb4e@windsurf>
 <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
 <20211210231055.550d5641@windsurf>
In-Reply-To: <20211210231055.550d5641@windsurf>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 13 Dec 2021 18:49:44 +0100
Message-ID: <CAOiXNkD7yfbti2veuH=8KQGeXam+K4e7YmBSBHL67oqabHSoQw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] Building packages for Cortex M4
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
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

>> In the meantime, I came up with the following solution and wondered what
>> would you say about it. First, I made host package which downloads and
>> installs M4 toolchain from ARM site (inspired by
>> https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e33b3eee )
>>
>> Config.in.host:
>>
>> ################################################################################
>> #
>> # gcc-arm-none-eabi
>> #
>> ################################################################################
>
> We already have a package for an ARM toolchain, in
> package/arm-gnu-a-toolchain/. However, we have found that this
> toolchain is targeted at Cortex-A, and while in theory it should work
> for Cortex-M as well, the Cortex-M examples from ST (at least) expect
> some libraries that are not in the Cortex-A toolchain provided by ARM,
> but only the Cortex-M.
>
> This is why in
> https://github.com/bootlin/buildroot/commit/8635d412292eec7bb90bfabcba25a8c238aa2f93
> we switch to the Cortex-M/Cortex-R toolchain for this package. But this
> isn't directly suitable for upstream. More work is needed here.

Do you think that having two different toolchain packages for Cortex-A and
M/R would make sense? Sooner or later someone will probably ask for Cortex-A
also. If yes, I would be glad if you will find my package for Cortex-M/R
good enough to integrate in Buildroot :-) .


Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
