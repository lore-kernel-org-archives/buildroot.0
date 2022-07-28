Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AADC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08E8660AF0;
	Thu, 28 Jul 2022 20:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E8660AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kR6ZbShEuDAG; Thu, 28 Jul 2022 20:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D05F60ACD;
	Thu, 28 Jul 2022 20:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D05F60ACD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1AC1BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 582AF8267C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 582AF8267C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dmdj1VGnv_Q for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:56:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4288D8266D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4288D8266D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:56:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E25F240005;
 Thu, 28 Jul 2022 20:55:58 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:55:57 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225557.32c66b9e@windsurf>
In-Reply-To: <20220728115204.2465495-1-fontaine.fabrice@gmail.com>
References: <20220728115204.2465495-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rpn/nfd9HqwV1iibVFyF5077MFiZg9sS1uCctsi5P4=;
 b=dADuy1x2N4CmGlqud5wCLVpP1MBWuRx3bYG1WhayqeKauHt7VFYJ2PCgf7R/FsaAPZgziy
 xsZ8QQCbAytJgoMh7QRDGuB2rBS0KXy04s+n/huv9/gJlo7c6Mx7lYh+ACbFoqkJS5Bsro
 5MWbVljqMkKBJorRTTi2iWyQa4+aYlvaPznaSwbAUzMzGeZg7b6QKOlQzYOcmVGthKBv+A
 juIbzh45y/1Za0fX+c8yNZwurdt0tFi/jEVTJE78EKIbPrVWik/Qkkl8Qqe1hf1AMC3aMA
 XN20ojLtIF1hnObf5RsuexHwI/bR+GqH0go/zfGvILSUaBePvhFkOsRQ1Kl4ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dADuy1x2
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: fix speex dependency
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

On Thu, 28 Jul 2022 13:52:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pulseaudio needs speexdsp, not speex resulting in the following build
> failure since commit 7752afbe4bb9fa1def5ba89daf21564ea58af79a which
> explicitly enable or disable speex:
> 
> ../output-1/build/pulseaudio-16.1/meson.build:713:2: ERROR: Dependency "speexdsp" not found, tried pkgconfig and cmake
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d4c5d5bfd65744753ca75180dd45a01c90f0b91
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pulseaudio/pulseaudio.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I have added a comment in the .mk file that will help us remember that
even though the option is named "speex", it really checks/needs
speexdsp as a dependency. Applied with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
