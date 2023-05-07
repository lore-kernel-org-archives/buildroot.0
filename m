Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5322AC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00E5D821D0;
	Sun,  7 May 2023 10:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E5D821D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vLzppL_VSEE; Sun,  7 May 2023 10:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 405C483C12;
	Sun,  7 May 2023 10:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 405C483C12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C04E41BF307
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99E0360692
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99E0360692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1SXpLxVVHOw for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:38:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FC0060671
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FC0060671
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:38:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 935D119F745;
 Sun,  7 May 2023 12:38:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 12:38:38 +0200
Date: Sun, 7 May 2023 12:38:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507103838.GE252090@scaer>
References: <20230503164458.747478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503164458.747478-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683455920;
 bh=zKqf4VU2Zfyk2+BSTDmCDkSiqHv5NRm3BocG2aWXsug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LKCbKOHJF6URNWw9SR6HST+POqxHOhaN3Oqd0vum3Jm4naxHQ6Fuw6CYaWWit6OKt
 vcU52/G/jXjPJFsaJJ3C6n8UwDcKaPX9c28lB41R8l3uyl8Bq2yRuI/1rEDezgTz1t
 Dbr3kDE6yL4GSgsxttufx6Rcz/V0TN0CDZDO7n9UsV2kyNUsaxNxeGtHYrau5t0nH+
 YbYHGOBTHhdLeMHj6OA1SPWnXuatE6+KjhgIqiiay2q2sm5iRshKUXQowCfzrkxudl
 UND/2gLPt9J3M8ACUKqhSSHflVHIVhdLZ2UdqdikhfMebVzFPYSgsfDKjCSbT/8tfd
 wKMw+CT2jkkog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LKCbKOHJ
Subject: Re: [Buildroot] [PATCH 01/11] package/bento4: bump version to
 1.6.0-639-6-Nexus
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

Bernd, All,

On 2023-05-03 18:44 +0200, Bernd Kuhls spake thusly:
> Switch to kodi fork, remove all kodi-related patches.
> 
> Needed by upcoming bump of kodi-inputstream-adaptive.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Add-support-for-cmake-install.patch  | 130 ----
>  ...-methods-funtions-and-passing-poolid.patch | 634 ------------------
>  .../0003-Backport-Smmothstream-changes.patch  |  99 ---
>  package/bento4/0004-more-SPS-parameters.patch | 219 ------
>  ...0005-AVC-extract-VUI-values-from-SPS.patch |  96 ---
>  .../0006-Implement-SPS-Frame-parser.patch     |  67 --
>  ...-Fix-segfault-when-AP4_Sample-s-seek.patch |  25 -
>  package/bento4/0008-Hack-HBO.patch            | 214 ------
>  .../bento4/0009-Android-32-ftello-fix.patch   |  31 -
>  ...0010-Dazn-sample-duration-workaround.patch |  30 -
>  ...ent-to-reuse-single-sample-decrypter.patch | 179 -----
>  .../0012-Static-ReadGolomb-SignedGolomb.patch |  54 --
>  .../bento4/0013-Add-GetChannels-method.patch  |  40 --
>  ...ampleIndexForTimeStamp-GetNearestSyn.patch |  59 --
>  ...015-Avoid-set-next-fragment-position.patch |  43 --
>  ...ault-in-AP4_LinearReader-ProcessMoof.patch |  27 -

I've regenerated .checkpackageignore with all thse removed files.

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
