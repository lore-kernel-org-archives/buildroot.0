Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C10C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E44E980EC3;
	Wed,  9 Jul 2025 19:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQMw9z-wim6q; Wed,  9 Jul 2025 19:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D11480DB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D11480DB6;
	Wed,  9 Jul 2025 19:30:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FCB12E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1AD3405B6
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xwnCQmqYlOg for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:30:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3616C404A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3616C404A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3616C404A9
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:30:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8C28613F8B9;
 Wed,  9 Jul 2025 21:30:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Jul 2025 21:30:23 +0200
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 21:30:23 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250707211625.3673431-2-giulio.benetti@benettiengineering.com>
References: <20250707211625.3673431-1-giulio.benetti@benettiengineering.com>
 <20250707211625.3673431-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <72d9b099125f4303c090cf93e7185b22@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752089424;
 bh=JsWofaZxGhRf3u6ZtRI8nsZ6GmE+qT+Eg9s8u5XQoHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RXHYw2LNGeVkHe1BWMIh8MnjtFFXITETxvz8kk4dHxh2HyzGqXEcCG8cKGXWKPzOo
 TIzg2iDd+5paMz0nVxygT+Nnww412vtBjIXshp4VrzdlEncupm/xAaabAYrHpytEw4
 t/5KEaBUqIuUN4aZfszfaSwARSW+m/M4AsA4acd4jT4j39PXNOGCb0dBFolTV/TbDH
 Cu7/TgIBXOjJk3BL8eQvkyN/fBKVeQ1EZMp1T6i4aUhJGAowAt0OxoW90T3IsC0MdH
 aQiwvbPz9AEjwUcw7BBNqs81qu/YI1xdGu5552gninqjAwBt3J+r9QAEyUWZrtPqYV
 c4iQ9/0OWH1PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RXHYw2LN
Subject: Re: [Buildroot] [PATCH] package/liblo: bump to version 0.32
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

On 07/07/2025 23:16, Giulio Benetti wrote:
> * Drop upstreamed local patch
> * Add local patch pending upstream to fix build failure as static
>   library
> * Re-enable ipv6 support since it's been fixed upstream[1]
> 
> Release notes:
> https://liblo.sourceforge.net/NEWS.html
> 
> [1]:
> https://sourceforge.net/p/liblo/git/ci/968dff4d576ca102525c81beddb36a623890424b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
