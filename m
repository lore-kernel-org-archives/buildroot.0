Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B94C7619A
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 21:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63C481E70;
	Sun, 26 Mar 2023 21:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63C481E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1ZStt6P_LDp; Sun, 26 Mar 2023 21:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4B881E53;
	Sun, 26 Mar 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4B881E53
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 155641BF309
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED642415F0
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED642415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VhXIPGc1iZA for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 21:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CD0B415EC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CD0B415EC
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 21:11:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8311320005;
 Sun, 26 Mar 2023 21:10:58 +0000 (UTC)
Date: Sun, 26 Mar 2023 23:10:57 +0200
To: Simon Rowe <simon.rowe@nutanix.com>
Message-ID: <20230326231057.505f1c82@windsurf>
In-Reply-To: <20230323141327.18684-1-simon.rowe@nutanix.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
 <20230323141327.18684-1-simon.rowe@nutanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679865059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLNlJgH+ICJDChFdbzYqRrOd4cGhkJJ4neGMji/0JGw=;
 b=l+Q/+64W3oan8by0VnPtXixQuUCS0dC4DMTGwkj4h+5Rb4p7D38gO/gt1fXt8ztonUHKdz
 KFODKKo1nkqNJBAk+b71M4Dz6Nhqvzck8sK/cKxd8MAXn1Kbr/FJuwY7WB06iJPiD0VbOz
 meixe7uY/XFD/6NaooK7VA9nq2sbB/2myLCW2HlrNgGbTb8cVO2UeEoUnfZ663kNo/F39q
 3BdJud9g2BjMXwpbutYMPr/oYSCVdPt/AuIA1rwnwMcPSWlYCrxqyM3p9EMKTf1pgk0MqP
 TpExK/AlirkmMccMvt+mV+OPlWwobsC26fC6tTDQ6F5Ax0Qnug0lU0hahfxcxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l+Q/+64W
Subject: Re: [Buildroot] [PATCH v2 1/2] package/lvm2: enable package with
 musl
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Mar 2023 14:13:26 +0000
Simon Rowe <simon.rowe@nutanix.com> wrote:

> LVM relies on the glibc-specific behaviour of assigning to the
> standard streams (stdin etc). As a result the package is currently
> disabled when using musl.
> 
> Apply patches based on those present in gentoo:
> 
>     https://github.com/gentoo/gentoo/pull/25883
>     https://github.com/gentoo/gentoo/pull/26024
> 
> and drop the prohibition on musl in Config.in.
> 
> Also, backport a couple of compilation fixes needed build with musl.
> 
> Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
> ---
>  ...sible-better-compilation-with-musl-c.patch | 30 +++++++++
>  ...m-preallocate-memory-only-with-glibc.patch | 34 ++++++++++
>  ...e-freopen-to-reopen-standard-streams.patch | 67 +++++++++++++++++++
>  ...e-freopen-to-reopen-standard-streams.patch | 43 ++++++++++++
>  package/lvm2/Config.in                        |  5 --
>  5 files changed, 174 insertions(+), 5 deletions(-)
>  create mode 100644 package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
>  create mode 100644 package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
>  create mode 100644 package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
>  create mode 100644 package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch

I've added more references to where the patches were found, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
