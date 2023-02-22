Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB67C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB11F41199;
	Wed, 22 Feb 2023 14:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB11F41199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRV_a0P4s0vW; Wed, 22 Feb 2023 14:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F28434107F;
	Wed, 22 Feb 2023 14:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F28434107F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BDF91BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FE458208D
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FE458208D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqTmeQ_Cu42w for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:52:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E0F82092
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3E0F82092
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:52:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1135240006;
 Wed, 22 Feb 2023 14:52:12 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:52:12 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230222155212.4aecfc97@windsurf>
In-Reply-To: <20230222103917.2709112-1-marcus.folkesson@gmail.com>
References: <20230222103917.2709112-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677077533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lA0R4gUWbFjmd+YK2XeU9eT70q+voDKEqZzUn/ZVMtM=;
 b=W8BzKEJQrI59B8pqEliZqxSXjrb+vVo4J1UvFbn/OtF4aa6mOzMUahRceB+jZHNyOE2i34
 3MFTr+fvTlC17OHHTTDx5oKpEUCnQ54YeXTN9J3MQfyqEFJbAsnSnVTeWiKSuQSLJ/6ku2
 +B6FGsAKHZvhL4OqiAMyZKh81UMj+P3ct8+7a0LHoM4D/DvDchprzlC5bN55Lx+LrS9SV0
 j46nACizDZ9F7o5tr3kLhbOv/WDJ7sAWmgdGVpzvVm6ec3IwwBU1dlhe3Iid+6GO1HR5E8
 MFy9sDwG3ubOt0dXtpQglTkOrzFHOZFYmvVy1rmzVj2M6wob2qiBtrrBk+8W8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W8BzKEJQ
Subject: Re: [Buildroot] [PATCH v3] package/libcamera-apps: enable LIBAV
 only if libdrm and ffmpeg is present
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Feb 2023 11:39:17 +0100
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Since commit 35266e84043f880d7591e52b71a8c5b8d0e4717d, libcamera-apps
> does enable LIBAV by default which depends on libdrm and ffpmeg.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c/
> 
> /home/buildroot/autobuild/run/instance-1/output-1/build/libcamera-apps-1.1.1/encoder/libav_encoder.cpp:13:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
>    13 | #include <libdrm/drm_fourcc.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

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
