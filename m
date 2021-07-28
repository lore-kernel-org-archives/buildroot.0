Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E90C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 17:28:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414D56103B
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 17:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 414D56103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E7E40249;
	Wed, 28 Jul 2021 17:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rufjtxQnBy8K; Wed, 28 Jul 2021 17:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B95034023D;
	Wed, 28 Jul 2021 17:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF1C31BF476
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 17:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E79160629
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 17:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stwuyNYEp77d for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 17:28:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC19E605CB
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 17:28:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:453b:e753:6c2:161c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B038B2003EE;
 Wed, 28 Jul 2021 19:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627493323;
 bh=FRHe86MtzMISPrpD/qBKaVNKpgJRFAZNwYkuBCPePVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AXcEjN+el6RPBx64iaWuxds5alIzmabG+Eng75K4Szoqh9vJXb643E0pddVPW/bul
 x09MsX/uyrIuVYeV7CV+bara6QeiRRSiIIgCf0nc1Ui1mammdU46LIFhcPWjpt4ZK2
 nle/kHpuY8QW5I1OmmUcg5WHRVImSV43I775U8SQv0ZPXUP/vVI6AuV8/bMkEplR8g
 WDBIARIRMx+WZcfKkYjTA0R3eedF9ygbS6Cr4AwMWZabTVOmkmMdEWky2i8ZrnbyHt
 F6U2EVRC8QuDJBELVoStmGKndKJ7fF45dxOJQ05YK2oiIHVQhSE6z5xE5vfyRsb1zI
 r4wN5/Gq0ICew==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Jul 2021 19:28:38 +0200
Date: Wed, 28 Jul 2021 19:28:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Message-ID: <20210728172838.GA3189549@scaer>
References: <20201021082012.1592809-1-tomi.valkeinen@iki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021082012.1592809-1-tomi.valkeinen@iki.fi>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kmsxx: bump to latest
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Tomi, All,

On 2020-10-21 11:20 +0300, Tomi Valkeinen spake thusly:
> kms++ is moving to meson build system and there has been plenty of
> changes since the last version bump, so lets update the buildroot
> package.

Since your patch, and the review by Peter, we had another patch posted
and applied, that bump kmsxx to a slighlty more recent version (by 1
commit! ;-) ), so I've marked your patch as superseded.

However, there are newer commits in kmsxx, so here's your chance to
respin a new update! ;-)

Thanks!

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
