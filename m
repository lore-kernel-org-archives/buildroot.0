Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E59BC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA2D40977;
	Wed, 27 Jul 2022 09:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA2D40977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1K0lx8GfM1g; Wed, 27 Jul 2022 09:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F670405A6;
	Wed, 27 Jul 2022 09:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F670405A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14BC01BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0DE981429
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0DE981429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rY_006KbFdHa for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:49:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B011381317
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B011381317
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:49:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BB815240006;
 Wed, 27 Jul 2022 09:49:39 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:49:38 +0200
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20220727114938.2d337033@windsurf>
In-Reply-To: <20220117001814.2645cd1b@c3po>
References: <20220117001814.2645cd1b@c3po>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658915380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+3fcpLSL7uz4Kco/BvJakPEtXzaxFGO7uMUCfCiNnY=;
 b=JiHdAE/TV+8IWkSMmPDwiR4w2cXfl1c+/ZbWYfgOFf4x6YzMWSQ1xXFp3K2oAdEcvoVm3Z
 6s75l5KJZtzxzkL1sWhZgMmiQKaZrVfV1ER+QB0tCrWznyCX19yOBRN0w0PexiuZfD4PQN
 N92ZYFGCbsP59GF1UQ/5OmRj9CLBIB22s8XdBXL4JE5AxpGlZp4FTMPg0Bgys+VF+Fqw7B
 MOzEGrv0tsoWrqt7G4jOYqiY800I8s/rM77uZqOdeulfRo7YfVIKvflRsFvOiafIf9Jd/q
 /JlT7BKdb89y2VKYxhrwadjhOCHwWmElPgoA36rJqrG/h4AR2DM4IDQ3ycgIqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JiHdAE/T
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: new package
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

Hello Danilo,

Thanks for your contribution!

On Mon, 17 Jan 2022 00:18:14 +0100
Danilo Bargen <mail@dbrgn.ch> wrote:

>  N:	Danilo Bargen <mail@dbrgn.ch>
> +F:  package/tealdeer/
>  F:	board/pcengines/apu2/
>  F:	configs/pcengines_apu2_defconfig

Indentation and alphabetic ordering was not correct here, so I fixed
that.

To be honest, we discussed a bit the usefulness of the package. Indeed,
in Buildroot we unconditionally remove documentation from the target,
as we believe reading/using documentation on the target itself is not
really a valid use-case for Buildroot.

That being said, Arnout was in favor of merging your patch as it was
simple enough, so we did apply it.

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
