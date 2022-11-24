Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E86C43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9E8808AD;
	Thu, 24 Nov 2022 14:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A9E8808AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qdca0d8ssroq; Thu, 24 Nov 2022 14:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A7D5821C5;
	Thu, 24 Nov 2022 14:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A7D5821C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D34C1BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B3B2410BD
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B3B2410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tf8U0qGotWSA for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:48:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E034015A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38E034015A
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:48:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5B11240010;
 Thu, 24 Nov 2022 14:48:19 +0000 (UTC)
Date: Thu, 24 Nov 2022 15:48:18 +0100
To: Stefan Hager <stefan.hager@ginzinger.com>
Message-ID: <20221124154818.6ada922f@windsurf>
In-Reply-To: <20221124140627.3269192-3-stefan.hager@ginzinger.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
 <20221124140627.3269192-3-stefan.hager@ginzinger.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669301300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbSfhZsP/tiYtD95RUt6Cfr0LADDTUs45/dMzqGZu+E=;
 b=bSZdQ9eGAfrGPu/8tVMN3qcOxD21EeNAoXOtAAdCeHWW2a1NuYnaUGF2BZDnbUO69wQ4ge
 4j1OjKK+bLYR1N4VKTMp5v69qXivtAjOjUglELiBtGq+GBG/x+2V/FLrvOKjyXbd5M+vqO
 7XTKCCCaqIaEC8UxrepAV15Mg0TCwbADtnn8EdpcTRj9FJfDkzFZqaKbmSZVo4KWeX3Mp8
 Ew4Voqs2hgTgpEOQslSnSZTv9WEfZkTcx5z7Rq9seku2pwUMmho2p/fvOeIeVdQ0XZryOE
 y8XDYnwr1lWOUqGC5uhJVeMdaqNkX0oj7DTXz4Kb0tY5p0VtI5oAbjp8vwSmYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bSZdQ9eG
Subject: Re: [Buildroot] [RFC PATCH 02/10] tensorflow-lite-clog: new package
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

Hello,

On Thu, 24 Nov 2022 15:06:19 +0100
Stefan Hager <stefan.hager@ginzinger.com> wrote:

> This package adds external sources required by tensorflow-lite.
> Nothing is built or installed within this package, but legal info and
> source archive is created. The tensorflow-lite makefile copies the
> files from this package and uses them for building or to provide
> headers for the staging folder.

Please wrap the commit logs to ~80 characters.

Isn't there a better way? It's really horrible to duplicate all those
packages that we already have in Buildroot :-/

> +TENSORFLOW_LITE_CLOG_SITE_METHOD = git
> +TENSORFLOW_LITE_CLOG_SITE = https://github.com/pytorch/cpuinfo

Are you sure? This looks like the URL for the cpuinfo package, not the
clog package.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
