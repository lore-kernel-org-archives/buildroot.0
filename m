Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF0C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E09561AFE;
	Thu,  4 Jan 2024 21:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E09561AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxziY-sHax42; Thu,  4 Jan 2024 21:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D140161AE9;
	Thu,  4 Jan 2024 21:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D140161AE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3414F1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F415E42D9F
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F415E42D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IJYUQqnkDts for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:30:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC57942D9C
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC57942D9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF40DC0002;
 Thu,  4 Jan 2024 21:30:42 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:30:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104223042.66705401@windsurf>
In-Reply-To: <20240103174111.853264-1-fontaine.fabrice@gmail.com>
References: <20240103174111.853264-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8q2PnlFQ10lZnEFtK2w6NekHu1AEpJhN9s636VWyKA=;
 b=LOvoVZ2wyvGZ26Cbz782ZH93YzGo4HpWtOeu8nXIyeeqvIhvp2ILgHoIryfFDwerU7yDcx
 rKJp1lfzxEK5/FGqhQYW3NYVYPvFakKAEVgwx0zmBas9+i2Cl7QqKG4HtBMQYrLQ+0OHwM
 XR7LIKb7vzOk9l1Y2bYY8GwKSGcCCxUyrm0W6hrNFKES4QvIMJVA/qRPdc2XWFKMBGx8fd
 tLS8EjeE0CVGM6QiOV0tylko6q6EJ2aN/2FaqsAwAq3bC1rMsMwBOmYjnNtiOZsXpn8AGE
 MKx6H3Btux6Hpz1JneB0dSCicIsayDkh3acSSeghwrTBdHrLNxH8NQweApVG4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LOvoVZ2w
Subject: Re: [Buildroot] [PATCH 1/2] package/valijson: drop unrecognized
 option
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

On Wed,  3 Jan 2024 18:41:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit d264b6e81e1a03c36df55c66771ed26dd767a522 forgot to drop
> valijson_INSTALL_HEADERS option which has been removed with
> https://github.com/tristanpenman/valijson/commit/c7d5f2cbec08b0e649fdeee6a99f2f1343baaa75
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/valijson/valijson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
