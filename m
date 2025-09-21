Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212BDCAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 11:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB7E941853;
	Sun, 21 Sep 2025 11:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7q85bNJw-Yc; Sun, 21 Sep 2025 11:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6464441841
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6464441841;
	Sun, 21 Sep 2025 11:05:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF34D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD163812ED
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCtYJZY2snVF for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 11:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E58F8812DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E58F8812DC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E58F8812DC
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:05:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2EC4F2003C1;
 Sun, 21 Sep 2025 13:05:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Sep 2025 13:05:41 +0200
MIME-Version: 1.0
Date: Sun, 21 Sep 2025 13:05:41 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>, linux-amarula@amarulasolutions.com
In-Reply-To: <20250921100352.2620720-1-dario.binacchi@amarulasolutions.com>
References: <20250921100352.2620720-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <267cae1e0781f662fb0dfd737c05fa9a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758452744;
 bh=3hAKDQt/2bwYoGe2SfvUfPHAA7BKmTi1/FihWNp/taY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MLE/WZSnP2fUbydO9jQAIGip6DxQ4L9nq4rMjxSvQavelWUi7cIQFV41k0xsibPCN
 Z8ASbmjEu+6YBk8cbuzQhKwQlRLSyINFQlztWQIIFQTPcUrpUgmX7s7bcPGKNQK+5k
 WrA3QdgjCq6I8EchaJAzZCVxLgFJjAxwE3zdXQ0u9SyWHBEPF3E6exXLLuPCvzzFSh
 lyf+RT7Q/2gSVQZnVnfcaZBk2i6bkhmIQe6LbClDQHG351fsaOlNzYccBYQcyqd1Re
 duvgGfbYKFERm9in/Z2eD4maxOq2SBmPLXC3ESTeKhA/P3RvEPQxFQwvo7ZZzAud6Z
 ZLKjgnqtkpErw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MLE/WZSn
Subject: Re: [Buildroot] [PATCH v2 1/2] package/atop: bump to version 2.11.1
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

On 21/09/2025 12:03, Dario Binacchi wrote:
> This bump includes the security fix for CVE-2025-31160.
> 
> Release notes:
> https://www.atoptool.nl/downloadatop.php
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
