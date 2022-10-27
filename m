Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0FDC67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0421D4060D;
	Thu, 27 Oct 2022 06:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0421D4060D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PIQ6e6j2zI9; Thu, 27 Oct 2022 06:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37F0940603;
	Thu, 27 Oct 2022 06:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37F0940603
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65A971BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 321CB81371
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 321CB81371
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLHLaTj65X8s for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1920D8135D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1920D8135D
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:56:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 216871C000B;
 Thu, 27 Oct 2022 06:56:16 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:56:15 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221027085615.2c78028e@windsurf>
In-Reply-To: <20221025142929.3089316-1-james.hilliard1@gmail.com>
References: <20221025142929.3089316-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nU6Z6e65wIPjaA8lN/VdYQpeB0J064qrB2SFyKDSgN8=;
 b=LuDwNGp+OYiyxIrarM+c7KFtljjcTD939gmiKStaikwUzTfpoVBWgOGXtY8o9OWon2DQ44
 M1wTM6NLOco3jgHg7cV2z2Y/0odp14h+cKfcWspXUwRf/3vXF2ya70p2+xxVFg8oCGilXx
 q5vzz/jgNfpP9/JDYeanqrY56o9zG1sjAE5JUdkbNSAR7KUzg6mVIIwpwkcnN1zT3AKOeb
 JDGJQpFUrNQVy6EJJWIl0QJ02SJS/z4v87Gsh+V1yTfEFEykDnJRkUPpIakzmGnIoDH5Xv
 NiiHXb9xEGGF4Zxp7d7WbBwmSyDbWqPRV0L3CRiwfQg01Y4WZwHDuXPhQGGtkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LuDwNGp+
Subject: Re: [Buildroot] [PATCH 1/1] package/kmod: bump to version 30
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

On Tue, 25 Oct 2022 08:29:29 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/kmod/kmod.hash | 2 +-
>  package/kmod/kmod.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

We have a build failure:

  http://autobuild.buildroot.net/?reason=kmod-30

Not sure if it's new with version 30 or not, though. Could you have a
look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
