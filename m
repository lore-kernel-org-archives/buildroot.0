Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E606C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 21:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B16754032A;
	Sun, 15 May 2022 21:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pkxk7KjdXj5R; Sun, 15 May 2022 21:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFAD7401D8;
	Sun, 15 May 2022 21:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4654E1BF39D
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 21:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3346860F9F
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 21:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FL5wr3EZlz2f for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 21:09:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 022C460FAD
 for <buildroot@buildroot.org>; Sun, 15 May 2022 21:09:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AFD88100006;
 Sun, 15 May 2022 21:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652648961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oe4nz8gvLgoP5yfy9lAhIgr50pv0nbw0OBUiQM0m46E=;
 b=Ry6rU0TrYMS08mffeHjyIBn7RoM59Cey8M7JjmapbU//E6YU3UZv/87Bc+il1cA/+Y3zsh
 slMTSBYYPPfOwM9+qvMKf09KqR009Tjpsyr9asLytwZ5BjQ8pfld3AaYCRfvpBfDINrKhH
 8VonNw/8wOPn2a0xcO9OGpCLywMBwcO/Cl6Y+YXm0ITFU1PyjI7JhCTDciQtkE6Qd/5ds4
 FZsDiadZesfwJjpjDEEIxreEfjEqc2sKHBAUB/YPyq+gUXzLAup/xoKUHak6Ccs7tKa7nL
 /cxwXKZCMT7T9NwGVdEL6EzmElTXVFfvJXljMf7CTGodBB2RzylIRvLjPCMi6Q==
Date: Sun, 15 May 2022 23:09:19 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220515230919.491af84e@windsurf>
In-Reply-To: <20220506054651.2853406-1-james.hilliard1@gmail.com>
References: <20220506054651.2853406-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] toolchain-buildroot: only allow
 BR2_STATIC_LIBS on supported archs
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu,  5 May 2022 23:46:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_aarch64_be
> +	default y if BR2_arcle
> +	default y if BR2_arceb
> +	default y if BR2_arm
> +	default y if BR2_armeb
> +	default y if BR2_i386
> +	default y if BR2_m68k
> +	default y if BR2_microblaze
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_mips64
> +	default y if BR2_mips64el
> +	default y if BR2_or1k
> +	default y if BR2_powerpc
> +	default y if BR2_RISCV_64
> +	default y if BR2_sh4
> +	default y if BR2_sh4eb
> +	default y if BR2_sparc
> +	default y if BR2_xtensa
> +	default y if BR2_x86_64

This should probably go in package/uclibc/Config.in, and be named
BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS

> +config BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
> +	bool

Ditto package/glibc/Config.in

> +config BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
> +	bool

Ditto package/musl/Config.in

I believe it's a good idea to have the description of these
architecture dependencies into the C library packages themselves.

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
