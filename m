Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F219FC77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 06:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61A0C408D1;
	Wed, 24 May 2023 06:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A0C408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwwa7-mGHBIi; Wed, 24 May 2023 06:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5154E40329;
	Wed, 24 May 2023 06:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5154E40329
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3287B1BF85D
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 06:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A81440329
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 06:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A81440329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QINAEDKzVOoK for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 06:26:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F2F40321
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34F2F40321
 for <buildroot@buildroot.org>; Wed, 24 May 2023 06:26:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 40A1F1C0002;
 Wed, 24 May 2023 06:26:34 +0000 (UTC)
Date: Wed, 24 May 2023 08:26:33 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20230524082633.3146aaae@windsurf>
In-Reply-To: <20230524031601.19938-1-bagasdotme@gmail.com>
References: <20230524031601.19938-1-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1684909595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XEvOpOQUfBCm+/t+F0yq5JivuZglG9jeMAJrd1WnIE=;
 b=lR8y2MZ5OgkmHmxXKrkGNDYQyl4SVlHlmC3wldWhLNTUsJK+O/kWyVTTQifM6ULR2fwIkC
 JINnCTr1rX4H4vm/sVJYECWI0v79D1R0tFBLmJakP8VrwmmMFfkMF8Gj99uJp19H+GHPfu
 wiiZvvj4x2U+hPr3nHy206zqtZrij530S+hNNQiRYPCVbom+6JfZS8ZP4AAA9PMbJc61LV
 PIA5Y0UDt2/lCPgRQMaLJsG/b5OvEfBF1KMMyJDO9ebwUqD6XB9TpAGsYBS/5ChJLPOihC
 HGVF+oVU0V7fjRjEdySxv9MBM/0aYS2HcabWf0iXDXh0bXYqoavVR37so+m9Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lR8y2MZ5
Subject: Re: [Buildroot] [PATCH] toolchain-external-custom: Describe
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 May 2023 10:16:01 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> "Toolchain prefix" option apparently doesn't have any help describing
> it, which causes confusion when using external toolchain. Leaving this
> option at default prefix name ("$(ARCH)-linux") when external toolchain
> components are called with different prefix (e.g.
> "$(ARCH)-unknown-linux-gnu") may cause build failure unless the prefix
> symlink is already in place (e.g. when using Buildroot-generated
> toolchain as external toolchain).
> 
> Describe the option to clarify.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
