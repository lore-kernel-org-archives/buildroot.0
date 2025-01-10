Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEFCE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 17:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440E983B92;
	Fri, 10 Jan 2025 17:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VunOafOsCMr7; Fri, 10 Jan 2025 17:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656D083BAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656D083BAF;
	Fri, 10 Jan 2025 17:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E5076C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ED944124F
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FEofaJ0MaFf for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 17:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 606894124E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 606894124E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 606894124E
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:51:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 339FB60149;
 Fri, 10 Jan 2025 18:51:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33702])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 18:51:07 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 18:51:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <2e74286729fd798109e9c067c28e4a17af8522ed.1736521850.git.yann.morin@orange.com>
References: <2e74286729fd798109e9c067c28e4a17af8522ed.1736521850.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e46fa367427e12e60059309074645c80@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736531469;
 bh=hDMYEVw8f6z1Kg2k/oeTKHx5eGdRogrOAmpfSSutDTA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C0N0mBmSCmOHxzY9T07KbU/7c0pwEYZWWLQ2BDVrhI/IKdZcWrrqxq92C0JI4W+yl
 /AeqcKmQyXUokHjA4ntxlhWU+zG0fWHd8N9V+G7yxJKarcV2ziHHQ+bexebz2Vnz4/
 iFMZkfN06hhEC//F8trP5lawbhXMQmKE8ZbPTcYMwg+JW/YIyIMandheBE907B2z2D
 eafFgSjWqYIaTvgvmSrUi6m66C3HdHCeZAYohq9dS8GXEX19v2YWIG0VapOo1VLjIm
 eqqS1K7dAD0QNEa9jrrxW1mfeoNJB66JYtqYjRhgWTMBr4BwptFxvVUV7j3Oum6grE
 0UceB8tzrz8BA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C0N0mBmS
Subject: Re: [Buildroot] [PATCH] package/gpsd: python support needs pyserial
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

On 10/01/2025 16:10, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Usually, ubxtool, a python-based too lto drive u-blox devices, connects
> to a gpsd instance and delegates to it the responsibility to write to
> and read from the actual device. This is sane, because a serial device
> can only be opened once, and if gpsd is running, it has that device
> open.
> 
> However, in some cases, ubxtool can be used to directly talk to the
> device, to pre-configure it before gpsd runs, or even in the abscence 
> of
> gpsd altogether. This is not used very often, except when setting up an
> RTK base, where gpsd is not needed.
> 
> In that case, ubxtool will directly talk to the serial device. It uses
> the pyserial python module. Since this is not the traditional way to
> talk to the device, failure to import the module is ignored, and the
> error reporting is deferred until it is actually needed, which is why 
> we
> did not catch the issue earlier.
> 
> Fixes: f3ef0723cf71 (package/gpsd: enable python support and modules)
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
