Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7913C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B41760AD2;
	Sun, 30 Jul 2023 10:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B41760AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5SJ5n0UVIaK; Sun, 30 Jul 2023 10:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D542B60BB1;
	Sun, 30 Jul 2023 10:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D542B60BB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBC8D1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74EC940138
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74EC940138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1U5OjsH8FlLq for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:12:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FA564010D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FA564010D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FB5120002;
 Sun, 30 Jul 2023 10:12:17 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:12:16 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230730121216.2d810766@windsurf>
In-Reply-To: <20230729231434.299864-1-romain.naour@gmail.com>
References: <20230729231434.299864-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690711937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVy5r8fp/UwaAfd5N6uNEqP2Dv8WFMJIj+B3YGZab1Q=;
 b=EwmTyoR//nzEaAgGYjwOGbIkv+hoT8XQrLoIvwEiQJ09s7SBvd+HybmcsJvP/8CM71M47L
 lwYHFr9IpKAQqkF+VP1Z6twCyCyJMgdb051MiqVpDcIEGR0Z0ldlb01e7zsTi7451ZW93w
 Dl3gqCvAd9+p9MSjvr4PU43MsSODtkUE+F41wsp4TT5+YRnD9yQ7Xf9m66dQKCxmY9jbZV
 rf9wMM6L+HiZ9wlqWNTOc+g9NgXJlu9pgRlT1kEE1MllaNzxzlI26XJapIr7qkAq85SGE0
 IyLsyvS1r/4ddTOHBF9I/UjOUB3BCvKRhY5pLIsoNN+5A5mn5PcblT2au3ihOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EwmTyoR/
Subject: Re: [Buildroot] [PATCH] support/testing: TestSELinuxSystemd{Ext4,
 Squashfs} add midding libelf kernel dependency
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

On Sun, 30 Jul 2023 01:14:34 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> objtool built by the kernel requires libelf
> 
> ldd TestSELinuxSystemdExt4/build/linux-6.1.26/tools/objtool/objtool
>   linux-vdso.so.1
>   libelf.so.1 => TestSELinuxSystemdExt4/host/lib/libelf.so.1
> 
> While updating the kernel used in TestSELinuxSystemd [1] we
> forgot to select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to provide
> Buildroot's host-libelf. Using host-libelf avoid linking with
> libelf installed on the host or failing to build objtool if
> libelf is not installed.
> 
> [1] 60b84fb7ce4612b2b14a675e28331111468e1f2b
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186370 (TestSELinuxSystemdSquashfs)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186368 (TestSELinuxSystemdExt4)
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/testing/tests/init/test_systemd_selinux.py | 1 +
>  1 file changed, 1 insertion(+)

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
