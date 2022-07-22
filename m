Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806A7C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1737A423CF;
	Fri, 22 Jul 2022 21:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1737A423CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65_9Eri89-Um; Fri, 22 Jul 2022 21:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA88742384;
	Fri, 22 Jul 2022 21:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA88742384
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B10791BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66DC242384
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66DC242384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NoimjIF5qfso for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:16:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203D4422E2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 203D4422E2
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:16:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2D28240007;
 Fri, 22 Jul 2022 21:16:51 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:16:50 +0200
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220722231650.0fe7223f@windsurf>
In-Reply-To: <20220613232005.166636-1-pevik@seznam.cz>
References: <20220613232005.166636-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658524612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9pQ9eWhe+xhQIY5F419pNZ7UDDxp7fbh7FjNoZzlf0=;
 b=hHgE6kHQlw3byeZ1LFlY1Yzd8l/zXSfJDtIwMr4Y3keZgnh8f6dT9k5LJVzoQe19xW5Zt5
 ZQ9FLnSDts8zPhBHBDoglePkr9mNp78B02V5TjNbvEhV9KHovpNtuN+yaC1ucwuIxPDJu6
 svbxPsOPoIEkn9DxcS4j8M0ODOnGxntcLM1siD+p2QnLXTsdoL4CN6PyeU2/571EmKcWRO
 aRhBXYvmRKKd/4N+fz0MacjAwREeG+tLJOCbEzR5oLOS2GGOoUam6+nwYHnCa2kBE6XC7f
 A4El/XPI2EUO0nqJcavttCFMNNvtnPjgvCIe8MZEyn1raTwSEdHhb1j5aO69Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hHgE6kHQ
Subject: Re: [Buildroot] [PATCH 1/1] ltp-testsuite: bump version to 20220527
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

On Tue, 14 Jun 2022 01:20:05 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Add 2 patches from upstream which are required to fix compilation,
> Remove patch accepted upstream.
> 
> Update list of broken tests under musl (confstr01.c was fixed).
> 
> Refresh 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
> (still carry it case there is somebody using old musl based toolchain).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 50 ++++++------
>  .../0002-kvm-Fix-compilation-on-x86.patch     | 40 ++++++++++
>  ...nel-fs-declare-int-openlog-as-static.patch | 77 -------------------
>  ...efined-reference-to-__stack_chk_fail.patch | 41 ++++++++++
>  package/ltp-testsuite/ltp-testsuite.hash      |  6 +-
>  package/ltp-testsuite/ltp-testsuite.mk        |  3 +-
>  6 files changed, 110 insertions(+), 107 deletions(-)
>  create mode 100644 package/ltp-testsuite/0002-kvm-Fix-compilation-on-x86.patch
>  delete mode 100644 package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
>  create mode 100644 package/ltp-testsuite/0003-kvm-Fix-undefined-reference-to-__stack_chk_fail.patch

Thanks applied to master. There were two minor nits:

 (1) package/ prefix was missing in the commit title.

 (2) Patch 0002 has a inside itself: [PATCH 1/2], we want that to be
     [PATCH]... precisely for the reason that those 1/2 are often wrong...
     as it was the case here! This issue is spotted by "make
     check-package" that you can run before sending a patch.

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
