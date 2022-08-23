Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3D6C32789
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E51D409AA;
	Tue, 23 Aug 2022 20:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E51D409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpp-zoeyvq3m; Tue, 23 Aug 2022 20:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DF1E40996;
	Tue, 23 Aug 2022 20:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF1E40996
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E352C1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBB9B40995
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBB9B40995
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNHprYqKxCAP for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:01:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6384840996
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6384840996
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:01:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A96D240004;
 Tue, 23 Aug 2022 20:01:54 +0000 (UTC)
Date: Tue, 23 Aug 2022 22:01:53 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220823220153.3e5c1fb4@windsurf>
In-Reply-To: <2a8f7591-1ee7-f0e0-1fb6-43635272c258@gmail.com>
References: <20220821153104.239709-1-romain.naour@gmail.com>
 <20220821153104.239709-2-romain.naour@gmail.com>
 <20220821230351.69cee603@windsurf>
 <2a8f7591-1ee7-f0e0-1fb6-43635272c258@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661284914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIAxzbKixymCs+ZH3z5+8U0JIsMqu07d9MPqc8Y0twM=;
 b=K1QY7PjxevufKt4p4yeMj4tQ96xObCGkdRzBqHo8gnjoGYK7C8URiUBu7GK8YWtkQVNTwb
 vZZ4jbicUlUM+WXSWDgAnF5Kk/SRIJYssH8r34clLl9tw+B4welJci0PyTlH0xJ6F6P61s
 4jsIcTrantBYZy9DZwVy93oplvqZncoFwuqieRCjNM1Z1jrC/Kl969daKHg905AHuH0xyi
 qS4KKsKMtk3qIcH8VOxF1e2NGKXFsLEwvIpPEKFLJFsAeZSYTO5FSiNFbodr2/KaGXFtk8
 Ldh3eW3xGPcF8jG0VgC4yeMXjk80tmjbkVwm+uh6xpjAcbbjZsJDSYsHRN+X/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K1QY7Pjx
Subject: Re: [Buildroot] [for-next] configs: select uclibc when needed
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

On Sun, 21 Aug 2022 23:56:19 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> I'm agree on the principle to switch them to glibc but boards defconfig where
> only runtime tested with uclibc.

True, but I don't have much doubt that glibc will work fine if uclibc
was working fine. We're anyway already updating the versions of
gcc/binutils/uclibc for all defconfigs without necessarily checking
again on hardware.

> Also we may need to increase the file system
> image (BR2_TARGET_ROOTFS_EXT2_SIZE) when needed.That's why I choose to keep
> uclibc in this patch.

The size issue is not an issue: we will get a hard build failure if we
reach the maximum size, so it's easy to detect and fix.

So I think I would still prefer the defconfigs to not enforce a C
library, and use the default of Buildroot, which is now glibc.

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
