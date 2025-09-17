Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29609CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F089F4053A;
	Wed, 17 Sep 2025 16:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlVWTTspY5y3; Wed, 17 Sep 2025 16:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 361AE40742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 361AE40742;
	Wed, 17 Sep 2025 16:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81936199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ECBF81CBA
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWwo1IZJkA5X for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C50C81C18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C50C81C18
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C50C81C18
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E919C20039E;
 Wed, 17 Sep 2025 18:54:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:54:38 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:54:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916014123.2601723-1-james.hilliard1@gmail.com>
References: <20250916014123.2601723-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <80122d988e231d79307a4d008b6b854d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758128080;
 bh=9b0oc95ByAZH68jrJcGA6Bw/JR+/OqGZZC5XuW0+VeU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fohZLTmqYEa/UH3RnF8TiAU5NOI3jEuhnj5XIpiEfJ5URKwFnThn8FhhwO1iMhNdO
 I/gSIj1KLzDOZRF+doC6csy883y4xFRe6nVXYTnuDxtsoNgXJhqjB4Us/+E1xpfXQe
 UaavAxjj5Knx17bnBLjU2DU0vTrQ7hsr2n8wOoDMWk7DUWXMhVqnQW/yVC9sF4XwZc
 vM4LWz8scCK7zyEeqG+xxDAQUEd7Z/DvoRIIsguyUdGN/u7aeLEQNUEE+SAg5+e6t7
 ITG/GcUfJYBVFvMSkPGZPbQh+cBk9kmfp54EwTf6bOvqeTXFHR8KNTO8TvObzEoBuY
 Z9xQqGIZ0stew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fohZLTmq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to
 version 1.3.0
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

On 16/09/2025 03:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
