Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF3EC71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 21:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5541241910;
	Mon,  7 Jul 2025 21:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfMce9kiIPcW; Mon,  7 Jul 2025 21:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A3941912
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A3941912;
	Mon,  7 Jul 2025 21:07:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A6515F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6B9060EF5
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlmzxfD8oVR1 for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 21:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEE7261251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEE7261251
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEE7261251
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:07:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5CBAEB0054E;
 Mon,  7 Jul 2025 23:07:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 23:07:25 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 23:07:25 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250707140648.279009-1-fiona.klute@gmx.de>
References: <20250707140648.279009-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c2d0076cf4c3e429a1618e843827466@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751922447;
 bh=IH2gyPTLhU6ZrrlDorPdiy/4RSVrZCG+g5tD7amULL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fd4vFSxL5dJYbym66dsiOJTyKx0Tm1588caOifH7ra2ovN267aZw5puUjcIGe2hb2
 pxoRKCN4l/X9sNr9coXZAUwIJUcgB6BZNaenYXaAgGOFfqSmT7tGjyzz8Ez714LLhj
 1IJcqMAB7mJ8OEl8dLC9UIamashYNX+5sf1QcULnOFB7sRysncQ6dfnlmOjk9Pmghw
 3LJ0J/Jn4s0mNTRq7q2TJK6tfirFN6K+PupdiepM//LzFY5djcZVEqN1ukXiuadqyo
 RlqKRvwqA+UpHSUpEldK5mweIIhHEIVSwhb6o2uZN1BhUhfsyIKjtf610w/mYsIgW3
 0PsMHhMF4ImzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fd4vFSxL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/genimage: bump version to 19
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

On 07/07/2025 16:06, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This adds support for btrfs partition images, among other things. The
> COPYING file changed because FSF postal address has been replaced with
> URL [1].
> 
> Upstream changelog: 
> https://github.com/pengutronix/genimage/releases/tag/v19
> 
> [1] 
> https://github.com/pengutronix/genimage/commit/0909434ea5e3e927b4dd512d7e03ea919da12f8d
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
