Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD0FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 20:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE534020C;
	Sun, 13 Feb 2022 20:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHKz9wNV7BAs; Sun, 13 Feb 2022 20:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A951401F1;
	Sun, 13 Feb 2022 20:38:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA7831BF83E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B47C94026A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WA2FvGXEQ1ce for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 20:38:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48C0840193
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:38:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B667A1BF208;
 Sun, 13 Feb 2022 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644784691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G6xIeMcxTPsuhvoM2zZQjhFq8cVItS5mjHz9DIbqT/k=;
 b=EDrLa7tRcezjP1JTiTjIejUFyy4aB5QUYvleZeB1uo8NdjmXeTmqL+AJds0U1ltNw8dUSH
 P0mlBjH4ZeWJIFHt83sRoyNMJ/X2xdN2BB8Q5qAGHeLWip02JZLHg8uAxefxwyL/F21h5i
 Fc1fddQtg+CxwRcCEkccWLLfBAH8W9W7XxqFy+CD274U23Plpt+qazZtYCNDAk8dd4vpdG
 LIpf52j3hDYy7sb7yxcH6JjNUO+O639531v3V3hqUg6LhsXLsdyC50m0TdxvaAl/u8DEeJ
 WR5dZWhfe530WwOM2ixZar/lzWjw4yTETo+HePaLd0S2cvy6PkmE3zy58WcCUA==
Date: Sun, 13 Feb 2022 21:38:09 +0100
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20220213213809.361f3ea9@windsurf>
In-Reply-To: <20220213155208.560001-2-geomatsi@gmail.com>
References: <20220213155208.560001-1-geomatsi@gmail.com>
 <20220213155208.560001-2-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/hostapd: update DPP option
 handling
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Feb 2022 18:52:07 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Makefile hostapd.mk defines different macros for different defconfig
> options. Options that are not listed in defconfig, can be set using
> HOSTAPD_CONFIG_SET. Options that are listed in defconfig, can be
> enabled/disabled using HOSTAPD_CONFIG_ENABLE/HOSTAPD_CONFIG_DISABLE.
> 
> Starting from hostapd v2.10, option CONFIG_DPP is explicitly listed
> in defconfig. So it is time to switch to enable/disable macros for
> this option.

This seems fragile. Why don't we have a single way of enabling an
option, which doesn't depend on whether the option is listed in the
hostapd defconfig or not?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
