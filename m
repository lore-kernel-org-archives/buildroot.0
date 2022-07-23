Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEE7C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84EA484C37;
	Sat, 23 Jul 2022 20:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84EA484C37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8axtG2w6-t36; Sat, 23 Jul 2022 20:35:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61A4584C26;
	Sat, 23 Jul 2022 20:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61A4584C26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 612FC1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BD8984C26
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BD8984C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt1PWv42OLq2 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:35:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F6C84C24
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2F6C84C24
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:35:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E8D26780504;
 Sat, 23 Jul 2022 22:35:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 22:33:17 +0200
Date: Sat, 23 Jul 2022 22:33:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220723203317.GM2641@scaer>
References: <20220707051257.4709-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707051257.4709-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658608531;
 bh=shQ55gVbwWCwntHgP2P6xZmaxSCLjBSAFKr861Uxpkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YiZ6VOGapO+AmNf9VzDXVDMxTfxSDG1PfFyJ1rYkV0A09AsDCklk96df4w4JpoMgQ
 wA/IUasVwWl8ugceNmi+uBmyFo8XiSd/v236u5E+LavyRPGcCWkDea5o1pPAg9h5P4
 C8CexhHwSs0iHU3xpnsoHsayvESOToiyjkHSWjt2A1ncpsk4iyX4X4hx0B1l5Bvj7P
 2/SgCeFFAQ7Ufbw202x7iNQAWyOPIKhoXpS1vWB1CyKduVQeNog4DnWJ/WqtiUikSo
 epyXDfX5HQcZGqUqNT581lG47YR+rDwjp5obPoVjeF6nYJCFKYM/jw4aJCC5oqlf3/
 Ls/X+8XgncZgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YiZ6VOGa
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.1.3
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-07-07 07:12 +0200, Bernd Kuhls spake thusly:
> Release notes for 22.0.x:
> https://lists.freedesktop.org/archives/mesa-announce/2022-March/000665.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-March/000667.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-May/000673.html
> https://www.phoronix.com/scan.php?page=news_item&px=Mesa-22.0-Released
> 
> Release notes for 22.1.x:
> https://lists.freedesktop.org/archives/mesa-announce/2022-May/000675.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-June/000678.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-June/000681.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-June/000682.html
> 
> Removed patch 0006, upstream committed a similar fix:
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=22.1&id=623ff4ec4295dc67bc0c99ed5336eaae1ad76cc9
> 
> While sending upstream the rebased version of patch 0007 it occured that
> the patched file include/c11_compat.h was removed from the main branch.
> Instead of keeping care of two different uClibc fixes, both for the 22.1
> branch and the main branch, we backport two patches from the main branch:
> - patch 0007 which removes include/c11_compat.h
> - patch 0006 which is a pre-requisite of patch 0007
> and add an upstreamable patch as 0008.
> 
> Updated license hash due to upstream commits:
> https://cgit.freedesktop.org/mesa/mesa/commit/docs/license.rst?h=22.1&id=8bd0446d00dd1aca3cd81ddddc463738aaf3ce61
> https://cgit.freedesktop.org/mesa/mesa/commit/docs/license.rst?h=22.1&id=d16263cdee95ec48864ad7a0f90275e8a4fd374b
> 
> Removed all DRI driver options due to upstream removal of all DRI
> drivers:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=4d45b280bf9a1c804cea5de4d15c317b6bdebfc5
> https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=f464871932882003e01e3459c8d126dd975d60f8
> https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=0cad451f007f366d94e058b7c717b96723a3e6cd
> https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=cdde031ac2c8124721655532ee6f4149e20e9c61

Thanks for the details about the drop of the DRI drivers.

Note that the minnowboard_max-graphical_defconfig was using the i965 DRI
driver, so that would no longer build. So after discussing with Arnout,
I removed the defconfig because switching to the Gallium driver would
require access to an actual board. An interested party may send a revert
that switches to Gallium.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

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
