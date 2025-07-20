Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCC8C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E21241045;
	Sun, 20 Jul 2025 21:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LfkHQjx_2kx; Sun, 20 Jul 2025 21:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E77794101C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E77794101C;
	Sun, 20 Jul 2025 21:34:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B67391F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A854C408F0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtZIT6Rj31IL for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01CFC4079E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01CFC4079E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01CFC4079E
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:34:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E0B1A5FFBA;
 Sun, 20 Jul 2025 23:34:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 23:34:37 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 23:34:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250720191401.3214602-1-james.hilliard1@gmail.com>
References: <20250720191401.3214602-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b40a4f7c1da3efa61a406d94b474af23@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753047279;
 bh=AXsULsFDH/0j2Nut3IxjCaWcCktlNy1TX/oQoh2TU54=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rGFoVnZF2QBAKzu4zMM88Nprz/G0XrlydKtDuKZUaPYKRbcJ65wQhH33rRijN/+a1
 pdO1xkav1QO4kg2CzXck5UzygshkhrJAjdKNMLu9/RjGe67m3ugpCdaneXLR8yz2+b
 aNO1Pcd7RZNrlUEh26eLojQQNzqMGMMNrdJIKik/BYENCeBavlIUXAMylAgHvmQ+vE
 bMrdEE2taOdGXBay5wKIDqCczZOuv1aj8G6rUt1F+zbco7/4WbzD5Mda3FGO6tgQJU
 /5wl6b4qE9OicohZGDGsXRyiXCAx0jp54OqcgD6y+V6cIOJFj/PLXCi3xUnqh4gT6u
 YlQNqtIhhFyPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rGFoVnZF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-cors: bump to
 verison 0.8.1
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

On 20/07/2025 21:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

While trying to build this package, I noticed one of its dependency
was failing to build. python-aiohttp-cors needs python-aiohttp, which
needs python-propcache which fails to build with error:

     ERROR Missing dependencies:
	    Cython~=3.0.0; python_version >= "3.12"

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
