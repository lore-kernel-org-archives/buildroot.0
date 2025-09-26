Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1669DCAC5BB
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 20:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D88624214A;
	Fri, 26 Sep 2025 20:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BY75C8mOGvl; Fri, 26 Sep 2025 20:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F23342153
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F23342153;
	Fri, 26 Sep 2025 20:13:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1036312D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 20:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0201F41F14
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 20:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HN2DaX9JQsh for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 20:13:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 487F1406FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 487F1406FF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 487F1406FF
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 20:13:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7F1EF2003C8;
 Fri, 26 Sep 2025 22:13:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 22:13:19 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 22:13:19 +0200
To: Dimitrios Siganos <dimitris@siganos.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20250926121208.2217060-1-dimitris@siganos.org>
References: <20250926121208.2217060-1-dimitris@siganos.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <2c44c6feace82c644f2015beea7bac8b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758917600;
 bh=Dm5bqs32QoXkK8mBCQzwCnFQsgijaF+1P/Rq9G7YZWI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N/Eh4PzBO8B4tWh1sEDebIbNiAfviSfxGhk9192FH/qt0MLab60hz9P5DJ/1FtqZa
 pZZbl7cWsri7Id06wJble++EdU5LVeZ6pEPY5+Toxn/itp6OdOwEO/Klc0/17nzHCU
 KqMpm5LK7IVIfW4IirqvW9CdqzUzNRHNkVkMIkeQcH3PQQBXWnZNV4CC4psqbaZsA6
 I+BGsQ1TJjHBQGmiAlxpbqXV7B4PwnAsIijP+/tlRLJ6E3Nnkv7JN0pVOhlVzIG8ne
 UQnUGkGCB51boZNrNOQqxCYvyuHJd6TZ24DlO1cRxsgGnXbXezq8mNHvwaAVJmbWtl
 NwuP3TZNk03dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N/Eh4PzB
Subject: Re: [Buildroot] [PATCH 1/1] bvi: new package
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

On 26/09/2025 14:12, Dimitrios Siganos wrote:
> A visual editor for binary files. Bvi allows the user to edit binary 
> files
> with a VI-like interface.
> 
> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
