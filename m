Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC50C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C23BD60FE6;
	Mon, 18 Jul 2022 10:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C23BD60FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7aetLK-wGBf; Mon, 18 Jul 2022 10:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C59C360FE4;
	Mon, 18 Jul 2022 10:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C59C360FE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0ED71BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78609415BF
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78609415BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqQgwMgtOjCT for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:21:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10AAF415AD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10AAF415AD
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:21:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 09B6BE0006;
 Mon, 18 Jul 2022 10:21:31 +0000 (UTC)
Date: Mon, 18 Jul 2022 12:21:31 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220718122131.6c2c681c@windsurf>
In-Reply-To: <20220710070704.215227-1-bernd.kuhls@t-online.de>
References: <20220710070704.215227-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658139692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Io1DUKnBqEvsmzibjAdaO8ZhsJuKEH5FcaRNIW3HSI=;
 b=dP0WEyJSJ2DaexrjFQO87GW3N5ZUPCrcDYp33xzay07jA7/2bZlaVnythJLqQZf4vO+ML1
 8VhLXorymKR/zOEDW7D0+ym+exbcBerPP1yGPGX/K4jakJxg94UAfSvH7F31G4MLjrpgX0
 DNIUjZ5xldT7gkvDo4h5geQC8mVCf0TOBpB5xvyvEVeADsG9wxQvP1fQmVfWMScWmFUdxC
 U/CVMyVIGkjnVqop6wklDRoED5Ivyk8byOen/DF/SVYCCylCMmXO/5meaA6iSBmbZm5+Ut
 Jp6PWf9XvaXGlVsjgTfUH9M3WvOczEciaR780LxHGrxxHPdFWe7w3JwvKZI3Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dP0WEyJS
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: link with -latomic if
 needed
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

On Sun, 10 Jul 2022 09:07:04 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes build error:
> 
> /nvmedata/autobuild/instance-1/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
>  ../lib/.libs/libcurl.a(libcurl_la-easy.o): in function `curl_simple_lock_lock':
> (.text+0x46c): undefined reference to `__atomic_exchange_1'
> 
> Fixes:
> http://autobuild.buildroot.net/results/1ed/1eddc48f24ab766cfc880c493ed9b230fc57bc09/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libcurl/libcurl.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
