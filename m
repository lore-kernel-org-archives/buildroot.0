Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5598C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81DDA4370C;
	Fri,  5 Jan 2024 13:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81DDA4370C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xff0eGuTcj9D; Fri,  5 Jan 2024 13:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C26043700;
	Fri,  5 Jan 2024 13:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C26043700
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81EE01BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B5D642208
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B5D642208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HncMkFVp0ubo for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:01:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ADD442207
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ADD442207
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF1A820003;
 Fri,  5 Jan 2024 13:01:31 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:01:31 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240105140131.6c5ddc01@windsurf>
In-Reply-To: <20231226222013.3316022-1-ju.o@free.fr>
References: <20231226222013.3316022-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFr+XClu2MJ6j7+0M1SGYtKptgpoopy4egtcXyiCaMo=;
 b=TSEDQuCdLcKEZo8Hsk8fNpyEc5lVfIbxUtTgjEjNTwHW7l7gtGABBeGWWv6QBKLhvGI+Bh
 25DRqGdCSyitUo6MHdIXEw+HuLYHoC69tW6DMJqvh+lCigkfzrJf2i34zs7ZBaEHTVtpZk
 yS2scu59uJOXoaF+cExAw5vN3raYLNBVAL7lUu+C9MpF4Z4pK19A+2tZV1B2U2hoSgA3u9
 TdEr1zwgzm+G9N3QshO+G5vSshvFrki4mBDYWokh6efooKcofI+foZYC4sTz4wddoACw/B
 n3cSy54i7K3SVkl7vzjwjcHdZAruX3sn7O5cDmgPaPzkfrP5fLxrAP+nuMJHaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TSEDQuCd
Subject: Re: [Buildroot] [PATCH 1/1] package/efivar: Add BR2_RISCV_64 in
 _ARCH_SUPPORTS
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

On Tue, 26 Dec 2023 23:20:13 +0100
Julien Olivain <ju.o@free.fr> wrote:

> A RISC-V 64bit EFI defconfig was added in commit 82199551
> "configs/qemu_riscv64_virt_efi: new defconfig". So efivar can now be
> enabled for this architecture.
> 
> This commit adds BR2_RISCV_64 in BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 4495383 with commands:

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
