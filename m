Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51219CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 19:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4EC60B43;
	Thu, 18 Sep 2025 19:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFIQMVsV245f; Thu, 18 Sep 2025 19:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4870A60B13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4870A60B13;
	Thu, 18 Sep 2025 19:51:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 882E3273
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F70840215
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGAbxSKVRdX6 for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 19:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C21F340152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C21F340152
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C21F340152
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:51:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BCF222003C8;
 Thu, 18 Sep 2025 21:50:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 18 Sep 2025 21:50:59 +0200
MIME-Version: 1.0
Date: Thu, 18 Sep 2025 21:50:59 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250918161306.2539341-1-dario.binacchi@amarulasolutions.com>
References: <20250918161306.2539341-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <224ecf6d9df37b4238467921c06d46b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758225062;
 bh=CpdHIbE5DO/lF0OBDDtW1JAE2xROGOnIGcN4U7GVR/8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iqJiSpk8w7RUmvsYOs2XYyoNd/hscLyfymO3WFiQiU7/HSe/MonefK/tNQVz3zF7Q
 CCxaOi8COW+4UYFd81M5agMa+Vc2kbhwu7tRyhk0LRRMMiARdSQsOmr2+qJkYsO9Bp
 b8s2J1HjM7wJ+8Rf7UZkw0KG0wNraKYDQkYSx+3ZgFo7J0beCQwjsuNnYxopomsZfF
 u7RVJX+zd6aUAgtwK1H3U7j+IZCuWMM2UNpRySWjxJ4U7JcFlGz1LIWNH+4TtDyHwH
 d421QqKw/eruuUEVYtB/s6VNEGYQYMkYF50KUtpGC3dnyKnFvcExTzlZi+XM/UEdaZ
 AsmJO3BgcG6gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iqJiSpk8
Subject: Re: [Buildroot] [PATCH 1/1] package/aespipe: bump to version 2.4j
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

On 18/09/2025 18:13, Dario Binacchi wrote:
> aespipe-v2.4i     April 29 2025
>     - Added AES Crypto Extension opcodes for 64-bit arm64 on Linux.
>     - aes-armv8sca.S aes-armv8ce.S : add PAC/BTI branch protection
>       support. Patch from Emanuele Rocca <emanuele.rocca@arm.com>
> 
> aespipe-v2.4j     September 2 2025
>     - Added configure script autodetection for 32-bit ARM -marm compile
>       flag. This option is needed with some compilers that default to
>       generating code in Thumb mode.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
