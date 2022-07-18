Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACC6C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFBAA40AE0;
	Mon, 18 Jul 2022 10:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFBAA40AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30K8gEKkQN2P; Mon, 18 Jul 2022 10:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD2FB403A5;
	Mon, 18 Jul 2022 10:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD2FB403A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E99DF1BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1ED783E28
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1ED783E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZF4ZL6psh-pv for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:11:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B81C983E0D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B81C983E0D
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:11:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A4025C0015;
 Mon, 18 Jul 2022 10:11:46 +0000 (UTC)
Date: Mon, 18 Jul 2022 12:11:45 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220718121145.78db5249@windsurf>
In-Reply-To: <20220717214132.2715220-1-fontaine.fabrice@gmail.com>
References: <20220717214132.2715220-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658139107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZqvZ3LR04UTY5T6c0+Ipvk5nj4tHeJc1cEVmOGg6kg=;
 b=iifGfQDbFiU/LGQcicDEuvvZyFq9E5+KY8etlVs+m7gBHxnceauF1RBDsVUsBAJv5wQ0f9
 7OSGAC0evl7t/ZwYZm+ZJ1Z9JWJvSqHmDJ9EgaVrBTFZlTZjic4v4JOnRgLXQKU68SMn7Z
 bVZSW/FgmK/wy31VTU5QF8NvntDWSlPN/dQslOjelAoB+KTHovxvW488E/AEsfVRFclHZp
 66QAfawuvF7wcBpZQXdmgXPN1GXKPJKGFr29LWso6G8SpFSs37H7vboH+rdJP6PHHmyNR6
 mTd0u5Xgzp3XNAMlzhoAgXbltSc2ntvDIWWzwZkDIQ8vf43FTtgdImnPIXw5QA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iifGfQDb
Subject: Re: [Buildroot] [PATCH 1/1] package/perl: bump perl-cross to
 version 1.4
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

On Sun, 17 Jul 2022 23:41:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following static build failure with berkeleydb
> thanks to
> https://github.com/arsv/perl-cross/commit/31dac3e264a7f1f53dbf49570771123ebd514055:
> 
> /nvmedata/autobuild/instance-6/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: lib/auto/DB_File/DB_File.a(DB_File.o): in function `ParseOpenInfo':
> DB_File.c:(.text+0x7d30): undefined reference to `db_create'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e01a042185b2221bee815bb9096c4419eeb6e558
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/perl/perl.hash | 4 ++--
>  package/perl/perl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
