Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B103FCCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 18:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 759F8405D6;
	Sun,  9 Nov 2025 18:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJv9lGw0znZI; Sun,  9 Nov 2025 18:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A49405DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A49405DA;
	Sun,  9 Nov 2025 18:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E6511CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 18:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34F68403C5
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 18:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2KBqP05Pv6e for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 18:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 567F0400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 567F0400F6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 567F0400F6
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 18:23:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5154C2003D6;
 Sun,  9 Nov 2025 19:23:24 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 19:23:24 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 19:23:24 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20251108110113.2813893-1-dario.binacchi@amarulasolutions.com>
References: <20251108110113.2813893-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7e9cb618b8133a5cd29547a1c448d80d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762712606;
 bh=pZmjXE8E+PnRvqnRSK/J9SbUqtzXPoFkfpofkEZkHpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iBhGoHHcgzvSAX1r/ajyRwLb016mcG/W9IPJAWgQTfuUyMxJDpj777ivMdMrQyv6I
 Fq3B3Q99SibcLlSVR57tVzQc9paGYUfyQM/05prE2sVqdPfT69/gGtUTrYTUg00MYn
 5K6CT84PZkimCH55STpoJtyse6oEsOofZGC6cdUXV2VyKU/0gDKRIS9KLBP4/E0Zl1
 HX5XLoIc8ClROWDxBnKrizzjZkU4uMU8Iwap9vbLu8jqooNwlDFF1pCyuAGl02QMGR
 LUYJem7YlktG4Xx1YDCWFgV/uFxUYqF0NEtmbOClSJhBnijwTLX7p+wK+FS4hO68LL
 gUe62bDswODHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iBhGoHHc
Subject: Re: [Buildroot] [PATCH 1/1] package/brotli: bump to version 1.2.0
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

On 08/11/2025 12:01, Dario Binacchi wrote:
> Release notes:
> https://github.com/google/brotli/releases/tag/v1.2.0
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
