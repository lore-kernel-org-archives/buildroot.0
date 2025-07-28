Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C07CC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C97D40F64;
	Mon, 28 Jul 2025 20:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meeq26MsQOu6; Mon, 28 Jul 2025 20:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 742FA40F5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 742FA40F5E;
	Mon, 28 Jul 2025 20:50:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4E791D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0383A409F3
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOnY5el6jw0F for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A671B40083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A671B40083
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A671B40083
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:50:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBC1D42E77;
 Mon, 28 Jul 2025 20:50:42 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:50:41 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20250728225041.12ce3593@windsurf>
In-Reply-To: <aIPkLxHygRDs7WVw@waldemar-brodkorb.de>
References: <aIPkLxHygRDs7WVw@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdegveegkeetiedtgeegvdehudetffffvdefkeeftdfhjeffuedtgfelheeguefgnecuffhomhgrihhnpehophgvnhgrughkrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeifsgigsehophgvnhgrughkrdhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753735843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+JljTuMvYRIXd+VhtMyiWFfD/bhXpU9TSBqsQREgKI=;
 b=CV8zs92BPlOtOGCgs//tzUH5L8ub4ZdQGUMoOLHRGnV2cYP9T45eunLujjm6cM3WRsH+vq
 UHm8hb5I+2vBT8YAFB1Ur5wtFaSYPBjgrNuDKy/kINTldNSBBwfCxf8UfJBhlnZUhbfdvF
 Sk+K4q81AsIjUFdlRrt9prQNLCqrkugv1B1ZX5wQRuUi0j8RzIT9eaxvQRDwzLMjJ2XK6m
 NF9fVdMCfQLlgEpnvRwucfF1n/99fLOsZ3Ylh30BBYfDvhalDMCVn3d+8PfsC9AUKZOaLz
 mrhZ25h3LgUliFTa0xdaRtGIh+f5R8a7X5UTKgzuLZ306LcdENccgw2R0qsrVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CV8zs92B
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.54
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Jul 2025 22:08:15 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for release notes:
> https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/FCUVZRWXEWHOREQPCR5OZGGS3R5WVK2Z/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/uclibc.hash | 4 ++--
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Looks good,

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
