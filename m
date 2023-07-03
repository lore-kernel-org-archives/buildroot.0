Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5FFC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFDB981EB7;
	Mon,  3 Jul 2023 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFDB981EB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM54nLGhFhYk; Mon,  3 Jul 2023 19:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A4D81E89;
	Mon,  3 Jul 2023 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A4D81E89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 637901BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CB96405BE
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB96405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0AOaFkqDEKa for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:55:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D640240420
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D640240420
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:55:27 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AF1C20004;
 Mon,  3 Jul 2023 19:55:24 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:55:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703215523.33d62372@windsurf>
In-Reply-To: <20230702165320.3480057-1-bernd@kuhls.net>
References: <20230702165320.3480057-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHdJxT510Ru/p9HvBAiVixGolGRQ7xYXqi5zUtkKbtA=;
 b=g/M66xFlo3L5EJ6+s7ejKAoRMJ3n1aIfwIpy2WSxIIHGMbYPhTsnZmRfByrXjTBaOe/d4R
 sBfhcJQaJrkthO01HuNEt8YpZdEj9srKwstqjdAajJ5KmhrmmFAH4C1b6wKtytPkSk44wg
 nzuBeWsICcbXEGBvxda/SzUSBZKKKHouf6w7pa3c2vrx6z2r+jxmA8AfJHHOnpnrRHcik7
 jbtg9eWJMWcZqIQsxBg+a24zwCMPw3BpepWIrcAtZbwpzS+UcNH5PBjq4ScDmQv74E0+67
 cfyYCESIzLmz3AuuDKIyv2r67+N2a4cNWWjfPoL8Ns45rS98gF5kJJsygufKxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g/M66xFl
Subject: Re: [Buildroot] [PATCH 1/1] package/e2fsprogs: bump version to
 1.47.0
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

On Sun,  2 Jul 2023 18:53:20 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://e2fsprogs.sourceforge.net/e2fsprogs-release.html
> 
> Removed patch which is included this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  ...-sanity-check-to-extent-manipulation.patch | 59 -------------------
>  package/e2fsprogs/e2fsprogs.hash              |  4 +-
>  package/e2fsprogs/e2fsprogs.mk                |  2 +-
>  4 files changed, 3 insertions(+), 63 deletions(-)
>  delete mode 100644 package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch

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
