Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2514C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 976724016A;
	Mon,  1 Aug 2022 20:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 976724016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yscazzEeapVF; Mon,  1 Aug 2022 20:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED3540122;
	Mon,  1 Aug 2022 20:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED3540122
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C37711BF293
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB11B81750
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB11B81750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9s57Y5EDo8lY for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:10:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C48F813CA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C48F813CA
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:10:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28E151BF205;
 Mon,  1 Aug 2022 20:10:53 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:10:51 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801221051.5c864a38@windsurf>
In-Reply-To: <20220727181304.440002-3-bernd.kuhls@t-online.de>
References: <20220727181304.440002-1-bernd.kuhls@t-online.de>
 <20220727181304.440002-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659384653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLBCPp0sjSUsUWVWbok6co+5Fi2075LmEW9CoONb6pY=;
 b=p5RI3HgmsNM5ECHTo/BFhL3r2NaLwHU045Vlti3pbMkwfPvbdKXct9c6YfuvbFmacXdX5E
 ximG/GBV7wQyQOAtOFqMoiDB5Y6k/ECG1N4Wzsfxl8gNXwKNX2U8jlY05i4G0ZWOaV9RoM
 C+yUCDFc4xH67NZFhxfnMuh/Biyl2xu9pLwWSQEJVsNf2ex1Y0uJuN0EOlRSNG0qAKmRVw
 oMltG7vLN9Q0ed14IszP0i0MRgQtvMkiCSai4NnZiSqDmDRodbB3clZEGPXCfh0yhAY3Yl
 O24pwO3Pf+PU4rr34dHyWatielOIuV/FVrKcJXKKaCYeF7mOn7kjAsfzWz+eGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p5RI3Hgm
Subject: Re: [Buildroot] [PATCH 3/4] package/dht: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 20:13:03 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for upcoming version bump of transmission.
> 
> Build test using this defconfig
> 
> BR2_PACKAGE_DHT=y

I was not really happy with the patch adding CMakeLists.txt that
upstream rejected. But the upstream Makefile does not even allow
building dht as a library, nor installing its header file. So the other
option would have been to do it directly in the Buildroot .mk file,
which is not really better than adding a CMakeLists.txt. So I've
applied as-is, even if it's not ideal.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
