Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7EFC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 12:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B436241B89;
	Fri, 29 Jul 2022 12:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B436241B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ayI1EmhYG9LG; Fri, 29 Jul 2022 12:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EE4A41B6F;
	Fri, 29 Jul 2022 12:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE4A41B6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 280681BF3F9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0302840B60
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0302840B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MDR9IGSpl1OO for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 12:30:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A4A840412
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A4A840412
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:30:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 34C73240007;
 Fri, 29 Jul 2022 12:30:47 +0000 (UTC)
Date: Fri, 29 Jul 2022 14:30:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220729143046.768e5dad@windsurf>
In-Reply-To: <20220729114137.7774-1-fontaine.fabrice@gmail.com>
References: <20220729114137.7774-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659097848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vz2ZwvZuYXLCpvT+2Yc0d0Y2yZIC/nvqZCI5I6KBwmE=;
 b=Jg1684LL3bj1N7EQdUxgVl3unRJjQBEW6ZcmmPkx6UnbGHoO7+KgyotiT1D329QYprnfa0
 cb93T7EgACX0dig5AoUN8XTB5YZQmmany9Y0H6kHM2QVtAFEamrj+vqQh0gu0HYWc081s/
 xafdGJdcbp64Y19nEF7v38tM8S+DK2xbj3BDDm6LxcSFJva8EcZR8vLn+4BoTlBBBQFxgK
 p/nNmSZciRFRk5Ui6kEDxo8tVff1bDAqMgrY3s4tWU/QuRzjaYH2jYHFOT5eyvJDjNaXmG
 JFNsr04bhIaCKhH4smEf3AA7lJVXFepH7ZSrZWQqr1HsOfRMeMdWqzpVebnA7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jg1684LL
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-autotools: fix runtime path
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

Hello Fabrice,

On Fri, 29 Jul 2022 13:41:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 505b5a6cdd337c2fd5965aa875a1a53419d62ed1 wrongly stated that "a
> configure script bundled with a package may be generated with an older
> version of Autotools, that may not yet support the --runstatedir option.
> This will give an "Unsupported arguments" warning and the option will be
> ignored.". Indeed, this will raise the following build failure with
> attr, libtirpc, readline, etc.:
> 
> configure: error: unrecognized option: `--runstatedir=/run'
> 
> So to support configure scripts using older version, the variable is set
> directly instead of using the --runstatedir argument.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c853f14773d875be30e32ae24daf80e181fef34e
>  - http://autobuild.buildroot.org/results/045211cd66cf78c3d89d2d8ac41ec4edf0b0ee58
>  - http://autobuild.buildroot.org/results/8c5160eef99de2f1f72f33d5e5ea94d417855b2c
> 
> This reverts commit 505b5a6cdd337c2fd5965aa875a1a53419d62ed1.

Thanks for the fix, but you are not reverting
505b5a6cdd337c2fd5965aa875a1a53419d62ed1. Commit
505b5a6cdd337c2fd5965aa875a1a53419d62ed1 added --runstatedir=/run, you
are changing it to runstatedir=/run. So yes, you are reverting to the
initial patch proposal, but strictly speaking, your patch is not
reverting 505b5a6cdd337c2fd5965aa875a1a53419d62ed1, i.e git revert
505b5a6cdd337c2fd5965aa875a1a53419d62ed1 would not have the same effect
as your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
