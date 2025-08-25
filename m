Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1900DCA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 22:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC296F61E;
	Mon, 25 Aug 2025 22:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uY_jEj6ujw8D; Mon, 25 Aug 2025 22:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8136F61B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8136F61B;
	Mon, 25 Aug 2025 22:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 596E1CD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 566C8419D6
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHEytAI6FkdO for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 22:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82FB2412D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82FB2412D9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82FB2412D9
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:49:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 81CB62003A4;
 Tue, 26 Aug 2025 00:49:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Aug 2025 00:49:03 +0200
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 00:49:03 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250825215924.480927-2-giulio.benetti@benettiengineering.com>
References: <20250825215924.480927-1-giulio.benetti@benettiengineering.com>
 <20250825215924.480927-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2860204d11088cb58a2117d798a3c4c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756162144;
 bh=Xg1y277EM9caXuUznXYuLe37lXN6FgyeCwfwpjnU+e8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tlUUQt0LXfvlummJSkoIMrvJ0hvC7y7ojlmLpAduu7G1bBkNbVVniUi/hrQeJzzxT
 NMhGKaQ4/wjIPm7+gr04Y9UzYnm9HsW85G2OGSzdvQbBV32l7mvluDufH8oCzOURKN
 2wF3vRTM80g1+pOyn6x7c0pxkx1GTEV+tuXIJZafJiavWs7oKd3HxXJgFsX2OBs2QS
 mOvgvM2bfp0JQLB4gBm/9Ht9ZzvDWc/6GneEDgDqCa+cUX4DjuPzQgA4/YoEg2haSV
 wzCu70lgSAEgBvZ+WAGkcufj7Jd+yN0HVfY/oJe6rAD2RPEviUY9umjfGX8Ao5BOQm
 FFHcQzFxFsM/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tlUUQt0L
Subject: Re: [Buildroot] [for-next] package/cryptsetup: bump version to 2.8.1
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

On 25/08/2025 23:59, Giulio Benetti wrote:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.1/docs/v2.8.1-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
