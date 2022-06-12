Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42535C43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 22:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64D283004;
	Sun, 12 Jun 2022 22:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fh3digD3VAB4; Sun, 12 Jun 2022 22:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0540E827BA;
	Sun, 12 Jun 2022 22:39:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55E2D1BF356
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 447F7607A4
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jzAxuTNIxIr for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 22:39:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A85660644
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 22:39:29 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s124so5991804oia.0
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kwSMQ3FJxSfJuYP8angS15o9oehZCHf7TTGuDvk4sdM=;
 b=iIWyzaPOQf70y9Ov3PKzO+XbYKs300ZLHORU7P/WHkU7EzpLUUyIsVWRQ3kjDlMTnk
 kShD/r3jtC5vfWjAQGKZ3Y8jpC34ivP64gy1maw2YW2Nmhm2KBI0+pGa4NjnPJwDQUGp
 CIYntLBa+44fGFbfQ/jHKvWF4CBO2dszkXhawKM1OWwTf4Vy9buOwfUbmwgP/3AvAN2M
 9eDRrH25aeMkBU0KnoNnyrQL/vSuaO94DbTafl3cgjbd/ssf3JbAmyuGwc7/QN0SGCZB
 hNNW9QaSaSs0+Jik+shDE5CPp1Bemp+i25FT+Y5ADFgmqnNrIhR3I8ELUk6/lp4QnC4p
 IUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwSMQ3FJxSfJuYP8angS15o9oehZCHf7TTGuDvk4sdM=;
 b=MOvl88XSSCrPwvsl/XBIYTr/ELSgcxAyidzZw5q/+5oVMbk8E9Oyp3oEhPkCKF6BG3
 NlkaXt+xUImvdDnh5TnKBvg3MiJswBcfMYsPmBLHZR6SruCT31VOBYF6i/mbgi0RWtp4
 P8YH9rt+za+7X0AjV/silimZ6LLZE4dA++/t8Xx9xWQOh+xtfcKybLRrazQyXYRuaFyL
 s8syzO+d0TynrWIuU2fakfG/d6dBQnEoQW67EfFL1/0Psa8u6Q06mNds7KC7gp47G61/
 iSpDn5gI2gjmM1hIudUDJlpT7+GXGY1+y1vU26VQylSyWnOcKmfH8ln3YBQJBpN+il5X
 jIzg==
X-Gm-Message-State: AOAM532XH7f9zKyk2ZoP+CB/GcQa60kUyuNGopIwViYLqh7orsD3mHqk
 QvrmxPTx8MdV/bs4d60Ftv4aaP1YV1WJPsZ5wrOKSi0dZLWWcr11Bhk=
X-Google-Smtp-Source: ABdhPJwkWQq8MRGTIyhfQeF7ovsk1b5r5ZwX8z31KTOV/zj0vb0Xy0kzM9P/NVgjw61+n2QEhwFUs8LrXIDSj4vBd0g=
X-Received: by 2002:a05:6808:b11:b0:32f:3b9f:9156 with SMTP id
 s17-20020a0568080b1100b0032f3b9f9156mr1693962oij.64.1655073568420; Sun, 12
 Jun 2022 15:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAN5CKbd9yxwUwnxEd_Vw=B0io4fh8GBj7rnrJJEuOb3uZJ7ptQ@mail.gmail.com>
In-Reply-To: <CAN5CKbd9yxwUwnxEd_Vw=B0io4fh8GBj7rnrJJEuOb3uZJ7ptQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 08:39:02 +1000
Message-ID: <CAKmqyKM1r1Os1m_CV6FwbxHzSGu+YXMuoDLADxeejFJn_2pX_Q@mail.gmail.com>
To: snathick <snathicktechno@gmail.com>
Subject: Re: [Buildroot] network/ssh issue on qemuriscv32
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
Cc: Mark Corbin <mark.corbin@embecosm.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jun 13, 2022 at 2:24 AM snathick <snathicktechno@gmail.com> wrote:
>
> Hi,
>
> Unable to connect to network in qemuriscv32
>
> steps to reproduce the issue as follows
> 1. $ cd buildroot-2022.02.2
> 2. $ make qemu_riscv32_virt_defconfig
> 3. $ make menuconfig
>    changed init to systemd
>    enabled openssh
> 4. $ make
> 5. $ cd output/images
>      ./start-qemu.sh

I suspect this uses SLIRP by default

> Able to boot the image succesfully.
> echo nameserver 8.8.8.8 > /etc/resolv.conf
> when i am trying to ping as follows
> ping 8.8.8.8

SLIRP doesn't support ICMP, so this won't work.

> no response
>
> unable to ssh into qemu from the host machine.

Did you setup port forwarding with QEMU?

See the QEMU networking documentation:
https://wiki.qemu.org/Documentation/Networking

> Hereby attaching my config file.
>
> Please help me to resolve my issue.
> --
> Thanks & Regards,
> Snathick
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
