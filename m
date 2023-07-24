Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E8EC001DC
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 02:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E8260BDB;
	Mon, 24 Jul 2023 02:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E8260BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnT9Axi6fc1S; Mon, 24 Jul 2023 02:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E441160BE2;
	Mon, 24 Jul 2023 02:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E441160BE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57C211BF379
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 02:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286524095B
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 02:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286524095B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HhOSTEEzT6O3 for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 02:05:57 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Jul 2023 02:05:57 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56ED240940
Received: from zimbra.gangsto.cz (pyroxene.gangsto.org [78.46.142.91])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56ED240940
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 02:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.gangsto.cz (Postfix) with ESMTP id 20ADC69FAD
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 03:58:49 +0200 (CEST)
Received: from zimbra.gangsto.cz ([127.0.0.1])
 by localhost (zimbra.gangsto.cz [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id n2lwehl2hieP for <buildroot@buildroot.org>;
 Mon, 24 Jul 2023 03:58:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.gangsto.cz (Postfix) with ESMTP id 999D66A181
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 03:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.gangsto.cz 999D66A181
X-Virus-Scanned: amavisd-new at gangsto.cz
Received: from zimbra.gangsto.cz ([127.0.0.1])
 by localhost (zimbra.gangsto.cz [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ciZ8spGnRZxI for <buildroot@buildroot.org>;
 Mon, 24 Jul 2023 03:58:48 +0200 (CEST)
Received: from audun-yoga.localnet (unknown [58.97.182.106])
 by zimbra.gangsto.cz (Postfix) with ESMTPSA id 0E7C66A180
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 03:58:47 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 09:58:45 +0800
Message-ID: <3280346.P6BXfyaWev@audun-yoga>
In-Reply-To: <14204500.ZvbfcPJBoq@audun-yoga>
References: <14204500.ZvbfcPJBoq@audun-yoga>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=gangsto.org; 
 s=19307520-F6A0-11EC-9341-E84B7535AF77; t=1690163928;
 bh=G2e6tXRAjvy2eGKFjap3iyIUuZONQVnvGsbIV7AS3w8=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=NLMBPbvkyf4SJbWqEqDgRI9RwqOrgPQvy0oLDFFGFqHowPQIKUGISIguWbbZaXx2x
 gPfxdJi7aAI5dvfAalJi2ZqbG3oskQRdmrcpqr9OIm0XiJdD5sqv4XtRXdpOeQ33XR
 VCx83OhZ3XsRDDmN1nCngD2hhupQQahwfxIp6CRYcwn/aCnBjNq1GFuD4z8F37dvis
 Pr45IEXyP/TN/Mss9nlPGw9iYuBDwMdyOB6D/yB1P9VyhMu/Kr6/5CpNY/hZx/x0MP
 3vtzGlYDbytjct7ERwt4UxL5th3uznmm7xBfKHiLKIriD6YY7oZvlajPCYng4f+wLF
 aBl7qa18m4oTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gangsto.org header.i=@gangsto.org
 header.a=rsa-sha256 header.s=19307520-F6A0-11EC-9341-E84B7535AF77
 header.b=NLMBPbvk
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: optionally
 include zfs graphdriver
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
From: =?utf-8?q?Audun-Marius_Gangst=C3=B8_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: Audun-Marius =?ISO-8859-1?Q?Gangst=F8?= <audun@gangsto.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi again,

I'd really appreciate if you could consider including this patch, or perhap=
s =

tell me what I'm doing wrong/missing.

I tried to keep it small and not change default behavior.

It works for me when building on x86_64 and I'm using it in my project at t=
he =

moment.

-- =

Best regards,
Audun-Marius Gangst=F8


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
