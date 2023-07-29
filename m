Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F855C00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 345FD81FE7;
	Sat, 29 Jul 2023 21:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 345FD81FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTLM-WpFdmPv; Sat, 29 Jul 2023 21:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F1AF81FEC;
	Sat, 29 Jul 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F1AF81FEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7811BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03927409C3
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03927409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLypxQR_D9fc for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:59:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2A9B409B6
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A9B409B6
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBCDF1BF203;
 Sat, 29 Jul 2023 21:59:16 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:59:15 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230729235915.32c59805@windsurf>
In-Reply-To: <20230507214317.409305-1-bernd.kuhls@t-online.de>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690667963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bw3NcrmaD6vt9SIOjKbbX+RrgZniARI2KrX1uphpbzs=;
 b=KlWMWWXa2zk/MgLOmPwZI4ThRXWa76eHOBd0wi+Th3hCLjBt3lvS+yW83zyxTMwzFGRxND
 SlIK106XcGWvp1bgaSDQq9A3Bz5cOEffhh5dz4gQTenwehJ1yXH+7CJKYatrbMYWA7ZvEI
 6X++LURQl7S5pvss72BYYceAS/XrCeDYUW/MHBiHnLmbHUkCCGxSUswbHG51EMzV2hdQFZ
 js3qOjhmWNnZ+4NYdi6Q677Q4HJtFbp6F8ek8DCVUNdKYAC2+fQSM4DFOdb1yoF9r9J6rY
 hgPjqUHEcmAWUo7oiKHNe/FjgDorh3joy3y6RVScm6xIBQQleGZo8U6XcufVxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KlWMWWXa
Subject: Re: [Buildroot] [PATCH 1/5] package/intel-mediasdk: fix build with
 gcc-13
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 May 2023 23:43:13 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...dd-missing-stdint.h-to-mfxparser-cpp.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch

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
