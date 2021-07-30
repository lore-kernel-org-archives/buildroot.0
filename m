Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87E1C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:44:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB8E60F94
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DB8E60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69CB060E79;
	Fri, 30 Jul 2021 21:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rmr5n9-OmkdD; Fri, 30 Jul 2021 21:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A2560E71;
	Fri, 30 Jul 2021 21:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77DCA1BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DC9B838FB
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1OhlYV5-PTO for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:43:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69C4A838DB
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 21:43:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 99C29240002;
 Fri, 30 Jul 2021 21:43:43 +0000 (UTC)
Date: Fri, 30 Jul 2021 23:43:41 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20210730234341.2db43a3b@windsurf>
In-Reply-To: <c9fb789ac40e708a74c1b69fcf90904ae599af0f.1627650762.git.baruch@tkos.co.il>
References: <c9fb789ac40e708a74c1b69fcf90904ae599af0f.1627650762.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] i2c-tools: bump to version 4.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 30 Jul 2021 16:12:42 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Drop upstream patch.
> 
> Update README hash for text changes that are not related to license.
> 
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...transfer-add-check-for-returned-leng.patch | 41 -------------------
>  package/i2c-tools/i2c-tools.hash              |  4 +-
>  package/i2c-tools/i2c-tools.mk                |  2 +-
>  3 files changed, 3 insertions(+), 44 deletions(-)
>  delete mode 100644 package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
