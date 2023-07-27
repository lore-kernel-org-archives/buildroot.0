Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6565EC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 210DE409E7;
	Thu, 27 Jul 2023 10:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 210DE409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id My7fpCJ04J5e; Thu, 27 Jul 2023 10:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76532403CA;
	Thu, 27 Jul 2023 10:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76532403CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F74D1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD1D5403CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1D5403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bdi-3FpNPQoB for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:33:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5659401C9
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5659401C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id C88A51C000C;
 Thu, 27 Jul 2023 10:33:46 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:33:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727123344.20c6252d@windsurf>
In-Reply-To: <20230726194827.1462721-1-bernd@kuhls.net>
References: <20230726194827.1462721-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690454027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FL4U5TL9HfBJNTNKHwLLMm/dJdsquomcvi3XEHcU47A=;
 b=N4KAo6ICD0fz2SxVf0kYW17ejPNHdmOJzd7wzTWSUkGvqv+65KyLgDJydHFgh68S2IGZGS
 YHLT190zjGwSVnRa30YGByYR/qU8IFaGsJLc4XNqpWnQk/uYV8SfNkb3cUiPASph2oC0QQ
 EBNW7AWxOETb2FuKSp3BGP69QPCGcqSCfZrnWB6ybGk4LKi4vosKZ4RJXExyyrs4FOzq5O
 /r5CmdJxzrbJe2ZCDUZkuqrGRbx56jkdytr9FhAjPJQK5Xr8BVrJKF3i6vkAHCNVOBtAif
 vLwZomYclzLANK85oGjnNb94eif/5Q5m5tpk0yVZWhrI2fhtrNVeWnP00GA6bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N4KAo6IC
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: needs libyaml
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 21:48:27 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/cc1/cc141c81fd00ca3ece1c33b9659cce93dd5222a9/
> 
> Makefile:576: *** libyaml is in the dependency chain of libubootenv that
>  has added it to its _DEPENDENCIES variable without selecting it or
>  depending on it from Config.in.  Stop.
> 
> This error was introduced by buildroot commit
> 9325ba4754fea800658bb3aec99f28bba3d2acf3.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libubootenv/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Indeed, this was missed in the bump and during the review. Applied to
master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
