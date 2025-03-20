Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F485C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB0383280;
	Thu, 20 Mar 2025 22:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnBvZXEvCyPP; Thu, 20 Mar 2025 22:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AED79836F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED79836F0;
	Thu, 20 Mar 2025 22:17:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 444441A9
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AD5641DA5
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmSBOoahvA85 for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:17:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D8304057F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D8304057F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D8304057F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:17:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 20703780333;
 Thu, 20 Mar 2025 23:17:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 23:17:21 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:17:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250317190808.2996241-1-james.hilliard1@gmail.com>
References: <20250317190808.2996241-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <81cf576359a06e5ebd2aeedbbf62b9c9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742509043;
 bh=So90Datb9IZka1eV0eRnzZVQG+TzFrVedXhsCYDfWos=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OFv62O4SSClUt+wr7V9Wb/BvxV7Nkxjk5aqZq5EjahTcy6y2rCfo2Vef46tqoWerW
 7HanocYzF5JdcYz9iR+23Gd/GxaD/NOG4LqKaKj/h1A2LLd1PMTtExeQ41am9WG13b
 dBfv1M8gwZVdRFWCKqOEukETj9/1zby021ojwg9lkBW7XjXxnP+TDVcqzrYkj3MqgM
 9rB9pDegvX1ptECXQ7qiOapNDgePfNHb+qPDXtkai/DolTbipzP1H7a7As7KTJBAgl
 kHt24Ud33069LNcWysUj25IbVtH1RG7GHDqeOedRocCsFjdolxiOSoCI4vMEv57Ijl
 BasCAW/4//klw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OFv62O4S
Subject: Re: [Buildroot] [PATCH 1/1] package/python-simple-pid: new package
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

On 17/03/2025 20:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
