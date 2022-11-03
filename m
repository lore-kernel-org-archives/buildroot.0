Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424BAC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E230441826;
	Thu,  3 Nov 2022 21:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E230441826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJQ2mNSkL_WI; Thu,  3 Nov 2022 21:24:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 812FF41876;
	Thu,  3 Nov 2022 21:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 812FF41876
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82E1F1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A21340BCE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A21340BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qx7_vnd223k1 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:06:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD04E40BC6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD04E40BC6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:06:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3FF43240006;
 Thu,  3 Nov 2022 21:06:20 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:06:19 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220619.6d52457c@windsurf>
In-Reply-To: <20221102181035.3823486-1-james.hilliard1@gmail.com>
References: <20221102181035.3823486-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5HgPE3k6O2XgGta09nuJrmRwehAS865j8CdzfHBI1I=;
 b=MM5zbXmdWi1c6gKtwA1a9KQMxMiJTtz2kGjNKsWAFNebpwVLMc7x+8GkruxFe0DCHiCDos
 2TzwoIzX7H1sGGjG2aJbqK+2ozOVtJgERyzYJ4inq3905YHosrgb/kklPkryOeYwlIaN53
 Wclr21guujly5W0MGHcyCTwcaxDaQgnwPBvVCk1i+/UijHLo0kC/PfSJnG07jrmrXm3O21
 Tsl5vqacdFvzMNesmBY1tMSmLwupnB/dFEV5py8B66mNCITG4vm7pquR0etXjqdyGNLQBt
 MxMxhdC7an6PZEGxXsJdEO6Z2loN5vmtIGyMqIV2/ZMwXTfk4gUiI4CD00PvMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MM5zbXmd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-babel: bump to version
 2.11.0
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Nov 2022 12:10:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to template update:
> https://github.com/python-babel/babel/commit/8f5757cc85402a46c1db722f08c18cfa7f119858
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-babel/python-babel.hash | 6 +++---
>  package/python-babel/python-babel.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
