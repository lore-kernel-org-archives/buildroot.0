Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B88BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 23:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2DF605E3;
	Sat, 15 Jan 2022 23:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03DvuEiJHYID; Sat, 15 Jan 2022 23:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E074607F0;
	Sat, 15 Jan 2022 23:04:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6341BF36C
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 23:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5620C818CA
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 23:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqLOVTjONZsY for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 23:04:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06083818C9
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 23:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642287876;
 bh=fHy39lOe7gO16eFmQmn0KRKZ/mWDBR4jy6ajyB4Jgtc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KystACmOm0vig/Tr+Kc2SsVRYvLtTLAaI7ciWz6bDRwWg9243bmYyRqoQrkNTiXX5
 tUp3Q6Jwlov6nFxeqk7tINCNmjiH/zxYxvyToDOkoQm9YhPWCr/0YQjXvGDVHAmFQy
 A2UWfW1NZ5Z/7EvTgV4Gg6JJPdPgiHQhvYIY2N+Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.238]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPXdC-1mv2DG2FPO-00Mb9r; Sun, 16
 Jan 2022 00:04:36 +0100
Date: Sun, 16 Jan 2022 00:04:35 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220116000435.03d5b920@gmx.net>
In-Reply-To: <20220109144430.1064ea1c@windsurf>
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
 <20220109142748.4f7c1a59@windsurf>
 <20220109144430.1064ea1c@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:xeO4HmXQMjQUiEA3dLsd/1nFD+augn3TcTleYNPh1o+/yjIQef9
 fJIumr7r1BDE+TLdaBnDJ+IAR6lBOfOAPKXAwtRoTnxQ+/ATJ3yzhICs3BSNMzEdBqb3ZRJ
 qB3jlqW2v8vR149ptgLZ5jszgR4srKMIpvY/SSdnmVY8/0AEJ/6cnFlO/dwDTkcnqSPt5yM
 BepeTYe/L3V9PEdrSQQOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l6Bhd+9mu1c=:q/DaBx2urFeN8i7K1/XMUG
 Nv32v7579HURTZt4tFQ/gJXwgX4hSbnpNj1mFiB2kR37SEVwgaHXXN+s4WuxJ9tzNDXg1mRnw
 GGnbPLIsYDhre6Hw70DUrJWiMMfoLkdHsOWG/kCCxsdnAIcrwhmcAKpMnVT58rDRinbtsieje
 fEq7HePfoAzn9VzZieaLF0JAPRH0JnW/PY87s2CzLD3biiLyzRCy1Vk0tPXgNbMVlZgrGHZfu
 wvsj3WWkQh28f5WUTEi+w3pJc3fkrMJtV30FlEWifr0kNZAFJTd5hxuv6cNWnDfF1m783wUfd
 vhsrxzF0uCeDkk9vvKdI0BANavNCS5KucFac9OGJAbpeHM2S0vYEje2ZkW89SVlbEgYakdJPn
 yaja9AlySyuWm857m0G4dGS3laA271t2krBUoiw5UpgzS+lQsQGO8eMey05K8VEkGylh8b52G
 vZcCXE9XcNZxaScgsLb+GAiTuHuXiKOD4dgoW4hs79/gwkf7s5WJpdlXBzra+P3DmHwgj/e7F
 doLaaoSqrt1gwH+b8o0GzFcTchanQ8GPbQGpm5kX0sD2qsaaF7OcmWs6ORx1TtpttOdi7lpbK
 YGFSLTKJWn9/IMik1E8PPym9Gcs21XSlMXjUibjEc8+wcrTewINv+tEhmenhmfMcrtERDbtd1
 dleJL4QkJV3kzMTOZ+8Cg58k4KcqjI092DEpL3TdA2SJLaDq4bxeoXv8ZW5WerrpceS4yocpP
 wVdthB4sdbmkTnYfNHnbVQ3rskhMXccE/MVXHljCgZ0kIcQfuh/dcAvA+18A0qWco6k2K7o4b
 AuEpFAMm4GVG6wbu2AQPBIR2XCihqVOwPWkUaxRn3eqsFe5wY8rndo4RRnyYtAB2fWMp/orKK
 tdJFyc0Va0OFvcgUwiBWoFd6w8KYrNAJZxBjmJ9Sncd4Izq/nky1ZgY1D2Aq7lpepkuV//5P9
 /63ZlnL+1pPvaTJgnJj+QVxZ7FkV8UpCDoCxHlI/MVoMe41Luht7kj/vP3UoYTjzRbJ4flcdw
 czTHmzUSDIp1lNZZkOIIlWj92N8sRoNUwAVJkLiZeFvGTDg+irIvgmCLh9QfGxKDeGkGBbwZc
 noFny0mRHF/9XU=
Subject: Re: [Buildroot] [PATCH v1] package/qt5webengine: add optional
 host-freetype/host-libjpeg dependency
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
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@busybox.net,
 Martin Bark <martin@barkynet.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sun, 9 Jan 2022 14:44:30 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, 9 Jan 2022 14:27:48 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > I am falling into this issue while building the following defconfig:
> >
> > BR2_arm=y
> > BR2_arm1176jzf_s=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> > BR2_PACKAGE_QT5=y
> > BR2_PACKAGE_QT5WEBENGINE=y
> > BR2_PACKAGE_RPI_USERLAND=y
> >
> > Did you had the chance to investigate more deeply why having fontconfig
> > support in Qt leads qt5webengine wanting to find freetype2 on the host?
>
> Interestingly, in commit
> https://github.com/meta-qt5/meta-qt5/commit/280487f20bca829527a597d6263b0344a01917ac#diff-f0ffde666f6ff0282f8400203b3ba20968494d3c7245106eca761bd79baa1c78R26
> the meta-qt5 layer, when upgrading Qt to 5.15.2 added jpeg-native and
> freetype-native as new unconditional dependencies.
>
> But there are no explanations. Is it really because the Chromium stuff
> is building a host tool with freetype/jpeg, or is it just a workaround
> for some incorrect behavior of the Chromium build process that needs
> freetype/jpeg on the target, but checks for them on the host?

Would say yes...

Regards,
Peter

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
