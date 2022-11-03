Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C995C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9B4481E40;
	Thu,  3 Nov 2022 21:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9B4481E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysmiHkVrVjKy; Thu,  3 Nov 2022 21:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A6D8135F;
	Thu,  3 Nov 2022 21:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2A6D8135F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 433BB1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DBF141871
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBF141871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGD0SfK4M2cE for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:09:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D37D34180F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D37D34180F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:09:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5516260006;
 Thu,  3 Nov 2022 21:09:01 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:07:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220748.3a484c87@windsurf>
In-Reply-To: <20221103202833.216075-1-james.hilliard1@gmail.com>
References: <20221103202833.216075-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMNMJ5+A/r4TdoO1ioBOZUstU5v6fMmeknFucPyUBYA=;
 b=THlhDF5BeTsOLyuoOfIe/sj5Gfeg/PhVp842s1a3X10N8g2+uX0gwX7Hhx/RxV2nxu8dZR
 XHNGY0+AEJx2a7PgadBWOo4VGEAq+vzH2AlYd0qKdzhAjpief55idl5BSMNoYgZvO9HUwU
 rCp73VHAkIw9rR3lH1Rnv4WtlurvPuyJt/Hi9riRtwpbqjehIjCnMmEnC16hjLyqiUMiqf
 NdND4ORZDFUe+XdLWR2mjA0zsPNGm/IbDyZ6Y17JV/GoyNKg9fuiu83jorvggPYfMhoKiZ
 wzaJt1fp6fE/hF/xapmAwvWm8Q7NMUX3pkccUzat4ZsHqhKxzAenAmwAxuLafA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=THlhDF5B
Subject: Re: [Buildroot] [PATCH 1/1] package/python-validators: bump to
 version 0.20.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 14:28:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-validators/Config.in              | 1 -
>  package/python-validators/python-validators.hash | 4 ++--
>  package/python-validators/python-validators.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)

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
