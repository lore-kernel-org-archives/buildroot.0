Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4F0C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67754410E6;
	Mon,  7 Nov 2022 22:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67754410E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTpP5R2Tgtaw; Mon,  7 Nov 2022 22:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E52410D6;
	Mon,  7 Nov 2022 22:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E52410D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60ED31BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A908410D6
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A908410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLI_XUGl7djt for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:13:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1551410BE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1551410BE
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:13:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E9B520009;
 Mon,  7 Nov 2022 22:13:07 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:13:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221107231306.216743c8@windsurf>
In-Reply-To: <20221106153803.276223-1-fontaine.fabrice@gmail.com>
References: <20221106153803.276223-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQtz4Dx0aNHSD+/PpI/yqK9p7Oh1qfs3rxvxK+HQrxA=;
 b=UHoltKg9bV4pJ2F/WrL15Izc/rj2DPHe8F1QRCE58BBEokS3BRzL9QVV5RDmnKPeGGPirn
 5Zsr1NZ8CRAXjhmvKFD1gj3m7f0hQMPzn4u6TuUh4UI6MZCM9qaEHQt8xLosLSDI6M6p8U
 GevECXRjg5GFBndeeUhYm2wYUtO06xweO5x7P+FfhtSluY1S9zSUuKvkuIspbFRJRYplwT
 PHxUeQUE69SEJcGKpNDXXwACH/ef3wBanqwY53qxrW3IyNqRDqN7dU4GFV9qsO4Xb2ypAX
 97UpKiUapjNxzXu+hZ1yUMclilPw47UZgeo3kIpEOCxwiY/oXZO41vjUw1+AXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UHoltKg9
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: add systemd optional
 dependency
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
Cc: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Nov 2022 16:38:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 5.0.1 in
> commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:
> 
> Run-time dependency systemd found: NO (tried pkgconfig and cmake)
> 
> ../output-1/build/lxc-5.0.1/config/init/systemd/meson.build:11:4: ERROR: Dependency "systemd" not found, tried pkgconfig and cmake
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/495175c367084093bc01c40290736c738d876894
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---

Applied to master... but...

> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +LXC_CONF_OPTS += -Dsd-bus=enabled
> +LXC_DEPENDENCIES += systemd
> +else
> +LXC_CONF_OPTS += -Dsd-bus=disabled
> +endif
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +LXC_CONF_OPTS += -Dinit-script=systemd
> +else ifeq ($(BR2_INIT_SYSV),y)
> +LXC_CONF_OPTS += -Dinit-script=sysvinit

What is this doing exactly? Should it also be set for BR2_INIT_BUSYBOX,
which also uses sysv-style init scripts? Is the init script provided by
LXC actually usable in the context of Buildroot?

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
