Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375D8C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E41E4606E6;
	Fri, 20 Jun 2025 16:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPB_y1w6XmNE; Fri, 20 Jun 2025 16:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 334D860740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 334D860740;
	Fri, 20 Jun 2025 16:33:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE812C8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D47F360740
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmAc4xS2Z9N0 for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:33:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06694606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06694606E6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06694606E6
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:33:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E00425FFAA;
 Fri, 20 Jun 2025 18:33:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 18:33:25 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 18:33:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
References: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <83c3dbed9873dcdfd15a8c5271fbd9ac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750437208;
 bh=dGQTCsEn3+ebVtyhZs9F1aefocwXly8M8+dib0EwmeU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ko2PQxujMuMz1ONiZVQeav9cNHb4//ksuhubfwRzekQZoyKNgtBhAaFkhvHeoIiuU
 nT9oRJBxCrN0999Dq3IN+V2Um66IGemwyFhcPcUd+fW03SETbKeI0wBKpqPle5Tm9G
 TXkn7bTVNn4kUQ85BadvrIWIhCKtjXOefoWWo7yL+gvR5v7a/NLpdidKVK/MmTjA00
 zpIMjfVtiWMlaWpcofdi1k38oQ0mW/467ciPpww/ptAsBeeeA9tzC1TW5lgGxzGWZ5
 MDKl2cVjDs0fIHGF7rd6EPRjEUs3iwoeRF5tvhLAPf8XT9b6YfPrT8igsCPGcBJ69m
 ZnQn/7q6xxE+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ko2PQxuj
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.113
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

On 19/06/2025 21:51, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_113.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
