Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0530AC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9197041753;
	Mon,  6 Feb 2023 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9197041753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnHUdh9yQA4U; Mon,  6 Feb 2023 21:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A238241752;
	Mon,  6 Feb 2023 21:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A238241752
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC4B1BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 385F041752
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 385F041752
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMvqAtdtiaVd for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:23:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C671341751
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C671341751
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:23:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F54D240003;
 Mon,  6 Feb 2023 21:23:29 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:23:28 +0100
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230206222328.5b601f6d@windsurf>
In-Reply-To: <20220731193521.1217825-6-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
 <20220731193521.1217825-6-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675718610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nG0tHyecfgeqZNkoRP234vf0j3dBXw7/7sNRAk+GE7U=;
 b=Ijf4HRrgAFbNmpa/iYPstDPRRGEB0EpqH4h4NPspl+yWoHhGj7pPckur+kmlxjmxK89Nvx
 BIp2XzjhBaNvYG99XFPpqa0HebBNiFqawkCLgvUPMFDGjKtJDXIuCTvu7IcehEBILiOdky
 Upy2K/ZWzcR5X/Caq3CJGTU+Z1k0bmmky/f/C80qIccC5/WF2S1oojdwH1cMUeB3XNeVu0
 Uddf0CIcG7c9U2kve/9/D4lRJvITDx8z3q5CkVoLKD7tIAupqSGb72AS3KHbhkYm1SGkXO
 l880MQGtulhrjRe+/wgtTmAAT0KVZpANOzZQxsjseFEYDVbQUujdzi8V0sN+SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ijf4HRrg
Subject: Re: [Buildroot] [PATCH v2 05/14] docs/manual: check-package before
 submitting patch
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 31 Jul 2022 16:35:12 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Add 'utils/docker-run make check-package' to the default workflow of
> submitting patches, just after the rebase and before using format-patch.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - since the automatic run inside docker was removed from the series,
>     use a 'good default' to newcomers, that ensures repdroducible
>     results, by mentioning to use docker-run
>   - add a small description of what check-package really does (Romain)
> ---
>  docs/manual/contribute.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

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
