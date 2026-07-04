Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35957C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 19:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D10740908;
	Sat,  4 Jul 2026 19:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLdIQH-n6QT9; Sat,  4 Jul 2026 19:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D95408F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783192661;
	bh=HkPOao2hv42lmAnwKHr9vPF4aZxOwnm2beMyUtOxhiw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CUBb00GQqEG4TE+dhnRT1BDZroOj5utgE+3Avmqtt0PJrSUGEa1hFCSiHOV6KItdf
	 CgvWlyiJEKH8hQQTfAQ3kz5qIEepUXshOZUb6URlJpt4ZfbKyOo4lENkccyqnw9x6w
	 t+xOAaJI7hX1zA4LkQL6vDdzONqLcm23smYGhzM4BTC052RYK5xF/WNpI1MwensGnH
	 cPU5MjBHVNiYxzJzeCenkXt9t3E0adn0JAOzQm68vYS3A9QTRPJjZi/Md2iAHxLlze
	 CAIpjEAh8NxCUhNMV7anHAnuO9ObiZsxgIxRfT5eP74uZLbeoT3lYaTVTfOl3/+XCb
	 q5stL0XHruunw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D95408F7;
	Sat,  4 Jul 2026 19:17:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3B2A363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA43340144
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd_t__03rStI for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 19:17:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D4CF40143
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D4CF40143
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D4CF40143
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:17:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D148C19F57E;
 Sat,  4 Jul 2026 21:17:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 21:17:35 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 21:17:35 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260622185736.1439823-1-giulio.benetti@benettiengineering.com>
References: <20260622185736.1439823-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <472bbf8f592d025ff017c61da180139d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783192657;
 bh=IYwXcYPeldI1T/g0Fb6EUGdczY0g7IPlGi0cdB6gzVo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pdj54OU0M4zQyR/4Cpk+5qQEbinbi8/iS3lsBzFRYIMdLUoOQVHWSxtnX+xEkvpDk
 8iIl3EHD6yZOB7xICHzjjwudSz1KuimOg5+RjKJLR7nlbAVmiZfp9AbiJ4NN0kdhu6
 oPoxcWQy2CzyfmUElxqeiq2PwFTKXN50vxNL+0LaS+fphLS/NCyf8AKrovwfk73nLf
 GHuBYGpOkyW3ZlQ+WCsg2P/6t72Xwk8bgw8Mc3EiofOnkRZBpj7bx268KIbwmE1TJ2
 7W6tAIYipKvywX1WC2YE7G+9T24hHsuC9hP/V5kumfQd/ZQQA3hJsQ956bOFLgipgZ
 J4glRGwEBgEAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pdj54OU0
Subject: Re: [Buildroot] [PATCH] package/liblo: bump to version 0.36
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

On 22/06/2026 20:57, Giulio Benetti wrote:
> Release Notes:
> https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
