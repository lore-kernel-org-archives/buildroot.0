Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7153CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B1C419A0;
	Fri, 13 May 2022 16:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6u4cbgsXj5l; Fri, 13 May 2022 16:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B62C641941;
	Fri, 13 May 2022 16:55:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1FE71BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE79F60ED4
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aw4BJ96ijgxL for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:55:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7A2660C29
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:55:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3712A13F88F;
 Fri, 13 May 2022 18:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652460900;
 bh=3U1HQBADtvn9x5Ec7+F3BCbiTK1LeIOclFDdij1ryZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dG2WEZ1x8HvWWrdaYfKtSTZci91eg8xEqknzES0FQSy0xg6LVjv53QxKG6hlV+mm9
 0WFC9GhNWkShZEgkPMPSIGsxNzuqol4QdnR5W+X6pRRzS6hWdCnBa/GyNvQmyJZ1Gn
 apTMaoJBXC4krOfnFHroEQWgoVeoSZymlo3WH8z7EGMnU/73HWWJkhy4KlBQ+/JAZB
 WMAmW0UVcQTIvlO4iZc5MLmfJZn5VN7yZVhtXSGcm8/iHJQHcTAKYjlpyiJ0RnhaFP
 db6X9pEDGVyi3CwVUK5uwuO9GqbeeHAjnbs3eDTCpKAIw9MiVYALncjFvtCfmJpKZW
 JAqaEF53nXFQw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 18:54:56 +0200
Date: Fri, 13 May 2022 18:54:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220513165456.GS1597494@scaer>
References: <20220513071046.18618-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513071046.18618-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 0/4] Bump netopeer2 and dependencies to
 actual upstream version
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
Cc: Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2022-05-13 09:10 +0200, Heiko Thiery spake thusly:
> netopeer2 has the depedency to the other packages and expects to also have
> these updated.

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> Heiko Thiery (4):
>   package/libyang: bump verstion to 2.0.164
>   package/sysrepo: bump version to 2.1.42
>   package/libnetconf2: bump version to 2.1.7
>   package/netopeer2: bump version to 2.1.16
> 
>  ...IX-netopeer2-build-fails-when-buildi.patch | 34 ---------------
>  package/libnetconf2/libnetconf2.hash          |  2 +-
>  package/libnetconf2/libnetconf2.mk            |  2 +-
>  package/libyang/libyang.hash                  |  2 +-
>  package/libyang/libyang.mk                    |  2 +-
>  package/netopeer2/netopeer2.hash              |  2 +-
>  package/netopeer2/netopeer2.mk                |  6 ++-
>  ...uild-with-musl-libc-fails-due-to-unk.patch | 42 -------------------
>  package/sysrepo/sysrepo.hash                  |  2 +-
>  package/sysrepo/sysrepo.mk                    |  6 ++-
>  10 files changed, 16 insertions(+), 84 deletions(-)
>  delete mode 100644 package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch
>  delete mode 100644 package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
> 
> -- 
> 2.20.1
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
