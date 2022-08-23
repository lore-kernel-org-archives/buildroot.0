Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9F2C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF9F81970;
	Tue, 23 Aug 2022 19:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF9F81970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZYPcgW0IMiH; Tue, 23 Aug 2022 19:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37EAC81951;
	Tue, 23 Aug 2022 19:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37EAC81951
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73C151BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3117B81951
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3117B81951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcjpYQxKjzhN for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:28:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44CF68184F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44CF68184F
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:28:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 83F8D2000A;
 Tue, 23 Aug 2022 19:28:09 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:28:08 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20220823212808.1429293a@windsurf>
In-Reply-To: <20220822061846.81613-1-egorenar@linux.ibm.com>
References: <20220822061846.81613-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661282889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JY+gljp5m/XgkGyT7jcNETbU/jJE3fEbNcK5/GauQJI=;
 b=IRJrCew9Yd6lEbP9tPu4KoaOcTWbzfJvfzPEEDW+rb1rb2Pb2Kz+Qb2aNGxhRHG97hECga
 Kfpd/0HrUdTSTb7hcy4UTyKwCgkOPMgp0NA/j+buLPvg6WkZnw4WWNawhrQ38RngPTbG67
 H6yFppowSJxlZS/PuPLu2ISraBB1oakG7whMg+T8mQJlgIq1VCJxRpfOgwG8rKstmvyRtV
 //L5yvxFrtynmQ9W4HnMDjXekKPMzgRy/AwTk/uccguUPipO+PXrmTFlGAftLgzGgnohpR
 s1JTIFNOCNz4sh5LgRf2BHfjbGMutY/uexOgZqOSA76S0zSxfW17hwWlaXafvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IRJrCew9
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version
 2.23.0
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

On Mon, 22 Aug 2022 08:18:46 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Fixes:
> - https://release-monitoring.org/project/10714/
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  package/s390-tools/s390-tools.hash |  2 +-
>  package/s390-tools/s390-tools.mk   | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)

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
