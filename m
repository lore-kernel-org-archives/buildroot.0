Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58483E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 263F1606CF;
	Sat, 11 Jan 2025 18:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RL39PVTXdPmn; Sat, 11 Jan 2025 18:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5082460708
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5082460708;
	Sat, 11 Jan 2025 18:00:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FD2B942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01879606F4
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvJ3JHoEk8_B for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:00:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51CCA606CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51CCA606CF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51CCA606CF
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:00:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 79ABE780383;
 Sat, 11 Jan 2025 19:00:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 19:00:02 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 19:00:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111160721.2864837-1-james.hilliard1@gmail.com>
References: <20250111160721.2864837-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <215a0574ed56e6cdc2d31b00594f6134@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618403;
 bh=SQZhCIybyZbb7BTHE/vdCPozCz5n2P1rPiR2lnbfa4o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ncC4Q5owKhAVpFGDBhOMNFSyC64S8d+tNJAxHYicKJuTHC6bNooM1o0Xud/ZRT0G5
 9jrVqnNw9m/FCBA1oiF9aon+WWYl6lCFlzkiIcr+dPY/rS0m2+N0AOx1LHcFJHKFW1
 G6HIiHNpDvfpNDJVf7WTnRs2GbCvM0cCpfOw+a7z8twq82wN5Pw18ngukXvo9sBosV
 tZOnseU3e3P9T06ZgspW8GvUmk65BI2MnWsNlTcjvjE/RrDKQ+No8hpz7NcwiyEhWc
 CEhoUzKgtDZr18HgbVGmkWBqlapc6TItoZmOkbQP3JdIecd5b+YK3KrhEJfOwTPxg4
 hysxF+aP9eHoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ncC4Q5ow
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.5.0
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

On 11/01/2025 17:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
