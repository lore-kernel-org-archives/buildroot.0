Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB23CCAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 18:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F1160B25;
	Mon, 29 Sep 2025 18:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP3TaWfqWAWV; Mon, 29 Sep 2025 18:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9005E60B35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9005E60B35;
	Mon, 29 Sep 2025 18:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F7DCF
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 18:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D983840AA2
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 18:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6a4ZMPZUiwS for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 18:50:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 880DC40A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880DC40A79
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 880DC40A79
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 18:50:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2E84FB0051E;
 Mon, 29 Sep 2025 20:50:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Sep 2025 20:50:15 +0200
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 20:50:15 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250929071622.136094-1-neal.frager@amd.com>
References: <20250929071622.136094-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d456b5739842dc3f22756b90ac8342ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759171825;
 bh=3H5yHkwqUIIPQW131BygWS7DwgZxJ1mlQt+jRXxMUgs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PabB176jKyZvzUBGK9zQ8A54DaL0ju/2GiDESSf7wJD59iLNK/utfvx8PYAVaXqzp
 q9NDxUlrpsQSklJw7W2rP0OTEeZnQZMiVD4LKqihZNb6nGC8erP6xYGNUD/vz92mox
 bj5JWkvHl/oUliZdloWA3lInYgDjWGV10VOcbGj+XbQjOvpm2hrtjuPGlj3aOygYRM
 dyplw7HUm/6x32fGzEvQWiQrlKKiam3v1y0Rvf4XCUffrzTzwLPS7rXsUGi5TZ8Ctb
 TGDqO8oSi93npNEWtfxxmcq5DZdFLrjlgW1x7z5UPgHyR0+Gs6FcnP18ItR8LtKfpP
 96KGmoTupgUBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PabB176j
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynq: correct zed board links
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/09/2025 09:16, Neal Frager via buildroot wrote:
> The web link www.zedboard.org is no longer valid as it routes to a 
> generic
> avnet.com boards link. Fix this issue by providing direct links to the 
> Avnet
> ZedBoard and Tria MicroZed boards.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
