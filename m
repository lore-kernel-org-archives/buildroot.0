Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD732C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C17043290;
	Wed,  1 Nov 2023 21:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C17043290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6w2-ukdfq-gd; Wed,  1 Nov 2023 21:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72BDB432A4;
	Wed,  1 Nov 2023 21:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72BDB432A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18DB71BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E827052C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E827052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03z2lZrxR1jM for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:55:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E3617052A
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E3617052A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99C5220004;
 Wed,  1 Nov 2023 21:55:40 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:55:39 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231101225539.783ef8c6@windsurf>
In-Reply-To: <20231016170506.1868429-1-adam.duskett@amarulasolutions.com>
References: <20231016170506.1868429-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698875740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekjeLq4xsnHUzFXFPO3uZd1iONapikubWstq2SAK/6k=;
 b=eqmOxiKRQVfEPJwTIAr0k7dcHDlm+4P1OyPOeGRsVqcVTsi/zbpgX1a3J9WgG8+L1omB7N
 zy1O223SyXlo8kpNtFvkhY/wgig7zKkfBIZycUYX2msGRB4b11p2aVxNYG2i9Bi+ik3+uQ
 bfkAfUElxzaFRjL/1Sj9pZ+Ze90rApRJI5IiLTJb5J7472vn/EoIvvGAXGELHV14jvqc2z
 TgaPqjV1JfP2oQWd0gVvuZnDr+UvMx8/soBHFC+nOt58MJhXWl8QYm6G5FGgMN59CdFXZ+
 kSCcWfeWJQyv8OhwbcEJcb9e1et1aF/oFf+s6TNL4E8mWCMWM6xIFIzaVEXv+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eqmOxiKR
Subject: Re: [Buildroot] [PATCH 1/1] docs/website/support.html: Add Amarula
 Solutions to the commercial support list
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

On Mon, 16 Oct 2023 19:05:06 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> After talking with Thomas Petazzoni, it is agreed that Amarulasolutions should
> be added to the list of companies that can provide commercial support for
> Buildroot.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  docs/website/support.html | 3 +++
>  1 file changed, 3 insertions(+)

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
