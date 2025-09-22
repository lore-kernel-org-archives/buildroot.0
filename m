Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D01CAC5A7
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 05:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037A960EE9;
	Mon, 22 Sep 2025 05:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyAEpF9EmDjt; Mon, 22 Sep 2025 05:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FFB7613CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FFB7613CC;
	Mon, 22 Sep 2025 05:31:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A0BF1C0
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 05:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30C334134F
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 05:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-CW6KCd1L7F for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 05:31:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17BC5408FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BC5408FC
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17BC5408FC
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 05:31:03 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A05BA31E0986; Mon, 22 Sep 2025 07:31:01 +0200 (CEST)
Date: Mon, 22 Sep 2025 07:31:01 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: ciro04@incmail.it
Cc: buildroot@buildroot.org
Message-ID: <aNDfFWQGv9bkPeIt@waldemar-brodkorb.de>
References: <d9229956b9df19ee2f0e987386da78e0@incmail.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9229956b9df19ee2f0e987386da78e0@incmail.it>
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758519061; bh=9qzKMa/QZqt/ydQBomoafk2/Y7n9Yn8PAfewgxGpEUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sMAZaUiWGR60yRa34nzIV95cI8N4/FOEvf3+Nmqqu6l3Z4Ap9qyPOnktQbDQVuJaK
 /T7+LpMzxb80oNEkMU6muOEL9+/Rt7wiwRPWumcE3/26q5dMduF62cLQaDOqsU26tt
 L/MiLqPt8hbBiFLlriqK1jRNX2lcTAB6lrw2AZFIFENqCjpczKRBD8WzrzX4SpOwKj
 n5Y1SiLe/ac/4n6LKtnZZ1Tp6k2VRg02RHP+3njhwxlfh5Mu8KdK3H1ejULsQVno5q
 pe3HwdkYjm/QDoF/bEMEAoU1KfgnblXpAvl8HPziGGrmRvHvKuX7RUkjnn+JD+HC2X
 ADmdU4U56sk8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=sMAZaUiW
Subject: Re: [Buildroot] Buldroot 2025.02.1 Broken GBM  on xorg modesetting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
ciro04@incmail.it wrote,

> Hello,
> 
> im currently try to use Xorg on imx8mp (nxp evk) with D2/3D Accel. using
> modesetting + glamor.
> 
> when i try to set up Xorg with modesetting driver i've got this error:
> 
> [   198.155] (EE) Failed to load
> /usr/lib/xorg/modules/drivers/modesetting_drv.so:
> /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol:
> gbm_bo_get_plane_count
> 
> libgbm is prensent on the system:
> # ls -l /usr/lib/libgbm.so*
> lrwxrwxrwx    1 root     root            11 May 31  2025 /usr/lib/libgbm.so
> -> libgbm.so.1
> lrwxrwxrwx    1 root     root            15 May 31  2025
> /usr/lib/libgbm.so.1 -> libgbm.so.1.0.0
> -rwxr-xr-x    1 root     root         63600 May 31  2025
> /usr/lib/libgbm.so.1.0.0
> 
> on my .config ive got all GBM option enabled:
> 
> BR2_PACKAGE_MESA3D_GBM=y
> BR2_PACKAGE_PROVIDES_LIBGBM="mesa3d"
> BR2_PACKAGE_HAS_LIBGBM=y
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT=y
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF=y
> BR2_PACKAGE_WAFFLE_SUPPORTS_GBM=y
> 
> 
> is packages broken?

Xorg has a BUG. See my post from today on the mailinglist for a fix.
best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
