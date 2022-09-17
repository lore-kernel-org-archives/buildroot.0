Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AE7C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34C9843E4;
	Sat, 17 Sep 2022 14:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34C9843E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oLyQD7LZvTU; Sat, 17 Sep 2022 14:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F025A843DB;
	Sat, 17 Sep 2022 14:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F025A843DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7672A1BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 521464049C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 521464049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LtAiZNmhA5v for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:44:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DC4640153
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DC4640153
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:44:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6344A40002;
 Sat, 17 Sep 2022 14:44:07 +0000 (UTC)
Date: Sat, 17 Sep 2022 16:43:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220917164321.54323d02@windsurf>
In-Reply-To: <20220911224827.3710470-1-james.hilliard1@gmail.com>
References: <20220911224827.3710470-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663425847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H70aWW6BZsnNa/1YlY9ZiCrk0WdhdHaWRcdJzLyEDyI=;
 b=XOJnpmDVCj24fKRMXI8t5PR9EZyiT6zD69cQmzM2SNT/E7EV1SJ75E785ifXghZTAflvMY
 tzuLGGzXdowsmMXrjWBKEkKpp9T1RSQHH54bs6AjXynVle72BebY8rvWJTh1yBbxqar0Dt
 NXV8tBs3X2muesQc4fEN0WIcYff+TMmto2UfH8TMuOcOjVouNW+Rirf6licj4VMJ1VxVRc
 /Ipwb+PX4xIDx+4yIglw/xPuN2Z0296V2Httzwk99RLsBzAHHUpDNdgnb/voz2jQNPPUIg
 gkf/IV4qr36LjOf4MKcSIH3eriPzTT8ZzXrmMwVLSooDGmnzeu1dm/NIIF5uiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XOJnpmDV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2022.6.15.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 16:48:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to updated link in license file:
> https://github.com/certifi/python-certifi/commit/b0b48e059995f455ac1e79b3ad373ad4ef355516
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-certifi/python-certifi.hash | 6 +++---
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
