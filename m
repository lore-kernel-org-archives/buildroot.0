Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB1CC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 915B483FC3;
	Thu,  6 Oct 2022 19:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 915B483FC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id loDPrCxEuwie; Thu,  6 Oct 2022 19:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E2E83FBB;
	Thu,  6 Oct 2022 19:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7E2E83FBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABBB1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8B040D33
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA8B040D33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIlB7KVOuN7A for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:04:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8338400B9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8338400B9
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:04:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19C7A1BF204;
 Thu,  6 Oct 2022 19:04:40 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:04:40 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221006210440.1d3158a0@windsurf>
In-Reply-To: <20221003150609.3235085-1-angelo@amarulasolutions.com>
References: <20221003150609.3235085-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665083081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usO8HR3ISoKLRw3Du8alvrhVceP2BS6jLZXdIFutY14=;
 b=eZx/3+EiL4dTaNHvK9BcTa2Sl+Ql0idwT6rwlkBvzdc6+vvg3lai2cpoot/Qd583WZKg5f
 0yEJTfrFCMHLLOZh9WHAv3VNIOCntIU6ppezRFSi9K7lDisYtYObYy5F07dxuLLN+TnDP6
 Kn0UjrFDJOemRNyZdGwmFJvkB0LFLCeXYiK33Ng9No0xSXkx2JWtcO2K6nHOI0IvVptMCN
 nH2wrvajUfa5uoeWWAKr3pUJUCSIkHegCrycv1RqtC3TOr6xY/MOrQQIcdOgjyv7cV/v4E
 wMqsSpIHXZjxxfbegHmruyorJhGmGVD4SS8fT0HnAYUOghtFv6/HVSK/iLgaJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eZx/3+Ei
Subject: Re: [Buildroot] [PATCH] package/grep: bump to version 3.8
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

On Mon,  3 Oct 2022 17:06:09 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> * Updated to the new PCRE2 dependency
> * Removed unneeded patches (file m4/stack-direction.m4 is not there)
> * Removed autoreconf step because unnecessary after not patching m4
>   anymore
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  ...01-sigsegv-fix-build-on-microblazeel.patch | 32 -------------------
>  .../grep/0002-sigsegv-fix-build-on-or1k.patch | 32 -------------------
>  package/grep/grep.hash                        |  4 +--
>  package/grep/grep.mk                          |  8 ++---
>  4 files changed, 5 insertions(+), 71 deletions(-)
>  delete mode 100644 package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
>  delete mode 100644 package/grep/0002-sigsegv-fix-build-on-or1k.patch

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
