Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B683C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 19:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03C540275;
	Tue,  1 Apr 2025 19:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FSKe97_HG5R; Tue,  1 Apr 2025 19:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F067404B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F067404B6;
	Tue,  1 Apr 2025 19:17:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1835817E
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0E1641B17
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpHiL7lEe58o for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 19:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C0D44195B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0D44195B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C0D44195B
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:17:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9C6275FFB7;
 Tue,  1 Apr 2025 21:17:28 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58564])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Apr 2025 21:17:28 +0200
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 21:17:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250401162109.4027248-1-dario.binacchi@amarulasolutions.com>
References: <20250401162109.4027248-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8b3d4101d66c4c5e71999b6ce29334c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743535050;
 bh=jjzzUr7L6aAiiZinPspi9kuL4vVxomo5K2jiri1DKZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a7h+LXJUwjv/TpGhu+U9qDwylFU06rILy0eWHko/5m/tJSNXPhYmx0y3eSntGQ8KM
 ekhjQcVBcwWh8gXTRlbZRV9taoNABZa/tQufuBS0OZ3tZ2pTk46oOzv5kS+UlCaJSd
 H225lIT32lmG+fXB/DCoWvzRjvo9ydI2/gP8qw39j1opSxwUoeuO2zIRZS5DFGz4We
 24HsyvcguRkCQ7DRdtLs/SZQ76W+ZxfZ4QrIJTPDDgIPVZj+FjXQbYrX2hsALZiHlO
 nSiGFJ7AmHXBx1RloulKb4e5oIKBKQPRnUPks5dahpjg5jmwc8hpmE9YtPiXfeOyuW
 zolzgHXzQjI5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=a7h+LXJU
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 14.4.1
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

On 01/04/2025 18:21, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
