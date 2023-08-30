Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF50C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97FB841814;
	Wed, 30 Aug 2023 21:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97FB841814
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tH3aPRkbG_hb; Wed, 30 Aug 2023 21:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE7354183A;
	Wed, 30 Aug 2023 21:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE7354183A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BDC51BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 357D9612B8
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 357D9612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtS2vxvoQnlr for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:55:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19572612B4
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19572612B4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32826C0006;
 Wed, 30 Aug 2023 21:55:21 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:55:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230830235520.325b5390@windsurf>
In-Reply-To: <20230830205713.1219588-1-bernd@kuhls.net>
References: <20230830205713.1219588-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693432521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiRr777P50V/lWerXe9Ifl+OMMQocT2X7gSjHAG09ps=;
 b=LA+9kNjHQo1V0jenI3NXrrgHFRb0XikOdStQl5+EgSbPic1rmmqKR1UqdxJR6YpgIk6dBy
 FPiVf1iqReK50sXf0SxZmoJzC1AdjYppEDVTOKHeUXUth/ZlpwZCyeLjt4q/AFLiEC80NE
 rjvoAi0+PAr2vuQ5hNFnhVbCm9aoFDhSvAApk/4ZpesP10uS6QBAx04+LBHnwX6/CA5QKI
 ZtZx6p5UgEcvApr5dDn+20bhEA7zQ9vpiCVWn+vczMtEPLKqz7bEIknDpuidD+dl7bPnMi
 opgx3WBD/lgbRByRM6M4x0cMnZt1byd4f5ibBR9gVb0Sd1V8gyLqdItA15kGGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LA+9kNjH
Subject: Re: [Buildroot] [PATCH/next 1/1] package/tor: bump version to
 0.4.8.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Aug 2023 22:57:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://forum.torproject.org/t/stable-release-0-4-8-5/8996
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
