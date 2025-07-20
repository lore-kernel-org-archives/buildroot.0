Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFD8C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 11:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB5481E54;
	Sun, 20 Jul 2025 11:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tcsjH_F2fbc; Sun, 20 Jul 2025 11:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4CC381E1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4CC381E1D;
	Sun, 20 Jul 2025 11:27:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EA0D117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80F0B4098B
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCcqtacXIhRv for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 11:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E72C24065B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E72C24065B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E72C24065B
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:27:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2A2BF7803A2;
 Sun, 20 Jul 2025 13:27:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 13:27:03 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 13:27:03 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250618133621.3047127-1-neal.frager@amd.com>
References: <20250618133621.3047127-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <be958af4624d2e0080309f9a986bdac8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753010832;
 bh=dHF9yEgebKCFq18vXu8T6ER07IBIWxu0TUX6M1l/FoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y38mWiCffoWC1otdwpt8CZvuPMQO5/A2B0aU65lcUnHnMDYPhMH+hHy5kKu71vL5d
 awSZckuEhviCuN2JOYUMEPlB9rdDz0H2yM6GNUNpkm4l3+4V0tfvDR/AQXyVqOJehi
 irxWpGbLm6S7J65i2KS3jo/ADvtZ8ZqdBOqN5NWHYBdrqqBPfrHmAF5XBKDqVEjreH
 okSP4gnL2abb1sL+4IEFgZEwuvcug1N+v6Q1cWFfhA7PNeVCRvBpUClx6itiF03e+s
 n8yn8TPCB0F88xtubPziki7B4EZldj09L5qG8QtRkpBzKKFn/rGHkxC+ykwq7+7iJp
 WRE0Yg9ekEIFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y38mWiCf
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: update custom board
 documentation
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

On 18/06/2025 15:36, Neal Frager via buildroot wrote:
> Update the zynqmp readme.txt file to use 
> BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
> option for configuring custom zynqmp boards with Buildroot.  There is 
> no need
> for any custom / manual steps since the support is included with 
> Buildroot.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
