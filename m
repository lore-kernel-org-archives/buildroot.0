Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE7EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3505F60F90;
	Tue, 22 Aug 2023 19:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3505F60F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJRAXYvNdkDS; Tue, 22 Aug 2023 19:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9572460A6B;
	Tue, 22 Aug 2023 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9572460A6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2E31BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2BB81FB8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC2BB81FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4TMmpsS8rN4 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:21:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED6A781B6D
 for <buildroot@busybox.net>; Tue, 22 Aug 2023 19:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6A781B6D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1436620004;
 Tue, 22 Aug 2023 19:21:11 +0000 (UTC)
Date: Tue, 22 Aug 2023 21:21:11 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230822212111.47557335@windsurf>
In-Reply-To: <20230814170013.458539-1-francois.perrad@gadz.org>
References: <20230814170013.458539-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692732072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56Wt41WaMB1iBP1qP7AkQ77bN15p1Ew31pni7Bxl+dk=;
 b=DfGNjOhvWBq7e5kyqqBapN3/kymJE/Tpe6B12ufGF6FnXo+jPsAa7ziGiVyu8dvMqiRbjg
 s+RAQFP4ju2ZFoUnwFUI/KuwagBi57YzU3H926RkzZsd49mx9PluaFUCixxMn/i01UB/GU
 rVwgHCATQpsSWlAsH8S34P93sz3z4lEYtZkL3JvuhK8c/rXco+0iff1cr0S2Coog/A7NY+
 Dc2WnPP1s3MKiKKa6bNpaVrvwls/N2JYD3/kQ2e+oNQcjyrV02YuwpOwcmxEZy5OdKrfa6
 HlxYu7w7T0gFMG0sMjunkZcwYOHWaT7ZsPMGX5JvNS3wTRWP0HqPxRAeFQqPCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DfGNjOhv
Subject: Re: [Buildroot] [PATCH] package/chrony: bump to version 4.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 14 Aug 2023 19:00:13 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/chrony/chrony.hash | 4 ++--
>  package/chrony/chrony.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
