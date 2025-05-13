Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE55C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4029C60FF0;
	Tue, 13 May 2025 21:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8W31nloaloj; Tue, 13 May 2025 21:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E4560FEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83E4560FEA;
	Tue, 13 May 2025 21:44:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52091150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3819740135
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwqlCobi02iA for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70FB940288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70FB940288
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70FB940288
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:44:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 95DBC13F880;
 Tue, 13 May 2025 23:44:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 23:44:46 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 23:44:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250512211344.721883-4-buildroot@bubu1.eu>
References: <20250512211344.721883-1-buildroot@bubu1.eu>
 <20250512211344.721883-4-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <a36f437e818557867a70d0058e7a0407@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747172688;
 bh=MZjq7SVltOeYlRFQ1Bk0ivYBswCi+og/S5TJDN7K4fo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wu6ed8YQkjeFGa/OyZNf1jqJVuDoVc8ivNqmK3bWpEVy4mflNrN8HMNVVgUKbkvzv
 VAYP69d77RnXCM5lTIX5zPvs3KFczAQBzCfTn3UEAHSHKKaSp5UqVLqlRnd8Kw/54A
 bC0AENUfM1jZNVGsB+7gjq7RLhxaNOI9lR1w3FDJptGXYOHYc2Utq6iRnyCEI/NOld
 ul7wsTsI+onXUDMnGlfLKF1rvY9uKv/jjyveGY5qRcIYVSpfAVsbwpBO2VZGewXlUC
 7B51p0UiOvsVGK0SCDhwHOHcNt3aMYGN56bH0eHERGBipTJuajwMRNR4CXMxcsgtHk
 ITuUfm1CVBVcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Wu6ed8YQ
Subject: Re: [Buildroot] [PATCH 4/7] package/python-python-core: bump to
 2.34.1
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

Hi Marcus,

There is a typo in the commit title:

"python-python-core" should be "python-pydantic-core"

On 12/05/2025 23:13, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-pydantic-core/Config.in                 | 3 ++-
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)

Could you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
