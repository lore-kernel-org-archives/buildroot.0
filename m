Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C372C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D4C6115A;
	Mon, 30 May 2022 20:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdi_LFHosl_V; Mon, 30 May 2022 20:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D7F460AF6;
	Mon, 30 May 2022 20:54:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7AC61BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E444840AEF
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQBfcIgjeVZN for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:54:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C536740C88
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:54:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5AE01BF204;
 Mon, 30 May 2022 20:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653944068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIJ9odUWEAM9eTIr0KLJ5ZWVMgA3Xi9cXg7bvSLuO/E=;
 b=c9sgh/deT9WrUm+E6K/ALnJ2fc6WUhhb2dkc9l0aIdCMAOv/sQi1SLRcruQLKggBENM2Yy
 xz6RnOEubEWuf672ZJ+lhkKSaeV05WZHWAyaN8fCWLFFgjEq1Tl0uBbGl5lcFh0NkkAf3m
 dqA0AM5fr7Uj3euZ+6qpCvL+bK/6L19aCIvqXCz+VL5HIFLDbky/wDOGbOhewmDWgYe37T
 VGWF0GYp4K7A8Lwk1yJPAhcsjnt4BzfwSs2l2Ks+aDpnkXXC5GcsF3UTc2LHHdTDtnoCZ5
 KpaqfV0xFMNds2MaAHzdNLATo7SGrbsFRhjyq94uxsv4FnP71LVlFz4juqg9mg==
Date: Mon, 30 May 2022 22:54:27 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220530225427.1a0ba6dc@windsurf>
In-Reply-To: <20220522194732.2962580-1-peter@korsgaard.com>
References: <20220522194732.2962580-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version 3.1.2
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

On Sun, 22 May 2022 21:47:32 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2022-28738: Double free in Regexp compilation
> - CVE-2022-28739: Buffer overrun in String-to-Float conversion
> 
> For more details, see the announcement:
> https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ruby/ruby.hash | 5 +++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

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
