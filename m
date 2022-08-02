Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A296C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FFE40515;
	Tue,  2 Aug 2022 22:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7FFE40515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84PqqxvSH8k8; Tue,  2 Aug 2022 22:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E2E440354;
	Tue,  2 Aug 2022 22:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2E440354
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 985101BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7076D4091E
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7076D4091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIxWOZKNuBHm for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:24:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 438DD403A7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 438DD403A7
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:24:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E8A51C0004;
 Tue,  2 Aug 2022 22:24:07 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:24:06 +0200
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220803002406.21339487@windsurf>
In-Reply-To: <20220802174334.285384-1-pevik@seznam.cz>
References: <20220802174334.285384-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659479047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=na9RVS3XBfF9cxxCEZMyG9K1KaljbgRfQx80VVo3qJY=;
 b=PUIskwb5NvpWT1a367pAuklN4ZDG5URUOCrXkganCbwFL29eHvVS2uCiZ6BgKs18umxRvH
 QuAtZuGj83th7omnpWhlAKffZHECUXNY5i3IIvVok3qHQB+2LVwDPsgmP4fRZWRtuaZC51
 GxmnriDZx5YmvKGt/NK0QYNp1krM42iromj+kXItlaz8eian58WOfP93kq0V9rQ3xrGlQK
 JqoXPm6ziTw3L5p+P/70J5CPOx7uMgZPst83otkuKyOpqkcmVy7N86D16MrTahuIQervms
 LA6nwRwWdR5GgIFyEIH6BCYduH2rB32Rd5LLysgZLVulYvhvTLdZ57w6Q0Poiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PUIskwb5
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: bump version to 9.16.31
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

On Tue,  2 Aug 2022 19:43:34 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,

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
