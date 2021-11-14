Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA6BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:28:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67BE7610FE
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67BE7610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A06740169;
	Sun, 14 Nov 2021 15:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiNlyzCSfhKU; Sun, 14 Nov 2021 15:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 967FF400D1;
	Sun, 14 Nov 2021 15:28:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90FAB1BF964
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FFB2401E5
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KOHYth4LatX2 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 15:27:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 600AC40105
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 15:27:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7E98B240004;
 Sun, 14 Nov 2021 15:27:55 +0000 (UTC)
Date: Sun, 14 Nov 2021 16:27:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Message-ID: <20211114162754.7e724151@windsurf>
In-Reply-To: <20211019062329.29190-1-moritz@h6t.eu>
References: <20211019062329.29190-1-moritz@h6t.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: make readline
 optional for network-manager
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
Cc: moritz@h6t.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Oct 2021 08:23:29 +0200
Moritz Bitsch via buildroot <buildroot@buildroot.org> wrote:

> From: Moritz Bitsch <moritz@h6t.eu>
> 
> This removes the hard dependency on readline which is GPL-3.0+ licensed.
> If readline is enabled the dependency is added and nmcli is built.
> 
> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> ---
>  package/network-manager/Config.in          | 1 -
>  package/network-manager/network-manager.mk | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

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
