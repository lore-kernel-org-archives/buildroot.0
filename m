Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2F5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60D1860E8A;
	Sun, 30 Jan 2022 22:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2M3y0X6kcMZ; Sun, 30 Jan 2022 22:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF5A960E89;
	Sun, 30 Jan 2022 22:19:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9DA01BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B25D4401CB
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myiO9gYZfX8O for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:19:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98E35401AF
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:19:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B123B40002;
 Sun, 30 Jan 2022 22:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643581170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PgSi5QNO0A2jjXXISaL7TIGp0d/kpYpHYAOG12lnN8s=;
 b=efWYe6ElOH3RnWBea9pFE7TV/7DGhszXKf+Sl25wOnz9vKGl9q9oMk9SsrAZvgdcr5ORmF
 bmxSrHC9sFs+OnJf40q5WYztjIo8kPoCHFiSON//hiFP7PLfOFoYfUcjSL0TiGzQ7KJDCX
 E9HGuCpEhGyjzAnYg5dE7VfYvYWzGSc2r8TsJgww6hpfmeLnIsdUejZQ2Xo4601ZoLhJ/9
 EgKTU0/ADJUWeZXYISx1HHP4T5Pi6VKS9S+aihyQXdpjZ7Hwnynqee1uFQLf6k45Oci33m
 mGPu0fhfwOVet6XKqXu+8cewFFI3FQe2Pa6b0PkyDYUP/7gociD175oke3m7vQ==
Date: Sun, 30 Jan 2022 23:19:29 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220130231929.166d6ad7@windsurf>
In-Reply-To: <20220128124538.31789-1-ps.report@gmx.net>
References: <20220128124538.31789-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/3] package/log4cxx: change download URL
 to https
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

On Fri, 28 Jan 2022 13:45:36 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - change download URL to https
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/log4cxx/log4cxx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
