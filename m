Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C0BC36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 835BF60761;
	Wed,  2 Apr 2025 19:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qF1tBmQK_bI7; Wed,  2 Apr 2025 19:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B7060A6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B7060A6C;
	Wed,  2 Apr 2025 19:28:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33588123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F81E83857
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3EFOCi11Vqn for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90FA28222C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90FA28222C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90FA28222C
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:28:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 51142B00548;
 Wed,  2 Apr 2025 21:28:50 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57454])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Apr 2025 21:28:50 +0200
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 21:28:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250401142539.4009844-1-dario.binacchi@amarulasolutions.com>
References: <20250401142539.4009844-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8ba00beef3c916251a1f1b52a7f31e7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743622134;
 bh=3pZY1/8woLX6quRz14lP9ZIm4tYUn/xwvY4q1l/IqzA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Stok3RmETtf8ZAxox0cZbPDpcsFYmdTeJBWhOiFmYtYaB4KPbWUg3XjxQAbLiTYLc
 bW5GesR3zKSOGAkCz5hDMOlj8wGH2AHV146p2tGp976evrTVhpN9QwMeAv8Zuo7yPM
 EHgJ+8PBQAwWs9/loHXbmF1NDJ0nNe6ol43/uvmhxWH4+hJg+7+HgzYzrXYnSN3Xau
 7O186VypMj3ueAMBpHRZVxXGlcCciq6Kf1df4Ki0zpwoK2k6ZpDt12P1SmQIO7W/Eb
 Qkxff5/wWHqmKb9kXo2BP4bvwY4JaE69fexKwkIOjBXuRddzpsN8YAlOJanSVRe0y3
 WxdBDWs8YDVTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Stok3RmE
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-firmware: bump version to
 20250311
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

On 01/04/2025 16:25, Dario Binacchi wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> Additionally, the files intel/vpu/{vpu_37xx_v1.bin,vpu_40xx_v1.bin} 
> have
> been added along with the corresponding license LICENSE.intel_vpu.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
