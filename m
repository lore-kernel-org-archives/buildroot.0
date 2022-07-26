Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE84C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF608131F;
	Tue, 26 Jul 2022 19:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF608131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jRbigf9JBkG; Tue, 26 Jul 2022 19:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 530F48131E;
	Tue, 26 Jul 2022 19:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 530F48131E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39B3D1BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FC36605EA
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC36605EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9Sij9b4wfOA for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:52:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9205D605E8
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9205D605E8
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:52:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74C57200002;
 Tue, 26 Jul 2022 19:52:36 +0000 (UTC)
Date: Tue, 26 Jul 2022 21:52:35 +0200
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20220726215235.56555d7b@windsurf>
In-Reply-To: <20220726174505.2976048-1-vfazio@xes-inc.com>
References: <20220726174505.2976048-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658865156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yVnQSokcu3i1F6uXToLT6bHhG+W2797ho0vDeAvQcA=;
 b=WYEwBKuRTiUHYIsDskA8E4F3YalaM6SJmm54+3bt5EudphAReUm8hDJLZeYspkokqdOeG2
 tFBc+OADOfKjutNabLeKjY8s54feAQ6VNFuYOLySq6HPdolfivUc1CYOrELFLhGcTPu6D7
 v/5nCSSWm247iluHM/uuNmo6UMC8yaQNKXdqGzVSQbnPy2LecCqmSY4VgG7MC1LyRAvLQP
 NnleTNk+dx2M9HPwFBjrIlEU6neU8gYPFHaBH0cnvKt6G8vr64/O4DcNKkJJbvNjbeKdBA
 yduxEtcjDDBm7RUoDOiHXiM3Mo5ygHuBANskFjicAW79xxPfoiUJ/nUtm9rxLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WYEwBKuR
Subject: Re: [Buildroot] [PATCH] package/mcelog: bump to version 184
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

Hello Vincent,

On Tue, 26 Jul 2022 12:45:05 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
> index 598aa648fd..94b5f2cc37 100644
> --- a/package/mcelog/mcelog.hash
> +++ b/package/mcelog/mcelog.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  e9c82b565da06673c2630f9e6bc668634ad7d2c7f13c70db1900cce110ae62dc  mcelog-180.tar.gz
> +sha256  067d52006f0aa42045acc6d9c04d590362448bacd8ef415d42729e6f35825028  mcelog-184.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
> index da7785ca91..6a0d806661 100644
> --- a/package/mcelog/mcelog.mk
> +++ b/package/mcelog/mcelog.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
>  
> -MCELOG_VERSION = 180
> +MCELOG_VERSION = 184
>  MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
>  MCELOG_LICENSE = GPL-2.0
>  MCELOG_LICENSE_FILES = LICENSE
>  MCELOG_SELINUX_MODULES = mcelog
> +MCELOG_DEPENDENCIES = host-python3

If I read correctly the Makefile, it seems like host-python3 is only
needed to generate the manpage, which we don't need. Perhaps it would
be useful instead to contribute upstream a make variable that would
allow to disable building the manpage, and therefore get rid of the
host-python3 dependency?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
