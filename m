Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C740C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6D8C403FB;
	Sun, 30 Jan 2022 14:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpPh5NOg_BX2; Sun, 30 Jan 2022 14:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB29540111;
	Sun, 30 Jan 2022 14:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE7291BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9FB0408E2
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSe_GJ6uB-16 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:00:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C12B1408D9
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:00:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE609E0008;
 Sun, 30 Jan 2022 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643551221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHJmDaGzqNGXVQShjcLqZPe/a/qXUQzZfo0zE57UipI=;
 b=G68zdtTSbisaQt9VrENy19Qzul1PNJtywg/Js3SZ3asVHYSKJykikF6w7z+QWAhUq+1n3N
 +fwZdrdupdjlCzAL716d/sVuNE5K13Y5wv/OSl9mFPeu8xQKEW3ctInrrWYjlM4V+ZQNtB
 1Nei90ZleUNqZDb//aVngQ8OzN7hRHal5sOZ8jdv95+z+Av00hGV3oIQRYZK7pJ4sX6fqN
 gyQAaqYTRhI2eWyeFY1Ch+/zlJiXqxqfLwQCYTrivQitKuB0r4d/dI369CfspvJBYBmxC/
 oBj22TKXRdhXV30YRU626evPu/HlqehlFDdiqPC+5/Ee2sHydRHTJxvB1ZRA4w==
Date: Sun, 30 Jan 2022 15:00:20 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130150020.2a13b8e5@windsurf>
In-Reply-To: <20220129224651.1282263-2-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
 <20220129224651.1282263-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/enlightenment: bump to version
 0.25.1
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

On Sat, 29 Jan 2022 23:46:48 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> This is the a bugfix release.
> 
> See:
> https://www.enlightenment.org/news/2022-01-03-enlightenment-0.25.1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/enlightenment/enlightenment.hash | 4 ++--
>  package/enlightenment/enlightenment.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
