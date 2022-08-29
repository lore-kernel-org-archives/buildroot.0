Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAC4ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 15:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF7E340CD1;
	Mon, 29 Aug 2022 15:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF7E340CD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTJDy0z33RAn; Mon, 29 Aug 2022 15:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C58644051E;
	Mon, 29 Aug 2022 15:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C58644051E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 350381BF28E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CF1960F75
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF1960F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvrOpfLRVDx8 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 15:38:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B426060F5C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B426060F5C
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 15:38:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:db58:8a5b:83c0:1d37])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 67B8A780514;
 Mon, 29 Aug 2022 17:37:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 17:37:57 +0200
Date: Mon, 29 Aug 2022 17:37:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220829153757.GH2569@scaer>
References: <20220727221055.1838031-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727221055.1838031-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661787481;
 bh=rJY4JCuSZmVDC9vA14ASRGJEmg/fmNN5MXI7T+zPaLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcvIbWv3r32GJTua7o5ShWpCTfjTYd9lpzb7qe7JzcgLFcmWqhaecUe72bVjZmkqm
 8B8kAqSOWHI3vwxkiQYakndtXJd/hFnCAhmoEvW6L4/LDKqCR1U5jpZdzszMg4HGo3
 sPrq1/u4m3fQw2v0TQvpWggqrigd7F1QHmj4lOMx8eepKDPyaaksbXy81lTt1MZdYe
 6gzIj/fO8YvNCVM9/iTQiXqIDEQHaSE0J/w2V7q8+oAH24QcdLVXC/DjDLOpbyG9n6
 7Dn48NTmQYsQbNf1T7Y441esMkzkSnCUdlTe46sMAzJjJzMftpDHfI5Val2fIC3PMq
 68Pqads6Et5Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PcvIbWv3
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: use statically linked
 host tools
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-27 16:10 -0600, James Hilliard spake thusly:
> This lets us remove the HOST_SYSTEMD_FIX_RPATH hack.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Given the feedback from Norbert and I, I have now marked this change as
rejected in Patchwork.

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
