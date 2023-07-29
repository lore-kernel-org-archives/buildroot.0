Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6C8C001E0
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12E3041BC5;
	Sat, 29 Jul 2023 09:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E3041BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWXYSiHrXkBj; Sat, 29 Jul 2023 09:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B927441BD8;
	Sat, 29 Jul 2023 09:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B927441BD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 068461BF475
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D6B40106
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D6B40106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMPiGoOBD5Z1 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:04:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFD2C400C7
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD2C400C7
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD9491C0004;
 Sat, 29 Jul 2023 09:04:47 +0000 (UTC)
Date: Sat, 29 Jul 2023 11:04:46 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230729110446.02e17e01@windsurf>
In-Reply-To: <20230515203002.346534-1-aduskett@gmail.com>
References: <20230515203002.346534-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fv5K9LlHj5+JzQDHUulW5zdkCMCn9SoVWhmZ/MjJ3Do=;
 b=bzoCSfCHAKCUN/J57XvAnRumXo6Vb44JV68uHEkCzvw+cNNBEwpty2XUEYbStk1KGrH7Vq
 Q0eKE/9rSAZGe6AAHAcVmjcky3VkRmedMUffYSBwTJNDZLbvBMiTpDW5XZk4czH02Wabnw
 LneVeyQsYRvLrHGlH4oTdHgmm6XVFhnJeoaHVU1VmUvioLdCJt16EK8GQw82qH9NACFgYN
 1EuZWjHvl8F298yPLkw5JYcGQKexyTEMHRp8iBJtZfC2UnJYhEmgPO3WJkWN8717w4BM5D
 IfV5zpsNyfOGVItrFc9o/gKZ8YU8ZLlVNAHNmKIX5nlUnPZckGmto6QHhKJzew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bzoCSfCH
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: bump
 version to 1.76.1
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

On Mon, 15 May 2023 13:30:02 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/gobject-introspection/0001-disable-tests.patch        | 2 +-
>  .../0002-Add-rpath-links-to-ccompiler.patch                   | 2 +-
>  package/gobject-introspection/gobject-introspection.hash      | 4 ++--
>  package/gobject-introspection/gobject-introspection.mk        | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)

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
