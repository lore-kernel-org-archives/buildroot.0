Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8224DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36C7C404EB;
	Wed, 27 Jul 2022 10:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36C7C404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KcCoEdX_hbs0; Wed, 27 Jul 2022 10:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5309404D8;
	Wed, 27 Jul 2022 10:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5309404D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B01D1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED28C40498
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED28C40498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYOcdjCo6AYi for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:49:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0189240105
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0189240105
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:49:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E08561BF204;
 Wed, 27 Jul 2022 10:49:47 +0000 (UTC)
Date: Wed, 27 Jul 2022 12:49:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727124946.20fc3a98@windsurf>
In-Reply-To: <20220727094719.1086106-1-fontaine.fabrice@gmail.com>
References: <20220727094719.1086106-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658918988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtyY6y6o+6luAXMdYNAUPcw4+BwkrEXfQxPHru6cYSw=;
 b=U5hWwYConesh1UIkZAPPDtwNLhp+2kCJm5kWCLRrLsU/bKmo7ozeTNgTl7/xacuzBOqf0m
 U0NbshFbEBoYw92bt9PTYiNdqt8inioIEp5NMFQXBYhQedRivRSoBbFVqe/fAizyxNFPh9
 1PGCvsmnQOAiKkVtevxVPhNbElPdEJ7pKWPVGKuGQNqmagQQFfMIQrXuay5AhxM6a6H9X8
 16y5m3zQ65sDNNxB8ULlg7bd/vQjx8pCfDGlLe6CV2lQAApIewYnd7ifDn47RMPMZHPfh2
 098EfV2ihKXYT6m7msFmFfsjDFVGUW/lQLgDfwKenixxtZfr8UYHdV4WGXbRZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U5hWwYCo
Subject: Re: [Buildroot] [PATCH 1/2] package/cryptsetup: add nettle support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 11:47:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> nettle is a crypto backend since version 1.3.1 and
> https://github.com/mbroz/cryptsetup/commit/35d6914779578908e7b37abfdd188ec7c8101404
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cryptsetup/cryptsetup.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
