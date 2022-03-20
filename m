Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E57C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 498A781769;
	Sun, 20 Mar 2022 17:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AS_mc6A_7HWs; Sun, 20 Mar 2022 17:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D77CD81494;
	Sun, 20 Mar 2022 17:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3553B1BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2514581308
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7H0cfzdvKBbD for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30E8F812A0
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D813FF806;
 Sun, 20 Mar 2022 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njeJMdOFBzGoToc5phmH7yhixjzrdmRyHAEkdAfnDo4=;
 b=Qy3u7TBJAkSl42ZbB0C5Kcof2jXRvP28eo61hHUlEl6loHe6RVk3zVoj2xM7XO2redG6+A
 UUPaGIooWEQA6ThDjkASWhhIN7npsoewq3ikQGRjSsqAAL2kGnB7IKzIkAvzBXfD5DP/mC
 +8o/1nFy/UPRMfwlN45CgJCuR3hcUYJdS4XuyoK1ACjblez5OOVGXDClcRs9EzcrFlfqu8
 e3OtKHKq6krsZsM3Sy6ENI9cr5N5pUZybEjHB3wC5uCugAlB66tLzwjfInTYjpBZeUTtXO
 z9Kmj6F2A5mX7nSA50ekewOifCRB1DL85irV7xLiHchR5Z7nk0Jq73haH8HhUQ==
Date: Sun, 20 Mar 2022 18:03:42 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180342.1596770d@windsurf>
In-Reply-To: <20220320120428.3294529-1-bernd.kuhls@t-online.de>
References: <20220320120428.3294529-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 14.2
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 20 Mar 2022 13:04:28 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.postgresql.org/docs/release/14.2/
> 
> Updated license hash due to copyright year bump:
> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=61c8da50cb39ab41c3a7a0122d6943f72bb0798e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/postgresql/postgresql.hash | 6 +++---
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
