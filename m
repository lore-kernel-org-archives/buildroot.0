Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7F4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:46:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD70061151
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD70061151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B72240383;
	Wed,  3 Nov 2021 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4tt_yIKrtcS; Wed,  3 Nov 2021 17:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A77B401E9;
	Wed,  3 Nov 2021 17:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 306971BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 207B3404AA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAUly_HdG7UZ for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:46:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 236F3403ED
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:46:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2E27D1C0004;
 Wed,  3 Nov 2021 17:46:21 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:46:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211103184620.75157d6c@windsurf>
In-Reply-To: <20211103082126.1791185-1-herve.codina@bootlin.com>
References: <20211103082126.1791185-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi-drivers: bump to commit
 b0c7ac0ef2e7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Nov 2021 09:21:26 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> This package has a buildroot local patch
> 0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch
> 
> This patch was submitted and applied upstream.
> https://sourceforge.net/p/libdbi-drivers/mailman/message/37370618/
> 
> Bumping to this commit allows to discard the no more needed
> buildroot local patch.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  ...CONFIG-variable-instead-of-mysql_con.patch | 47 -------------------
>  package/libdbi-drivers/libdbi-drivers.hash    |  2 +-
>  package/libdbi-drivers/libdbi-drivers.mk      |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/libdbi-drivers/0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch

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
