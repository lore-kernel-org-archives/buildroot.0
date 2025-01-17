Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B48C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 18:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE710605E7;
	Fri, 17 Jan 2025 18:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKdlcKp8shAD; Fri, 17 Jan 2025 18:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB2C660625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB2C660625;
	Fri, 17 Jan 2025 18:33:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA658B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 18:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4F8F408C4
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 18:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxq5yT6Dudxf for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 18:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B04E4089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B04E4089E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B04E4089E
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 18:33:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6EE50B00548;
 Fri, 17 Jan 2025 19:33:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33056])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jan 2025 19:33:25 +0100
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 19:33:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250117073243.761456-1-neal.frager@amd.com>
References: <20250117073243.761456-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <76b1dd6adfdaa57a4f52821729c961c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737138812;
 bh=NFbJeRre+gE7D0IOrZ1+y+wqYW/57gJcQY3gGAqkjiA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m8Y8OvvcmpSQR1V4Lqej6YK0EFgli+yOXv6P8Gyc+DmshHtJxvEYFxvevodFHS3vU
 mxmxFp0cBIusW8yl/0kB2+AhTQmp44oRU4GooFHeVRMzhbA+jEToPMoV6JOC0gcOmI
 emn91XDGbSc/JX6Dywedtns3mTHq7sDsVa82OTFPsRN0bbGvel/fD7StCJ1S/oytrF
 SFkj9U9n+ANqrfHb1gnrXQx96ZB1iVh3kbHDnIFysPpFQ9kEJrGQV3RM+w3jfy57j7
 U34x72/jbP8Tv5bJpG9UXqH+xZgNva8wiF7TDsZ9GA+/ugJpK8odcms1pLW9HN2MtC
 szYuS86zZLBwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m8Y8Ovvc
Subject: Re: [Buildroot] [PATCH v1 1/1] board/xilinx: remove Linux 2024.2
 hash
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

On 17/01/2025 08:32, Neal Frager via buildroot wrote:
> Now that all of the Xilinx boards have been bumped to Linux 6.6.60, the
> Linux 2024.2 (6.6.40) hash can be removed.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
