Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD39C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E2C281766;
	Mon, 15 Aug 2022 20:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E2C281766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aa4axV5wMz5S; Mon, 15 Aug 2022 20:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA30881761;
	Mon, 15 Aug 2022 20:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA30881761
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 718C61BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AF7D40893
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF7D40893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmKm0zyUuAKH for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:22:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA6394088F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA6394088F
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:22:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7845320007;
 Mon, 15 Aug 2022 20:22:53 +0000 (UTC)
Date: Mon, 15 Aug 2022 22:22:52 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20220815222252.1c8ce867@windsurf>
In-Reply-To: <20220811095221.1226557-1-buildroot@heine.tech>
References: <20220811095221.1226557-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660594973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFf8E7PL+0qhmTzLiHGq/c804qZc5p043/N0oBRzNLk=;
 b=ntB9WJzW34fjAmdBImdS9NIoE1HOHt7UneZv6zC7lljt/698ktCy7yQKX0R7AXRUSX2uax
 PmoxjmX8vgtkNq8xdGItAzs8Fyvxv48fgDfs2DWCmEnCRJwa0ngwZWapJ2EFx1MStPiLxS
 H1ImWyxJ40R+TzlUESA8UuHdVpJVbaCLYEzEPv0nUrEVtPY6vg8IK/sG3LASfXLJgUZPT3
 C8pvdSELtWdGmGIMNb9fRdX/crjbCvmVC/dgW31Rh2Yi0Ko3z/a9iKLuohSgSYm/XCETIE
 kde18ltUV8FjAVXEynYpuDJguSoj0Ki8hYM2eJcYoQHO8Ykb/TzXinjCTq092Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ntB9WJzW
Subject: Re: [Buildroot] [PATCH] package/boost: bump to version 1.80.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Aug 2022 11:52:22 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - drop upstreamed patches
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
