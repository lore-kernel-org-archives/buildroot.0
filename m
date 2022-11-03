Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2DFC43219
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5082861060;
	Thu,  3 Nov 2022 21:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5082861060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aqj9C1DgA99P; Thu,  3 Nov 2022 21:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B976104F;
	Thu,  3 Nov 2022 21:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B976104F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 249341BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C36341812
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C36341812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvZ-QlNrVm3r for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:08:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF52841811
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF52841811
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:08:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D09A60002;
 Thu,  3 Nov 2022 21:08:45 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:07:35 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220735.7d1c64af@windsurf>
In-Reply-To: <20221103201351.3446271-1-james.hilliard1@gmail.com>
References: <20221103201351.3446271-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ignGPdJoF9P1LFwJP+5kIpuDUKicbHxYK/Dt+noBD4Y=;
 b=Qiq+/sH3VKROnuQWqrebjkvvLdhi8tU0lRk4uvYb/Qg2eB8jGigaRFbYt8TrWc6r6/ifQh
 EIkkOFMhdLNpgYmXUMZCNw7d/12KcE+UfBWLZl8BmVMtdI7UrvBm6vuCIzy8R/YlgHzJKZ
 VvKlm42FJY3Q4MyZSZvAE3FDUr71tp3TnYjQ2/aMISbpcEw516yPvoZx51Pn+C0VP1t2D2
 IMymi7rvgwju2S5nqMQJLZ1nHFe8dqt9mmxfufiR6xpBa4j8p8LUH5AYmrv/SarnEdGtp5
 hfnvRnK0SwrNimvuwSNCwupMKCsVzfUP/eLlmNQaLdGyMp7ZcYuxlW7U5gFqZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qiq+/sH3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version
 4.64.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 14:13:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new host-python-setuptools-scm build dependency.
> 
> License has changed due to file->project word change:
> https://github.com/tqdm/tqdm/commit/5df32ae36013ed056619aa0b90f7d249d04087fa
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tqdm/python-tqdm.hash | 6 +++---
>  package/python-tqdm/python-tqdm.mk   | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)

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
