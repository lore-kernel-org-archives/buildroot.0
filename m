Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A92C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 21:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A70781336;
	Mon, 24 Mar 2025 21:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6c9IU9rIw1Uv; Mon, 24 Mar 2025 21:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27C181C11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27C181C11;
	Mon, 24 Mar 2025 21:32:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D977BE0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C00C8401FE
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVoiRqOrUtjO for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 21:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37004400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37004400C1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37004400C1
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:32:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 13D6419F593;
 Mon, 24 Mar 2025 22:32:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47968])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 22:32:53 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 22:32:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190602.3336195-3-bernd@kuhls.net>
References: <20250323190602.3336195-1-bernd@kuhls.net>
 <20250323190602.3336195-3-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <f947a4d0333d0a32337d3f30bf28bf5e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742851975;
 bh=nCda1Vin8h+rRvMt9Eq5xrB5XBvFdqKZ1lyTNbmlzx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dF/Mgm9MN1jU6zW5M8A0c6iewnTsB+NEvqux1OB5Iylb+oSWvw7WPEXJlFuOHG876
 05WhN8KPjTlWo5kE0dxlBl5DK4cX6UG0PRIgifhOq79+H2lAMrqqwGrIeeuSAaIlJz
 fnVwy8zwaTxdx1WxQpRDqIGGzkMxGfjxLrSSEudqfizRa4cwNS4zWnsudrIFj9sVU2
 6hCO0QrMUyZA3bTyrK6QgEuxCeOo2hpvvrFkf4Gd7Ihep9wqiiNeiXeTyxiKKElweB
 xcgZVdeZQ7nzvxj68SI6xp+QcCxGYQ0uTcGKXfgx+wSs6nrNSSi1kzHfeU5oc4IzOf
 Xw0y3XcqUh2hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dF/Mgm9M
Subject: Re: [Buildroot] [PATCH] package/intel-mediadriver: bump version to
 25.1.4
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

On 23/03/2025 20:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
