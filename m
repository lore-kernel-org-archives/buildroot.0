Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EF3C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92AC960F56;
	Mon,  7 Jul 2025 17:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBQNEMQVdG7S; Mon,  7 Jul 2025 17:04:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF6B26123A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6B26123A;
	Mon,  7 Jul 2025 17:04:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E93D515F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA3FD60DE4
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WeqNKqX-rGu for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E4C960B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E4C960B6E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E4C960B6E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:04:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AC95213F8C6;
 Mon,  7 Jul 2025 19:04:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 19:04:17 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 19:04:17 +0200
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250707060509.617632-1-michael@amarulasolutions.com>
References: <20250707060509.617632-1-michael@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <83eaeb2bb828dbee6df88117947d6676@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751907861;
 bh=HPR5PjSDdZMao08z4QfRrcqs0FulhaC5+r7nbnDjULo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CgqhT75wMZd+56AeEzZvwtpaQh/WMTp22EhDmrYQpfdZKWQHdwK0MF2BP/hWKqBrR
 kvMAvtwEczU2Yo4wN5FN0ISHAKRGIq/s04/9Gs484qnYxrX5IP5alIukmTdnQB1idS
 eUhTu+WuNa+YAfjUsJd0og3RzZEignJn4HYJM6rdIeZfawBMlNSg0ptoMFo+4PcUo3
 zUF1RwkEQhz3Auju2WCGyzj4CkwIOCrOCynj0Rd/2QGGCTCaWmi62ydOzYemQXinjD
 ZnCVOMmh+tHoOtkf9F/g12MscO9VhoK1TCs28yfX34WBHKC4iafcZVPmPf3JYp/xNB
 YUs/iYAoGg6dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CgqhT75w
Subject: Re: [Buildroot] [PATCH] package/python-spidev: bump to version 3.7
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

On 07/07/2025 08:05, Michael Trimarchi wrote:
> This is just a minor upgrade for fixed deprecation warning
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Applied to master, thanks.

For info, I fixed the hash file spacing to resolve a check-package 
error.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/3c46549f890977a805ecbf460bb2f022f482feaa

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
