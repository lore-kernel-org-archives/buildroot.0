Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA65DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F90940358;
	Wed,  1 Nov 2023 21:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F90940358
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjV2kDxfZDzL; Wed,  1 Nov 2023 21:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 807EF4EEAE;
	Wed,  1 Nov 2023 21:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807EF4EEAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 858931BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B7E1704F2
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B7E1704F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USUDL8v-K_ti for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:06:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03786704F3
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03786704F3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38C791C0006;
 Wed,  1 Nov 2023 21:06:01 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:06:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231101220600.511bb82e@windsurf>
In-Reply-To: <20231101182155.62163-1-bernd@kuhls.net>
References: <20231101182155.62163-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698872761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcWuCNCuRScQiwm1jSYt4X+wF3eePTfwbooVDIkXjpM=;
 b=HnJDmlDFDnMBmpvu78WZYdBBaN06gsLRdlxRlPPkpGLFP6a+GbGluBYH36a4jDVKwvQ5sV
 ydquFyQonfpOas81aXVq3wDrVgPdFLJ8KDq8RTU2gtmHo1U2eqUZT/kwslqoJ3b0NVOrtW
 6TH7Zb1aAwliye+FLuTo9M49738zGCp32TJCtiU7TcV8vfz7JqQqwiefDvSWhrVBGYxWAn
 36y92CEOUQZd3JF2RPP3CRNkkXwl7YHFs7WWQKDHAZCj7hHlDW2p2OYo1dhmg7Yqce5VK8
 QlgUaWiyBbm0yQYIeHa4b+QC0zgMfFtIpLY5hKzfk571zXuQXPNlqJEjOyXwhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HnJDmlDF
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: bump version to 2.8.1
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

On Wed,  1 Nov 2023 19:21:55 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/networkupstools/nut/blob/master/NEWS.adoc
> 
> Removed patch which is included in this release.
> 
> Updated license hash due to upstream commit:
> https://github.com/networkupstools/nut/commit/3b3773195082a95affab6ec1663c7937b1edce04
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Regarding the license update I am unsure about how to reflect the
> changes in NUT_LICENSE.

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
