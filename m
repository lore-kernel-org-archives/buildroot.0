Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607ADCAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 15:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 198934061B;
	Sun, 28 Sep 2025 15:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgB0PQonbtiC; Sun, 28 Sep 2025 15:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0665C405B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0665C405B5;
	Sun, 28 Sep 2025 15:15:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 767F9111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FBF80447
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MB_kXeSlTQn5 for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 15:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82A9180446
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A9180446
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82A9180446
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:15:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 750A7780383;
 Sun, 28 Sep 2025 17:15:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 17:15:09 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 17:15:09 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, Andrey
 Yurovsky <yurovsky@gmail.com>
In-Reply-To: <20250828085412.1278996-1-peter@korsgaard.com>
References: <20250828085412.1278996-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f11c4161ca5f0598331bfa83b3a3107e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759072512;
 bh=+VlID5C8NaklEty6iv93L/ECNCVMagk63Lj+BAt66MI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B4CCvKePg5dvkR7MHDcbdDabHZp+F5o3GZI/iAzpHP3JRjUoVHUmL0XCjEnH6WILG
 hW+7ZYXayMuQs9OOumDfw+ZRvXdc8anOPtyZEdV8RZe2XO/LmZuhEcF/U2CGGd/F72
 TmPgnP7gFbbgNjAbWlSrRHQa2miFdGcV6Wiuhz3FJfLkioDxtcLPl7zAB6p6/QEHV6
 AkQG0fa3Q5aKOrZpvO+sCP1ZIrNiBsXSpIN7lnH6SYXF7rDhNbZ1Y5yYbLdvA6QZ0+
 0+tYv13sPe5Oxeh56tN/faubEGjofZ+2FKdwIIO7hlJzN8LGU0/E8W8j+TJmzIuja6
 iyL9aXSdbdgYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B4CCvKeP
Subject: Re: [Buildroot] [PATCH-NEXT] package/rauc: drop uboot-tools select
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

On 28/08/2025 10:54, Peter Korsgaard wrote:
> Users may be building U-Boot outside Buildroot or Build U-Boot but not 
> use
> the rauc u-boot bootloader backend (E.G. as using the U-Boot 
> environment is
> tricky in secure boot setups) - So replace the selects by a note in the 
> help
> text.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
