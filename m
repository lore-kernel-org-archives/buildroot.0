Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE0CC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D34260F81;
	Sat, 14 Jan 2023 21:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D34260F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NK18uDiJtE4n; Sat, 14 Jan 2023 21:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFCC60F79;
	Sat, 14 Jan 2023 21:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFFCC60F79
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F75B1BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AF7181EF3
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF7181EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XryBlVYeWumC for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:19:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C805881E1E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C805881E1E
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:19:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 699A81C0003;
 Sat, 14 Jan 2023 21:19:34 +0000 (UTC)
Date: Sat, 14 Jan 2023 22:19:33 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230114221933.1d0d44f0@windsurf>
In-Reply-To: <20230109220329.2122632-1-james.hilliard1@gmail.com>
References: <20230109220329.2122632-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673731174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAE0VRUsvG9lfXS4NvBICU1cmhZXWyXOgYjJ5DerVSU=;
 b=ABd3WAVKNjZk91VjjVSYi7/GDiBj8xPPIr+fdStfDjbKywtblfMR5rmtkFkQf82RVPpSaE
 tmX3pcBEFdf4FkXQGYWSYnV1uCS212RRfgv4PocQ7XKNA9ENXG9sfhqx+d41Ju4ksuPZeq
 M1pxNVO82cqV7F2zxf7QP+NI9bJg/VN1gETj9Dr5o9Kz7TOF+1hWyt4skqNQWBAp/Kby9S
 6ztGz8kx93Rf58zZwWsPFgpsTTZthEyMM1rnk+gUcA6dRuN8aQolqrdub7vabrDP8WFlKk
 evESraeiJ5NifJPZlheGtIUn7NSmvRF3xixkN+1mdyc6y2JYOp27RHpitAVDvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ABd3WAVK
Subject: Re: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 1.1.0
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  9 Jan 2023 15:03:29 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...cross-compilation-for-32-bit-targets.patch | 38 -------------------
>  package/libbpf/libbpf.hash                    |  2 +-
>  package/libbpf/libbpf.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch

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
