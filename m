Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89EECCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C47660AD5;
	Tue,  7 Oct 2025 19:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taWdYVt3uZ0R; Tue,  7 Oct 2025 19:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22D960ACA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22D960ACA;
	Tue,  7 Oct 2025 19:56:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 908D29DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77087406EA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVQC_IrKgEed for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F94F406C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F94F406C3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F94F406C3
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:56:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 663C413F880;
 Tue,  7 Oct 2025 21:56:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Oct 2025 21:56:47 +0200
MIME-Version: 1.0
Date: Tue, 07 Oct 2025 21:56:47 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20251006164855.1886703-1-dario.binacchi@amarulasolutions.com>
References: <20251006164855.1886703-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7ce83af18c1de71591fd628df31d7c4c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759867010;
 bh=oPorYykcSEbbbJ9qxbqpZ+ZGe5KaZx6BMYIwJeoP7J8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CeFi6H9Yq7ouF8m0mGvfMfRt/1rcpe/2QwFyuyefAxR5QN2UnnsCRxfYxFTKlVSVW
 k9dzUwWEwJYjKVqK52DggsB377f4W8TiJlPHRSU/2ofTJCjZ1h1S0j4e3QguheVQf0
 PrLWL3mUfkVBsdJRJFRQ1Lyle3BHM8QxMITFmRm7tlGFpDpJQD90nyt19C4Az9nNNd
 VkfyLr30jVbDS80gPGBSey/9BYm3J+Y4wg9XLmpfoRbJ2e2lO5KEattt6nkVu9D0ZK
 Q7rrh6sRttJHg8J7rY4FVxfgog0MJ5QQLu01uGtIZABjn5yUjCcLuAH/D/1T3TZUxv
 f4k1f4pGpYdLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CeFi6H9Y
Subject: Re: [Buildroot] [PATCH 1/1] package/fping: bump to version 5.4
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

On 06/10/2025 18:48, Dario Binacchi wrote:
> Release notes:
> https://github.com/schweikert/fping/releases/tag/v5.3
> https://github.com/schweikert/fping/releases/tag/v5.4
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
