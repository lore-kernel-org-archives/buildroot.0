Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF88C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C759060F5C;
	Thu, 11 Aug 2022 20:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C759060F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpaHbicqTHva; Thu, 11 Aug 2022 20:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4B560E57;
	Thu, 11 Aug 2022 20:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA4B560E57
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07B4B1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D62DC4182A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D62DC4182A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ab9UoXesnl8O for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:26:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 496B641830
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 496B641830
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:26:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 769D81C0002;
 Thu, 11 Aug 2022 20:26:03 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:26:02 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220811222602.1406c56d@windsurf>
In-Reply-To: <YvTr2e/Y0o128SWs@waldemar-brodkorb.de>
References: <YvTr2e/Y0o128SWs@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXCoWsYvbOikUg4Rcj6NFxJmG+ADBHL93JXAIAbquIY=;
 b=mMQ+APCvKZBPef/8Hu8hEa1jF6ZaQe/1b4KqQutYExTC5N7jX49DMEugAqasPxHHLetEhw
 /SdGdN20C2/vjsL5b1c796k++O8dyD84iHQD18fEasxaBaJ2sbxN7pT/DDBdvjVXra5ng9
 US/e4MIP1zPXtEDmanrzLmFMBr5x0oz91Tv5zOc3NrK/4+wGV7N6U1v/uVOR/bhQl4PfYQ
 PZ/ktQS3Gw899bUv0JhoOu1rQmyTOdR0rFo20jcG1TyQ0TA2O/VF7W6B6VEjAgGoTzCtvo
 FPfHSe6pj/3FM2VYlaRtg6PstRGb3iDjUhfEQYK5VHrJiat9NTzQ3rilG+wKAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mMQ+APCv
Subject: Re: [Buildroot] [PATCH 1/2] package/binutils: add version 2.39
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

On Thu, 11 Aug 2022 13:45:29 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch 0002-poison-system-directories.patch got rebased.
> Patch 0004+0005 is upstreamed and got removed.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/2.39/0001-sh-conf.patch      |  48 +++
>  .../2.39/0002-poison-system-directories.patch | 298 ++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch |  50 +++
>  package/binutils/Config.in.host               |   4 +
>  package/binutils/binutils.hash                |   1 +
>  5 files changed, 401 insertions(+)
>  create mode 100644 package/binutils/2.39/0001-sh-conf.patch
>  create mode 100644 package/binutils/2.39/0002-poison-system-directories.patch
>  create mode 100644 package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch

Thanks for this patch series! We will keep this for 2022.11, so we will
merge this to next once 2022.08-rc1 is released.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
