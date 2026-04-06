Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C09F46C4E
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 17:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06FD960ADA;
	Mon,  6 Apr 2026 17:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjgBtVg8fDdL; Mon,  6 Apr 2026 17:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36CD660AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775495391;
	bh=gdTAhFKKZ/t7H4dakPIYLTjgUh8mYb1og87bBx0qboI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=URPfE0g8fFd+Er49NhgXfwmN/sGi2jH37Z63NFo9z/f7RTX7gS3oz4nDpj3UPmN5C
	 jejr47I9gbqoKzAcBplAgMYYV12La8jJo0n8X7E2WcWshmXA7qpzQPQCtL2vDK719K
	 oTJLFuDT+0gSkAiS5HrJf6GuMpiJ8bpEdBIsttNxFohn4skQIsqriGITEJH66ZM8I8
	 Uam+sGFe8KDcAu7KOb+8bUq21E20i3FybL7KfVP4pOqRqnGeEFwO7px5jn4vEBtwdu
	 YP8+DQ7gmUzyLcG1s5pnhv2u9FEIfcw/gNHpQ4NtcX6ErmsnjkRsPmjd+99cGI5rwK
	 BmBl7U8Ln1PzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CD660AD3;
	Mon,  6 Apr 2026 17:09:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 691CF2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E3F2405A9
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgBsWaeo9q_A for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 17:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2805740126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2805740126
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2805740126
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:09:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E4C96780502;
 Mon,  6 Apr 2026 19:09:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 19:09:44 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 19:09:44 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260406075012.3450533-1-dario.binacchi@amarulasolutions.com>
References: <20260406075012.3450533-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <3b86942871f06a5765310306ab78d8ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775495387;
 bh=MqWz7n0Fouz5vaviKYqLwo2oCKtjbbHKlaoX8j/I/W0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r7kfCSpWVKFfZMJKN0hgfx48jjTAlTOMMUdcszIxzzUI0lMXH1DGYlDt/6w3uqJk8
 sg+5fGeZ1gr4Xvw+mz4+LVumd4aBUreKb8T5mH861XeFjBeXwlMfpOv5Jq6e1uD4m6
 k+oW7+5Zd6W8r6IKKGn5JdhtXg9Ttet1GZIJM4YuRWdCRu0GKNR4hRLVO8UoLzlUhW
 oXQp5KvV0ddoGMZiQYMQVg4tlnlMqMheUCpAcgD+V9SaHfCNa9Tos+vZI1qo7H6U01
 MwgiK720oD3ohdOTdI6LHNsFJsmdSdTYEop3w5YBfem3sH5xl1Kz3Q+HuTXS755CHQ
 hrpm73MDviFuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r7kfCSpW
Subject: Re: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.8
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

On 06/04/2026 09:50, Dario Binacchi wrote:
> The LICENSE sha256 changed because of a date update (2025 -> 2026),
> not due to any substantive license modification.
> 
> Release notes:
> https://github.com/pocketpy/pocketpy/releases/tag/v2.1.8
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
