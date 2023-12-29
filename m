Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43521C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 20:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9639D83E23;
	Fri, 29 Dec 2023 20:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9639D83E23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpMVToyc1eG5; Fri, 29 Dec 2023 20:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEAF983E26;
	Fri, 29 Dec 2023 20:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEAF983E26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8DE1BF288
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13BBB61135
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13BBB61135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmaUCs2rO7Ou for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 20:47:53 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B578161136
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 20:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B578161136
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9D1D5B0056A;
 Fri, 29 Dec 2023 21:47:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 21:47:45 +0100
Date: Fri, 29 Dec 2023 21:47:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZY8wcbOiR8eYA0qK@landeda>
References: <20231223212948.2512412-1-ju.o@free.fr> <ZYhjQtmfpGir8zsQ@landeda>
 <783a8cc0ec3eef55827fa3a0bffbb43d@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <783a8cc0ec3eef55827fa3a0bffbb43d@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703882869;
 bh=Dk5KABuEdwQkDvw6d5xaQRVv4tUb7XfApvThq09YcAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZJwsWlosUqjAw7CrksJPP1FM6Dxor+o3KIJ9dwmgfzdFG7S6Af9/+UnUbSB/lpNH
 5ngDMsneu9rZuMiIM9r64hIKuKlWKN1kCnMsb6ByKe0xwO0YyoHO6jIYC+2/6WURpF
 5XehyidNee7doknQqy5htk3HQGU9pt8xkwbZIE7pYa2g4TeCq8n8pJwuY9okeS5JoU
 XOpKqV0IfZ1+oAhJpJkYLl+3DzKEspcDzylUbesHeTqVVfxm0c5wI8eD9uOsl3+nEZ
 QiMDtAsEfKhjqGkpqEYHZG7T/Fs2fkPgbzUh9fnEcPC7slSFBATaeEgXbFgX3hxjph
 Y30wO30Rnx5rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hZJwsWlo
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/grub2: add RISC-V 64bit EFI
 support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-12-29 16:47 +0100, Julien Olivain spake thusly:
> On 24/12/2023 17:58, Yann E. MORIN wrote:
> > On 2023-12-23 22:29 +0100, Julien Olivain spake thusly:
> > > Grub can be built as a RISC-V UEFI application since commit [1]. This
> > > commit was first included in grub version 2.04.
> > Oh, I forgot to add: it would be awesome if you coulde extend the
> > existing runtiem test to include a risc-v test:
> >     support/testing/tests/boot/test_grub.py
> In fact, I already had a test ready. I didn't send it because
> the current Buildroot docker image does not include qemu with
> RISC-V system emulation. See [1]. I sent a patch, accepted in
> commit [2] to enable this support, but the image was not regenerated
> since then.

Hm... I also have a pending series about reorganising the docker images:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=386976

I did not include a bump of the image yet, to not make it too complex a
series, but the goal was to indeed update to a more recent base image,
like bookworm.

> Moreover, this RISCV 64bit EFI boot requires qemu >= 8.0.0.
> Buildroot docker image is still on Debian 11 bullseye, which
> includes qemu 5.2.0. Debian 12.4 bookworm only includes qemu 7.2.0,
> see [3].

Bullseye backports only has 7.2, but Bookworm backports has 8.1.2:
    https://packages.debian.org/bookworm-backports/qemu-system-misc

So, if we bump to bookworm, we could get a more recent qemu.

An alternative would be to switch to another distro that is more up to
date, like Fedora (39 has qemu 8.1.3) or Ubuntu (23.10 has qemu 8.0.4).

> Do you think in that specific case I could include add
> BR2_PACKAGE_HOST_QEMU=y in this specific runtime test config?

I would not care, but I think the runtime test infra can not use the
qemu from the build; it only uses the qemu from the system AFAICS; see
support/testing/infra/emulator.py@39.

So, for now, it means we can't have a runtime test for EIF grub2 on
riscv64.

> > Also, it would be nice to extend the readme for grub:
> >     boot/grub2/readme.txt
> I added that to my task list!

Wee! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
