Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6687AC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CADA40948;
	Tue,  2 Jan 2024 20:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CADA40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X05BCL_Iyrnb; Tue,  2 Jan 2024 20:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B3CE40A94;
	Tue,  2 Jan 2024 20:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B3CE40A94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD2811BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A642481E69
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A642481E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvghhutGfkWb for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E92F81AD7
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E92F81AD7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C094C0005;
 Tue,  2 Jan 2024 20:18:08 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:07 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211807.6cf0680e@windsurf>
In-Reply-To: <20240102134652.1287110-1-fontaine.fabrice@gmail.com>
References: <20240102134652.1287110-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UycUNZMd80BSYCo3sUAApgHXuGw1PE3KAuLo7dCv0xo=;
 b=pDDY9zoWKsyvc16Sa6pqrfbXR1HQZMe6fqp6kv8MHdXM2uqU6PLXWCkY8SiylFfGQg3A/u
 XBit7mDSOKkK4J0z6L+cJ5+doYNTie5vmU6vLHjTeMYpw9/E/F4Fwv2Y8qcqI7GI6RLjFj
 GIu2iACwdPkgiqdS1kYyvTlH7/ii8ryPIGt61nR9g1cDMDQOdIaVIeyq67sU0EFtujvCBP
 Q8dOItDufko9AEkLL1MOKG64xvDaehxCzKls3iguPNqIAs7kRXpWtIrTdfILPE/pnJP3BI
 Scsm4UYzCId44RNPiwgCvqNtbrXRvFGQfg5QlNwML0uES5tCOsCNU5oCqV8hJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pDDY9zoW
Subject: Re: [Buildroot] [PATCH 1/1] package/hawktracer: bump to version
 0.11.0
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 14:46:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/amzn/hawktracer/releases/tag/v0.11.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hawktracer/hawktracer.hash | 2 +-
>  package/hawktracer/hawktracer.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
