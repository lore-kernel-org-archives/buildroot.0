Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9A4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 19:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E68D04090F;
	Wed, 24 Nov 2021 19:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cztYIRaGvjRR; Wed, 24 Nov 2021 19:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C664090B;
	Wed, 24 Nov 2021 19:41:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64F881BF2E4
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 19:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 547CC4090B
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 19:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQJJZJwLqWSk for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 19:41:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20B264090A
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 19:41:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B8E12E000C;
 Wed, 24 Nov 2021 19:41:28 +0000 (UTC)
Date: Wed, 24 Nov 2021 20:41:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20211124204127.493ffaa3@windsurf>
In-Reply-To: <20211124151827.1107e808@camb691.localdomain>
References: <20211124151827.1107e808@camb691.localdomain>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH] Handle _LICENSE_FILES with full path
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Cyril,

On Wed, 24 Nov 2021 15:18:27 +0000
Cyril Bur <cyrilbur@gmail.com> wrote:

> legal-info currently assumes that a packages _LICENSE_FILES will be a
> path or a filename relative to the source of the package.
> 
> There is nothing preventing _LICENSE_FILES from containing a full path,
> probably using _PKGDIR within the package .mk file. When this happens,
> the legal-info process simply adds the build directory on the front of
> the _LICENSE_FILES resulting in a failed cp of the file.
> 
> This patch simply performs a check to see if the _LICENSE_FILES path
> with the build directory prepended exists (as is the case for all
> packages currently) and uses that. Otherwise it will assume that
> the _LICENSE_FILES file is a fullpath and attempt to use that.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Could you clarify the use case with a specific example ?

Thanks!

Thoimas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
