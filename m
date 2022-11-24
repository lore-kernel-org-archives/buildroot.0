Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A81EC43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07EC041802;
	Thu, 24 Nov 2022 14:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EC041802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbZWILTzBkwV; Thu, 24 Nov 2022 14:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9308417DF;
	Thu, 24 Nov 2022 14:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9308417DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9E281BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B20BD821C5
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B20BD821C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnNO8bqmNIS5 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:47:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B25821C3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78B25821C3
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:47:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EFF45E000D;
 Thu, 24 Nov 2022 14:46:56 +0000 (UTC)
Date: Thu, 24 Nov 2022 15:46:55 +0100
To: Stefan Hager <stefan.hager@ginzinger.com>
Message-ID: <20221124154655.0d3f0776@windsurf>
In-Reply-To: <20221124140627.3269192-2-stefan.hager@ginzinger.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
 <20221124140627.3269192-2-stefan.hager@ginzinger.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669301217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acBP2uremKd18be+Fx7hcQh9n5A8Xt3i24lQxR8L7LI=;
 b=CGDblz8UOU8/BV3Pps1XZCrMCga+h5njhx8NudNho4pz+pjDrVAg3Egzhi7vzuwAKIH/hK
 nlfSdzVk1c/czv4FWEJ8Jrt3QoZsZDvw/TMKtkA0MULyP0kvpeuc8i37f77pHzjCBZEn45
 4TVTfhHxlwIBAYg/kgIH2OiykxtXh5ZXgAFDqLnFhP+okz/kJ/rC5AW0PmUjFeD1mwyO5+
 zZresFyF7iz4qh2YjQcAKiTQ4mX/ydZE5d71S2k6G1ygf7KDlGp7HUBwHxTU850sTu96YF
 agTEMpnFRZLM+VPUZaSLvFyB3oA+ihwUVMw2eMRvNd/ulUub3N0zB7Pak56Blw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CGDblz8U
Subject: Re: [Buildroot] [RFC PATCH 01/10] tensorflow-lite-abseil-cpp: new
 package
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

Hello,

On Thu, 24 Nov 2022 15:06:18 +0100
Stefan Hager <stefan.hager@ginzinger.com> wrote:

> +TENSORFLOW_LITE_ABSEIL_CPP_SITE_METHOD = git
> +TENSORFLOW_LITE_ABSEIL_CPP_SITE = https://github.com/abseil/abseil-cpp
> +TENSORFLOW_LITE_ABSEIL_CPP_VERSION = 997aaf3a2830

We already have a package for abseil-cpp:

  https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/libabseil-cpp/

Why do you need to recreate one ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
