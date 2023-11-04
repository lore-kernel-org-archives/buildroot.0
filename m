Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB39BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 882C740273;
	Sat,  4 Nov 2023 20:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 882C740273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zdf8UU0gBbdL; Sat,  4 Nov 2023 20:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B2640360;
	Sat,  4 Nov 2023 20:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B2640360
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 217671BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E009740360
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E009740360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xh__ZdyebcOH for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:36:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8449140273
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8449140273
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4317D60003;
 Sat,  4 Nov 2023 20:36:05 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:36:04 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20231104213604.056218ed@windsurf>
In-Reply-To: <4642abb656bb8e63ff759d6f2ab6eafeb2e3d39d.1696436249.git.stefan@agner.ch>
References: <4642abb656bb8e63ff759d6f2ab6eafeb2e3d39d.1696436249.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699130165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0DwLg6ETn0enwiDtVVF7hMoOBi/JYodgle+8J2bUdQ=;
 b=OcRMRYT41DcmCZg4Rp5OC1NtnGHMzJTN4Q5asV0cO+xTqANLEtK3kyqN6ezOysW+hR7fGH
 vKUlRH1T/PlhGhcou3QkU8Mido/V1hRZ8MwghR9ZzZTE28apOgO1FQqm30xYGyF8fSHiOS
 tqCDFuimyoEOseRhr1aXiUp4V/HLb7kNgXFNAUhVIb44qugOXyBTHsOht3Vcg3mKhvr1U3
 xZgwGNwiIYPpvr4LcTYihZyy2AsqVWGtoTStj8fojowHIc1e+LQjvbWawpJ0Xby0yUq/ZZ
 NjwgnJnk4GvtxmwDDIaFGAzK6hgwWQIscAFWb268l38mmlHOuIoA8whfvjZgsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OcRMRYT4
Subject: Re: [Buildroot] [PATCH] package/containerd: add control for
 additional build tags
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
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Oct 2023 18:17:36 +0200
Stefan Agner <stefan@agner.ch> wrote:

> +config BR2_PACKAGE_CONTAINERD_DRIVER_DEVMAPPER
> +	bool "devmapper snapshot driver"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
> +	depends on BR2_USE_MMU # lvm2
> +	depends on !BR2_STATIC_LIBS # lvm2
> +	select BR2_PACKAGE_LVM2
> +	help
> +	  Build the devmapper snapshot driver for containerd.

I've added a Config.in comment here for the dependencies.

> +config BR2_PACKAGE_CONTAINERD_DRIVER_ZFS
> +	bool "zfs snapshot driver"
> +	depends on BR2_LINUX_KERNEL # zfs
> +	depends on BR2_PACKAGE_HAS_UDEV # zfs

I've propagated all "depends on" of zfs here.

> +	select BR2_PACKAGE_ZFS
> +	help
> +	  Build the zfs snapshot driver for containerd.

I've added a Config.in comment here for the dependencies.

> +
> +config BR2_PACKAGE_CONTAINERD_CRI
> +	bool "Build Kubernetes CRI support"

Dropped the "Build" word since none of the other options in this
package have this.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
