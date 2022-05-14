Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8456DC433FE
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 08:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 023C560F08;
	Sat, 14 May 2022 08:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gveOsiRm7OmR; Sat, 14 May 2022 08:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB7460DA5;
	Sat, 14 May 2022 08:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83F031BF4E2
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 08:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 809B8409FF
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 08:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktShdm3H8uwy for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 08:07:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58D56400C6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 08:07:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6A32613F89D;
 Sat, 14 May 2022 10:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652515619;
 bh=Qm6Mk5Vm6wxCyPwLVYOoMq8IrisjpOn5iblJDzBKIow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wbnc/95gICX0JlYnu9a6RxZLXlsdMYZgTYmBR4o7jgK8jgzvEfw60sDi1vcEoUAOM
 zdDva9Yolo8YqXqLWnphI4vVzp9mFSN3ppOT6OksIqPN0cZg4oOaxEBwDzNiuoB/QG
 TBrwZYOJ8V59fChit65Q14Pf+c9OkhYFHVJMj0G42d6VS2dkuPS7NmYHM3vc0nmBbr
 K0gEAfcleYyJMC69FheTCHGkQN1tei/lI5r4Dts1+WMyFOwaG1INxMkvKr9UsCMdf/
 pOCEsxIBPJEmROjvsI5VzDrvQOmE7XMY8fJ5vp4Yv4hUB4mvME/zlXDPaeM13Scvm6
 3G9bDx3MWsj/A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 10:06:57 +0200
Date: Sat, 14 May 2022 10:06:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: friedtj@free.fr
Message-ID: <20220514080657.GX1597494@scaer>
References: <1555656118.650632846.1652515040908.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555656118.650632846.1652515040908.JavaMail.zimbra@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] image generation failure (rm .. error)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jean-Michel, All,

On 2022-05-14 09:57 +0200, friedtj@free.fr spake thusly:
> FYI, fresh download of buildroot-2022.02-rc3.tar.gz fails to complete the image generation on Debian/sid with

2022.02-rc3 is an old release candidate (rc); it is not meant to be used
except for testing purposes. 2022.02 has been released since then, and
it includes commit 38c4f6b807e9 (fs/common.mk: use find instead of shell
glob patterns) which fixes exactly that problem.

Please update.

Regards,
Yann E. MORIN.

> Generating filesystem image rootfs.ext2
> ...
> rm: refusing to remove '.' or '..' directory: skipping '[...]/buildroot-2022.02-rc3_CM4/output/build/buildroot-fs/ext2/target/run/..'
> rm: refusing to remove '.' or '..' directory: skipping '[...]/buildroot-2022.02-rc3_CM4/output/build/buildroot-fs/ext2/target/tmp/..'
> 
> I had to comment
>  echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
> in fs/common.mk to complete the functional image generation.
> 
> Jean-Michel
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
