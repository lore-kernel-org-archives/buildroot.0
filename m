Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB7BC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 16:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD6360A97;
	Sun, 18 May 2025 16:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogRIucdct98x; Sun, 18 May 2025 16:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD326075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD326075D;
	Sun, 18 May 2025 16:17:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD34E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F251260AA0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZqpLGvFo9yo for <buildroot@buildroot.org>;
 Sun, 18 May 2025 16:17:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E405560720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E405560720
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E405560720
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:17:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 18462B00573;
 Sun, 18 May 2025 18:17:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 May 2025 18:17:20 +0200
MIME-Version: 1.0
Date: Sun, 18 May 2025 18:17:20 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250518115808.3649869-2-bernd@kuhls.net>
References: <20250518115808.3649869-1-bernd@kuhls.net>
 <20250518115808.3649869-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <2ed14a5dd0171a3f527ef18197abb4bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747585043;
 bh=8tTI0lFcM0IMMpS8R+Tc2XoZ/NJdy0ktxAt94feRzDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=clIwqgYkiV+I86BZpHfHWLdpuq3tg7JXwVolZFEVe/d0+HSSKO8LzH4gLX7RuC8/v
 oV5fDgHK4W7MGBqy0JsJpyMZxLhIBnB3USEvbA9NzTrzel1FWGB/Ofu9FVKUSV3ho6
 Vn7+W5KHZpv70WPHcWU7JO079t3wTbf/tZmr2wUQTIvbpZkDyn7KdtVBW5m+pYRhCN
 leQbUPr2dSZPNVmeLXE08G4ISdH/exDb37Atsoj7UCGWG1xNRmpAvFde5iTOqm+lGV
 NZRzxjTqa+x/+c5gTRTsPg+TrSu7RMGjppJU8r4d+GvU8hkrm8FHbptAo020UrqkEQ
 JciNn1pCYLyfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=clIwqgYk
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 25.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thank you for this patch.

On 18/05/2025 13:58, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2025-May/000802.html

[...]

It is introducing few checker errors. Running

     utils/check-symbols

outputs:

     package/mesa3d-demos/mesa3d-demos.mk:56: 
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM is a legacy symbol and should not be 
referenced
     package/wine/wine.mk:146: BR2_PACKAGE_MESA3D_OSMESA_GALLIUM is a 
legacy symbol and should not be referenced

And running:

     make check-package

outputs:

     .checkpackageignore:801: ignored file 
package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch 
is missing

Could you send an updated patch addressing those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
