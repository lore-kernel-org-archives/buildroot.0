Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1D0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D85160FE3
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D85160FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48FE140277;
	Sat, 13 Nov 2021 17:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzswbG7RcFQZ; Sat, 13 Nov 2021 17:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CC414014C;
	Sat, 13 Nov 2021 17:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC33C1BF299
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC13A40501
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Tq1xhEH-PB6 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:03:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E51A1404E4
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:03:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 08D5CC0008;
 Sat, 13 Nov 2021 17:03:20 +0000 (UTC)
Date: Sat, 13 Nov 2021 18:03:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211113180320.5b41cd26@windsurf>
In-Reply-To: <20211113153122.1745140-2-troglobit@gmail.com>
References: <20211113153122.1745140-1-troglobit@gmail.com>
 <20211113153122.1745140-2-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/smcroute: bump version to v2.5.4
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Nov 2021 16:31:21 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

>  - Drop backported patch, included in new release
>  - https://github.com/troglobit/smcroute/releases/tag/2.5.4
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  ...Avoid-trying-to-delete-inactive-VIFs.patch | 51 -------------------
>  package/smcroute/smcroute.hash                |  3 +-
>  package/smcroute/smcroute.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 54 deletions(-)
>  delete mode 100644 package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch

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
