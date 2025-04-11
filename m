Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76650C36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 03:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1508A4099E;
	Fri, 11 Apr 2025 03:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m52KGsyoa7aS; Fri, 11 Apr 2025 03:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B78D40835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B78D40835;
	Fri, 11 Apr 2025 03:56:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59DD3138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 03:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F5B88187F
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 03:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lTwpRRSg9NG for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 03:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C45E580F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45E580F82
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C45E580F82
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 03:56:28 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9530D353016E; Fri, 11 Apr 2025 05:56:24 +0200 (CEST)
Date: Fri, 11 Apr 2025 05:56:24 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Z_iS6ED6krlH7k5A@waldemar-brodkorb.de>
References: <20250410180141.2194321-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410180141.2194321-1-dario.binacchi@amarulasolutions.com>
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1744343784; bh=6TZJXEF92kiLxEGImQvzgBb0bxIIHs34t1zGZjtoGFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J2N4JeE3Xlcz6OdFqDRKR1eSE21QPiOG3mhFWaECGY4d9pSB4+3WiFUeZVZyqhabC
 2UMljYQ6PQE9k3CgVUI0NZaVbMBj8HVFvghe5QBU6quRMphxzJJfmCLCpPh3Md+0eV
 y+TspiVagnFsarsFTVxMQUXuE7MYTfpEbWdmehJBjB0KPUvhejSJhm33o9+IEV/sOq
 ZvCyh2ZAeHzpKwr+3g0D+IoRPDD0/moPvbXGSP4l5OHgQzadh2SlZNEZOi40ZgiY1W
 cl4+ePbrX4fnWoiokREqapyAGabzIGyCgDH8/UFGiQxpr7HfMrsUW24e1VI6muIu5H
 MsCdXqVM6vyFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=J2N4JeE3
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux
 to 5.15.179 and U-Boot to 2025.04
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,
thanks. Works fine.

Tested-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar

Dario Binacchi wrote,

> The patch bumps the Linux kernel to version 5.15.179 and U-Boot to
> version 2025.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
