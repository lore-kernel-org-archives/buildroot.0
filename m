Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF6EECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E0682F99;
	Wed, 21 Sep 2022 20:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E0682F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZuVgTlsNa5Q; Wed, 21 Sep 2022 20:10:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590668148B;
	Wed, 21 Sep 2022 20:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590668148B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53C401BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F6D54056F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F6D54056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1Nkzgs-nMsB for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:10:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1168E4058E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1168E4058E
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:10:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 07908C0006;
 Wed, 21 Sep 2022 20:10:08 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:10:08 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220921221008.2970830c@windsurf>
In-Reply-To: <20220917220647.1453182-1-james.hilliard1@gmail.com>
References: <20220917220647.1453182-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663791009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0il4U233gmj3gG5J+lnIT6vV6eN1lsLjg9LpzMgGxl4=;
 b=mfoHktutgHK5CQRLRbA59yaPXG8cK+e56lsG4XcCshgu+kmrm0MvreWQuiv5g+UrQRIc3C
 eF4wi0pipTixUIIK6n454ocjgOUhsokr3vELBdG13vzl+0hZkQ4q7DPUPaE8zztQC+2UAW
 YLpBTFvD+dWeJeaOlJ8tPyJxac/bxsWav2RR2vHiBNr9KEzc1RNThPtWQpOFHKy8ijBixz
 +BXlSj1U3vmcC1IXavZvx2om0t+66UD/AGQhtLBGqIOewiFIpK2jmHrmC8p8lGvveq++Fj
 7D6JNIZTHLL2nSViuXHm3brPweGcESarBricrFleWAeju9Av0nISRj5Roo+ZDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mfoHktut
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-utils: bump to version
 1.1.0
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 16:06:47 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add support for new drm(libdrm) option.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wayland-utils/wayland-utils.hash | 10 +++++-----
>  package/wayland-utils/wayland-utils.mk   | 11 +++++++++--
>  2 files changed, 14 insertions(+), 7 deletions(-)

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
