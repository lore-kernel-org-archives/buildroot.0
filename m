Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE41C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E9983F60;
	Thu, 20 Mar 2025 22:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4B1BM4BX6bT; Thu, 20 Mar 2025 22:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 585C783F6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585C783F6C;
	Thu, 20 Mar 2025 22:18:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1614B12F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07D7860F07
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3dilbW3Xitn for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FF5B60F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FF5B60F06
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FF5B60F06
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:18:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2C806B0053E;
 Thu, 20 Mar 2025 23:18:10 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 23:18:10 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:18:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250317213621.3044672-1-james.hilliard1@gmail.com>
References: <20250317213621.3044672-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d7e47f1c48fee213ce918015071747ce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742509091;
 bh=p+uU+Z25irX4S6Y90/sh3ai82WiL+prqzqBhRhoXbmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mvSUD1y2ylJp7ePqwSme9naaGMCQgzuqhcUMpRa7bLOeldB4OqehIGeNk/Zvn7zxV
 0d7RUtFIoY9VSQ7WDzK2mXO68YWWao2HFw0aHUrqCDqb0LaMmfMoLcSS4y3jlWDBDh
 KBT3svihYjHxU7hPrHtLn5PYKJhh2mYPnxvgHQGX5p4OMzd/omKADYCwxhUDVbASbK
 N0KMgIwIBdTGqSJiM3eWq5AkCSY6Y/m4Q4GQfcnpX18K3mSh29Aix8YkiQWEDfjvh6
 H+CzncK3STfIj+Ttje5ngnZo8t0cCg2IQWL/BpZp6qBOV1nlFBKQtEETm1PGQMefAh
 fKjsnfyOgqyTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mvSUD1y2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump
 to version 2.6.1
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

On 17/03/2025 22:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
