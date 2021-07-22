Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B6EC6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 15:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD5961009
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 15:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAD5961009
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5544018C;
	Thu, 22 Jul 2021 15:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GJF5zRzkwko; Thu, 22 Jul 2021 15:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC79A40180;
	Thu, 22 Jul 2021 15:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB82B1BF3F4
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 15:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB3228274F
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 15:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=protonmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaL-vIStgkZC for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 15:08:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1282F82730
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 15:08:43 +0000 (UTC)
Date: Thu, 22 Jul 2021 15:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1626966520;
 bh=doo4eOU6QIjEDb99TimeXVg977VVhPlU2sAP7fNADxk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=og/47yRlv8gSMCkeWlRNvWq/hHHbzfUbF5KNH6KefZPf6dymHfv6fAkC4gNw/MUUK
 VGz6PUCCq2DHh5pfkwCTrnNFv6Z0cz15Idg8X/q2X+m3zSYToKvU9dThEfUp+P2gDt
 c0DJ9R+6Bwjf2kDcsEWFuTpRt0NAxHFMd+KzLolI=
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <fygXNQJgFRmBR_x4j7fZXDIjtKfky58qMQCitoyGA9h2F4XRKCAwpHStKVbzEBwkkbNiYPMAlTGR8rLILsVtr7rTYhv_5w_ym28qEdUUzPU=@protonmail.com>
In-Reply-To: <20210716232556.5114f9ac@windsurf>
References: <BwTIMG2dlIPHQ8gnD4pEBqu_ZFaAB68eIBIQSL4hBxIKiOBYIy0ZulAnqlLsgHU6CI6a5n2-7gh08GtoLNHmobnYlDbSbmm0ixqkAT33FdA=@protonmail.com>
 <20210716232556.5114f9ac@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gcnano-binaries: bump to
 version 6.4.3
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
From: "Patrick G. via buildroot" <buildroot@busybox.net>
Reply-To: "Patrick G." <pgeiem@protonmail.com>
Cc: =?utf-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas

On Friday, July 16th, 2021 at 11:25 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Could you test commit 59db11c7c445ef8662163a80997aa71f760a0359 and see if it works for you ?

Yes it works for me, basically it's the exact same patch he split version number in two parts.

Best regards
Patrick
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
