Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDACCAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 09:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5C384F19;
	Sat, 27 Sep 2025 09:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHPnj57ObMeA; Sat, 27 Sep 2025 09:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0694B84F03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0694B84F03;
	Sat, 27 Sep 2025 09:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B58A198
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 09:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 380BD4209C
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 09:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGsw5OYjS31w for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 09:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8AA742068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8AA742068
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8AA742068
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 09:07:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 37B665FFC0;
 Sat, 27 Sep 2025 11:07:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Sep 2025 11:07:20 +0200
MIME-Version: 1.0
Date: Sat, 27 Sep 2025 11:07:20 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250926213700.3341341-1-giulio.benetti@benettiengineering.com>
References: <20250926213700.3341341-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f133f133285ba3207a596e83284cf435@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758964041;
 bh=7zDid/Cq5y1kBtRpeXravlOYCRH0ADJ7e4ySLZI99ns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ncMxoG6woFoK0NDfddeHjiTJDt0uBA4VIYbzVxj1BPDcLxzJ0D/nPWxL8HNTBX+vU
 A9gSyceo4x8G77A+FcPO5G7Irtt+efrbam4AimDXQOnOTc2gk16EqOr2W28870p5Cv
 3TJAv06xPb35Sh1ZZcenxOkR5ESO1cJe3P/aUfkwqMNPfF5BZQndgjkKkUDCE16g6X
 mRtm4t4gEhbtQHMAOpjuaOAwNJUqbrnhyamWOXZmhAOrn09L3wYqd2RhDPEto2LTV0
 1gtdEpkT1E5Ygs9K80L8DUNooEVZ2AA8QK8usH04OjLgSik9nWAlS2f6SliWCDbWSQ
 hVE3IT58lGUMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ncMxoG6w
Subject: Re: [Buildroot] [PATCH] package/libblockdev: security bump to
 version 3.4.0
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

Hi Giulio,

On 26/09/2025 23:37, Giulio Benetti wrote:
> Release notes:
> https://github.com/storaged-project/libblockdev/blob/3.4.0/NEWS.rst

Is this really a security bump, as said in the commit title?
I can't find any direct reference of security fix in this release note.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
