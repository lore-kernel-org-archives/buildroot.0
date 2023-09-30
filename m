Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B1CE748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A62418A0;
	Sat, 30 Sep 2023 19:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A62418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiMWnIUNLsW9; Sat, 30 Sep 2023 19:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 477F1418AA;
	Sat, 30 Sep 2023 19:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 477F1418AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74E061BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4720260808
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4720260808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c22FYxnDH40A for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:55:55 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D42960797
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D42960797
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E5877B0055A;
 Sat, 30 Sep 2023 21:55:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 21:55:47 +0200
Date: Sat, 30 Sep 2023 21:55:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230930195547.GI2579@scaer>
References: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696103752;
 bh=2U7KLZQG9kZFRS9CKLpIdIK1ssBUcUHIBdtM+nqk/S4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GF76yXbKPuk4u6M9/Dncs+Jftg8/P3PRwQKu76TAXJiubapRPv1t3cLmATIMlWM58
 E64gtcUpl9E0J/gEZaH1evWKZldyT/XBK3jnNjT9lDv8TcC700mLTSOjWzW+fM+mHF
 /9AJdaUsHfa0ZFNeWhJo/be03IEX7s8yh8KCI3F0AqHyaF02vRrr2eFE1uJG6SCTTf
 UO46HKypBg0OmEqpz1ln+Za1PvEnPMqInguajUaRj4GCEObtJ1V8s1v8ffbmU42l8c
 O659JsvkHcA7n9j6BuSAyFS4PAB36SYqgjrvu7QoZlOCDRSf2WoC2uIfZmL63KJ6xP
 vgi+zZJ8NkBvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GF76yXbK
Subject: Re: [Buildroot] [PATCH 0/4] Bump udisks to version 2.10.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-09-25 22:02 +0200, Giulio Benetti spake thusly:
> udisks version 2.10.1 requires libblockdev with libnvme enabled so this
> patchset:
> * add libnvme package
> * update libblockdev and add libnvme option
> * enable libblockdev libnvme option in udisks
> 
> Giulio Benetti (4):
>   package/libnvme: new package
>   package/libblockdev: bump to version 3.0.3
>   package/udisks: bump to version 2.10.1

I tweaked the commit for that commit.

>   DEVELOPERS: add Giulio Benetti to libblockdev

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

>  DEVELOPERS                                    |  2 +
>  package/Config.in                             |  1 +
>  ...-replacement-function-for-strerror_l.patch | 68 +++++++++++++------
>  package/libblockdev/Config.in                 |  8 +++
>  package/libblockdev/libblockdev.hash          |  2 +-
>  package/libblockdev/libblockdev.mk            | 15 ++--
>  package/libnvme/Config.in                     |  7 ++
>  package/libnvme/libnvme.hash                  |  3 +
>  package/libnvme/libnvme.mk                    | 41 +++++++++++
>  package/udisks/Config.in                      |  1 +
>  package/udisks/udisks.hash                    |  2 +-
>  package/udisks/udisks.mk                      |  2 +-
>  12 files changed, 126 insertions(+), 26 deletions(-)
>  create mode 100644 package/libnvme/Config.in
>  create mode 100644 package/libnvme/libnvme.hash
>  create mode 100644 package/libnvme/libnvme.mk
> 
> -- 
> 2.34.1
> 
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
