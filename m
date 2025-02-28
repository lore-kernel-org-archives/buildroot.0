Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5D8C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F010D84AA9;
	Fri, 28 Feb 2025 23:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qy3ngeMrC8G8; Fri, 28 Feb 2025 23:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E68F484AC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68F484AC3;
	Fri, 28 Feb 2025 23:07:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02EEE791
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E615484AA9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Lhp5lKs0kPq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F192E84A94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F192E84A94
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F192E84A94
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:07:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CD1A25FFAA;
 Sat,  1 Mar 2025 00:07:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:07:20 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:07:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217113040.1870301-1-james.hilliard1@gmail.com>
References: <20250217113040.1870301-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7a89445e7fcee9c50139fe71ce4fe8b9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740784041;
 bh=6R4QBChul6S1P6X43HXV0I26enyCVztZsqMas/+isNM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Aa6w6xzXgWAVvZpkV/XuEiDcFwz6KLoDgsNzsHXFH9ppUSTJEhnfj/48XwfLnxGtI
 9C2Ysjm1bm1GXq7a2VYK+Ua8ndxjVZSTWAv1lfFWl+V+4JhPyV5MmVkgx31JsseB4y
 pWmtGxMJcYGU7tfsWR+SX/ezP+XP8pgKK5/7rVq3ajZVOJQDJtOihZ315eqN+6djOs
 OB3iF2PJSi22LigaTeJIsVI+gB7OISa+DwLfIJ5jkemjaKQg000RLQ+wmFoImLmiGb
 QBR1MkYgoYIt14/JXlf5CVeX+EjqJpssktv875Tn7YFcwIdTd4fSOofGSdQ1+9dzzI
 6Annri+I8RWaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Aa6w6xzX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.29.0
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

On 17/02/2025 12:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
