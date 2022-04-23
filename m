Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A03C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 14:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C569641864;
	Sat, 23 Apr 2022 14:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Deur8568zeYn; Sat, 23 Apr 2022 14:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD7E4182F;
	Sat, 23 Apr 2022 14:16:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 801541BF82F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DA3960B03
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhjCcPGaoX9o for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 14:16:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F9B260AE5
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:16:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F7C460004;
 Sat, 23 Apr 2022 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650723359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22bnhnzH/zNXXtJnfq9AWOEnTml5kRcGVh5hhnrECbQ=;
 b=gNx7mZeypYQPWikTyUrxZ6zeocMOEuXujEirOWgXwoIjBoA27kOx6XJQmCf/hAGt6luPpg
 JEmMmDh0EhGr016mk9t3qxQzXfJQrVCbes74ZLWmtoxZ6BNHsbJxmq97jgOOtTSD5zCI6R
 3kZaB/WegDkDMvRWt6vETiKT0EgcktVsm6J5QSa6xE02/WDTfrPyoUdmmfV0AMGUtkvKzW
 r6jXdwW/EgMISxncH1nrHNJ0IBbwjujqCNjOIthsR+aFqpNucN7rvF/a+ixHntoDf/XHlo
 l90dHcymP/QdEZJXwqVwp8mmuAYZriJptc2XZy+6zoqVeabSPGmdVbhpM7vGWQ==
Date: Sat, 23 Apr 2022 16:15:58 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220423161558.0eb845c8@windsurf>
In-Reply-To: <YhZ1F2rNvEB4Jrah@waldemar-brodkorb.de>
References: <YhZ1F2rNvEB4Jrah@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv3 1/3] package/binutils: add version 2.38
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

On Wed, 23 Feb 2022 18:55:35 +0100
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See:
> https://sourceware.org/pipermail/binutils/2022-February/119721.html
> 
> i386-Allow-GOT32-relocations-against-ABS-symbols.patch is not required
> as it is in release.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2: add a comment about i386 patch
> v2->v3: add ppc patch from binutils-2.38 branch fixing kernel
>         compile
> ---
>  package/binutils/2.38/0001-sh-conf.patch      |  48 +++
>  .../2.38/0002-poison-system-directories.patch | 306 ++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch |  50 +++
>  ...K_GOT16-signed-overflow-by-using-spe.patch |  75 +++++
>  ...binutils-2.38-vs.-ppc32-linux-kernel.patch |  55 ++++
>  package/binutils/Config.in.host               |   7 +
>  package/binutils/binutils.hash                |   1 +
>  7 files changed, 542 insertions(+)
>  create mode 100644 package/binutils/2.38/0001-sh-conf.patch
>  create mode 100644 package/binutils/2.38/0002-poison-system-directories.patch
>  create mode 100644 package/binutils/2.38/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.38/0004-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
>  create mode 100644 package/binutils/2.38/0005-binutils-2.38-vs.-ppc32-linux-kernel.patch

Thanks, series applied. In PATCH 2/3, you had forgotten to update
Config.in.legacy with the removed option, so I did that.

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
