Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE98C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 20:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E35F960797;
	Mon, 10 Feb 2025 20:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWzq8gJ9dLZP; Mon, 10 Feb 2025 20:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16BFB60BE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16BFB60BE2;
	Mon, 10 Feb 2025 20:51:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3B906C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF2AF81E63
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUqx12cpRIwH for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 20:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABCC681E61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABCC681E61
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABCC681E61
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:51:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A7226B00573;
 Mon, 10 Feb 2025 21:51:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Feb 2025 21:51:01 +0100
MIME-Version: 1.0
Date: Mon, 10 Feb 2025 21:51:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: buildroot@buildroot.org, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
In-Reply-To: <20250210114538.3256759-1-Niklas.Cassel@wdc.com>
References: <20250210114538.3256759-1-Niklas.Cassel@wdc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <654098261b15b5d2ef7e4cfbd4ada530@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739220667;
 bh=N3TEDdty0feTTUYooLmsgoWPEZcOkpc/wNYyGo3d27U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wo8O1v6rWpYQSotDNPSmpLuJG69Y2glL3l8ijyH+Ne4wQ1ce5SUZTPvtZ+cqe54BS
 QsGxbr6qttf6N6oH2PSCSg+v8ux9ZF9Tm5QcXevOBgbLIKL/vI/hmaiQ64dlfRnU+F
 pemOAsw7umU1IG4ff0ZpYohzhj0zs4QvAZ2mTSRoYgT20/osjDtbbMHByVjBzoZ3Lm
 Asx69+NKrXcp/OV4Iu/imk6y5NJjOpJw+ua+TlmhxPEkWlMO5/jNxrh0Udq/oe1j0q
 RdtjOCjWEvYIVbfGlRY7iJ+XAeK+hTKsBMeghkqu2yVe1a3khMNdA2ptWr25qQ7vmM
 K3Tq+mYXQhr8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Wo8O1v6r
Subject: Re: [Buildroot] [PATCH v2] configs/rock5b: bump uboot to 2025.01
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

On 10/02/2025 12:45, Niklas Cassel via buildroot wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Bump uboot to 2025.01
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
