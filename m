Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517FEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA17D40C32;
	Wed, 20 Jul 2022 21:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA17D40C32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gvl4DXNgx4sP; Wed, 20 Jul 2022 21:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18A8241029;
	Wed, 20 Jul 2022 21:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18A8241029
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E4911BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 789DA83FA3
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 789DA83FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yO2jlZrxCirP for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:16:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A0F83F9A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56A0F83F9A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:16:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DFCE61BF206;
 Wed, 20 Jul 2022 21:16:23 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:16:23 +0200
To: SmartCross Developer <andreadaoud6@gmail.com>
Message-ID: <20220720231623.51420a18@windsurf>
In-Reply-To: <20220630035028.3090253-1-dev@smartcross.io>
References: <20220630035028.3090253-1-dev@smartcross.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658351784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYLQZ9aMsfT4H7py2dkiHC8Zhvj8DpCq+M1iwpHEtSc=;
 b=dYhGEthmgezqfeyRApSFIm3K1N2E8D+w/NJM/EltRa4Em9pcUl9QPXo+TRGAg17H3QeKmZ
 dxAFchYQChyD51W0WLz5mTWH3Ny7/MD4/p2j1arjjUmjwPqu+zL9i4J5mJqUusRylWndbv
 1r8qeKbgfEQz5bt3GGc+KeauilLJuQpN8j6lvMa8HxxT96IHEAJ31e8TVXr5FVebl0NuVR
 x9+Oipcb8/BN7EMz7aJ9p0nJSpATmv0xj332SPkC7F9LXF/+xb9dhXrZrbUlAm0VE6ChC/
 veOZIjo55oUVEUGAac5nHY3BQVBevdG2VnkS5iSsucg/yemQ7lP3yFcWBo9jKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dYhGEthm
Subject: Re: [Buildroot] [PATCH 1/1] package/stm32flash: bump to version 0.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Bernhard Petschina <bernhard.petschina@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Jun 2022 11:50:28 +0800
SmartCross Developer <andreadaoud6@gmail.com> wrote:

> From: Andrea Daoud <andreadaoud6@gmail.com>
> 
>     Bump to latest official version.
> 
> Signed-off-by: Andrea Daoud <andreadaoud6@gmail.com>
> ---
>  package/stm32flash/stm32flash.hash | 2 +-
>  package/stm32flash/stm32flash.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
