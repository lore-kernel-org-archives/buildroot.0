Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92CEEE49A5
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8407D41528;
	Sun, 20 Aug 2023 21:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8407D41528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8YUXtf8BGgWm; Sun, 20 Aug 2023 21:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300DA4151C;
	Sun, 20 Aug 2023 21:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300DA4151C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9CB1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 498194032C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498194032C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tP1UywRgfM_x for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:37:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F39340136
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F39340136
Received: by mail.gandi.net (Postfix) with ESMTPSA id 147F7FF803;
 Sun, 20 Aug 2023 21:37:23 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:37:23 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230820233723.062ea922@windsurf>
In-Reply-To: <20230820204806.326553-1-ju.o@free.fr>
References: <20230820204806.326553-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692567444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bedk5YCDJyiHVOKijoVRYGssz9UXaT+1PnxFc3wIa5o=;
 b=UkhRYqBG6nmp4IRQEiNzv9BOReY6Cftnss71iEGeS26HHtPPgcr3lN1UTUkuulzowcruUN
 I6uSdxzwrB/ePM0xRsn18724h4LeUmr/eXNWrdjdjHZLUCuXKr4ojkgAa+LiXlsa1d4Lpv
 Hzt8Fzf8pILgrc6nUkSg2m77m007X4Gk3WOuWJ7gnUR2zzfjEYxNWwn1Aeyr7c78ohDIh/
 p84MBmELk5vVBSpdF1Yew4bWG3Qwh0eomIWwSMmZ7WUtVtGCUZkADWO2nnHQ+fUJkfKIGl
 aRZ37eP3H8vwxURpwJBzp/wL+KuoXN5t8A+5lc8Tcp3c0+Pe7HR4IOJN1X0oaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UkhRYqBG
Subject: Re: [Buildroot] [PATCH next 1/1] package/libksba: bump to version
 1.6.4
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

On Sun, 20 Aug 2023 22:48:06 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see [1] and [2].
> 
> This commit also change the comment in hash file to add a link to the
> integrity check procedure. It also includes SHA1 hash published
> upstream.
> 
> The AUTHORS file hash is updated. It was reformatted, in upstream
> commit [3].
> 
> libksba 1.6.4 updated its gpg-error.m4 macro files to detect
> gpgrt-config. Its path needs to be forced in _CONF_ENV to make sure it
> will work in all host environments. See the log entry of commit
> d7f2d8403e "package/gnupg2: fix build failure when host provides an
> old gpgrt-config" [4] for a complete explanation.
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=log;h=libksba-1.6.4
> [2] https://dev.gnupg.org/T6543
> [3] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commitdiff;h=557999424ebd13e70d6fc17e648a5dd2a06f440b
> [4] https://git.buildroot.org/buildroot/commit/?id=d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libksba/libksba.hash | 7 ++++---
>  package/libksba/libksba.mk   | 6 +++++-
>  2 files changed, 9 insertions(+), 4 deletions(-)

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
