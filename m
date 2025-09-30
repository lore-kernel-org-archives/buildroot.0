Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D696CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0081A40E5E;
	Tue, 30 Sep 2025 19:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Wxk0aAE1qYk; Tue, 30 Sep 2025 19:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36C9440E62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36C9440E62;
	Tue, 30 Sep 2025 19:30:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED5A7111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBFA061038
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSANfgQMIx5l for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D73261036
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D73261036
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D73261036
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:30:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2883E780389;
 Tue, 30 Sep 2025 21:30:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Sep 2025 21:30:24 +0200
MIME-Version: 1.0
Date: Tue, 30 Sep 2025 21:30:24 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250930125823.971241-1-neal.frager@amd.com>
References: <20250930125823.971241-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <53398ca895cb5c23aaa8530507340fb4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759260635;
 bh=ZZZoXXRtXxDLCR2dp9Fbi7KNKXBtsS1A/RnMvENwgws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z6ghDaWjADe+UoQg7N8thpueH3PtHaBzi5SAuBQmRItZbrKTfXssmlLEfXHNtLX44
 7B0DlxQysOFs2AOiJlpQ535FRNG+yOg+OUP3R7f0KDHrYNBfO5PDz7koH/rdfJLbAW
 5g3d6YcgP/MkWnvYlsBXvmjzHdv+DGzeg3RRX377wkaT/lrexgE7LXJ3tsWrcGJiuZ
 Amo/oAId5lbyqP3AkA6Af0Od25PfnxUaKxpbBV4w6kf2Y2T+R9AkJHSU0u3pWUNwdN
 9n3LF6Eh4dfGG1z387j41opltvBRckzoCACQQb6V8Po/Zjd8ZvCHyqOM1Y8YuibmDU
 N2BYRjlsJzewg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z6ghDaWj
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/xilinx-prebuilt: simplify
 family logic
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

On 30/09/2025 14:58, Neal Frager via buildroot wrote:
> Currently, the xilinx-prebuilt package uses an if-then-else statement 
> for
> deciding which files need to be installed from the xilinx-prebuilt 
> repo. This
> works fine for now because there are really only two options, either 
> versal or
> zynqmp/kria.
> 
> Starting with the xilinx_v2025.2 release, the versal2 family along with 
> the
> vek385 board will be added to Buildroot and thus the xilinx-prebuilt 
> package
> as well. In the future, additional families will also probably be added 
> to
> this package.
> 
> To avoid creating a long if-then-else-then-else statement which will 
> only grow
> in complexity over time, simplify the logic of the xilinx-prebuilt 
> package by
> giving each xilinx family its own if statement. In the long term, this 
> will
> make the xilinx-prebuilt package easier to understand and maintain.
> 
> For this reason, this patch moves the zynqmp/kria families from the 
> "else"
> statement to having an if statement separate from the versal family.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
