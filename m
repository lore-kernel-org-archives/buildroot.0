Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F236C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58325707F3;
	Fri,  3 Nov 2023 09:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58325707F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iouWJR0JuSda; Fri,  3 Nov 2023 09:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB5A070828;
	Fri,  3 Nov 2023 09:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB5A070828
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1501BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21802852B6
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21802852B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIaunJXQUZ1d for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:33:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 009C4852B5
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009C4852B5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9736EFF80A;
 Fri,  3 Nov 2023 09:33:32 +0000 (UTC)
Date: Fri, 3 Nov 2023 10:33:31 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103103331.4f60743e@windsurf>
In-Reply-To: <20231102222217.239293-1-fontaine.fabrice@gmail.com>
References: <20231102222217.239293-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699004012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EndBVgsrJ6mQ+9eYExmQUgdaCa7GZ4n7H9TuRNxYlZ8=;
 b=BHMxoyy2jBRTRtKfxEg4L6/i+V7y8iao/JtnoD4QzOdBTBLtuiY5ZpuoVOYU7jJzTNzszm
 GrA7akYj8BQqLtv6EYa1J1FiMqKebhfd/5EJqtWQrz3s3kAOquDBkMOuxW7QKxjbC7nonN
 EqOyzQuZ2l0QLvjeBLMXuiHYYS1s52BAKpW5BwHqxro/ODM7z+PKJC9gAwboDm2FBm+tIZ
 CPUvoqkdNoWuFNlMIPm1/+NjBldwTRAdKF8Oa+9iCPAK3AJDP5ZlIAtnY7sBnH+rcdl+Au
 3XYvEpM9QWJd7Fc09SHrvy74velY6Kef4Ety7eESt72nJDw4wLVDbEE3kus2qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BHMxoyy2
Subject: Re: [Buildroot] [PATCH 1/1] package/iodine: bump to version 0.8.0
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

Hello Fabrice,

On Thu,  2 Nov 2023 23:22:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -IODINE_VERSION = 0.7.0
> +IODINE_VERSION = 0.8.0
>  IODINE_SITE = http://code.kryo.se/iodine
>  IODINE_DEPENDENCIES = zlib

This...

>  IODINE_LICENSE = MIT
> -IODINE_LICENSE_FILES = README
> +IODINE_LICENSE_FILES = LICENSE
>  IODINE_CPE_ID_VENDOR = kryo
>  IODINE_SELINUX_MODULES = iodine
> +IODINE_DEPENDENCIES = \
> +	host-pkgconf \
> +	$(if $(BR2_PACKAGE_LIBSELINUX),libselinux) \
> +	$(if $(BR2_PACKAGE_SYSTEMD),systemd)

would be badly overridden by this.

As reported by "make check-package":

WARNING: package/iodine/iodine.mk:14: unconditional override of variable IODINE_DEPENDENCIES

I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
