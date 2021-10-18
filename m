Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0913BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:50:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AD56115A
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1AD56115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9323760629;
	Mon, 18 Oct 2021 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdxA1Bp-6Xsr; Mon, 18 Oct 2021 19:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DA860654;
	Mon, 18 Oct 2021 19:50:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 792801BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68CC54031C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53b_UEqOA7mV for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:49:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C14D403BB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:49:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 42C15100006;
 Mon, 18 Oct 2021 19:49:55 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:49:54 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211018214954.65c0f9a7@windsurf>
In-Reply-To: <20211017200341.20867-1-ps.report@gmx.net>
References: <20211017200341.20867-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/gnupg2: bump version to 2.2.32
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

On Sun, 17 Oct 2021 22:03:41 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0001-dirmngr-Fix-build-with--disable-ldap.patch
>   (from upstream [1])
> 
> - fix/update signature check key hash
> 
> For details (since 2.2.28) see [2], [3], [4] and [5].
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=c6900f5723b4edc899aaea267ed599b5ad724142
> [2] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000461.html
> [3] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000463.html
> [4] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000464.html
> [5] https://lists.gnupg.org/pipermail/gnupg-announce/2021q4/000465.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:

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
