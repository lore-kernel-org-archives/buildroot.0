Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B205C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E8C408B6;
	Wed, 27 Jul 2022 15:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E8C408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFY3gmOzPz9Y; Wed, 27 Jul 2022 15:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0125408A3;
	Wed, 27 Jul 2022 15:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0125408A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC92C1BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FC86415CB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FC86415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBzgUBLe4uBN for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:46:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95FDA415C6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95FDA415C6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:46:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CA4A60009;
 Wed, 27 Jul 2022 15:46:44 +0000 (UTC)
Date: Wed, 27 Jul 2022 17:46:43 +0200
To: Quentin Barbe <quentin@barbe.me>
Message-ID: <20220727174643.7835f2c4@windsurf>
In-Reply-To: <20220124223555.8595-1-quentin@barbe.me>
References: <20220124223555.8595-1-quentin@barbe.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658936804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUk2gLLEz9IHJcz/bqsYvuAPXXSxFLSoHkDJnkls0wo=;
 b=iNCLaCPJa+saGg0ZyW82O70wtmAVX2Syfzy5VUy0JIzOUrAdc6CqXGxPzWL8psirfo3UqU
 3vzj2TyZ9lafEJruOQaPUY5eRkUTEhHc5Tb/ZF7lEhQgf0l2DX/sWmkJfxvplVQ4+ZiaOF
 iaV63RlYJRELfrzV8yrAy/9xxsLlDZ5g7uIo7uIdxUFVfXhnOS8nz3pMZr0Hwz1kTy0RzF
 6tN0XcovKSS3Q4OIQa/XC8TsbKIv3U/LxAm9h6piaC7bJlqf5+YYP7OHLsDjU7HEHukb0/
 tep4eNs9EILKFKfgt28vvXv3jM+qDGYhD1IYgzYHlocymSGJSlHUf8gSG7Vvjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iNCLaCPJ
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: add fw_printenv to
 host uboot tools
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jan 2022 23:35:55 +0100
Quentin Barbe <quentin@barbe.me> wrote:

> This is useful to be able to customize the default env images in post
> build scripts.
> 
> Signed-off-by: Quentin Barbe <quentin@barbe.me>
> ---
>  package/uboot-tools/uboot-tools.mk | 3 +++
>  1 file changed, 3 insertions(+)

Sorry for the long delay, but we have now finally applied your patch.
Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
