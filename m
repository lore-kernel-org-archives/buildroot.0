Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2037FC282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 22:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A946E42448;
	Fri, 14 Mar 2025 22:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytDzTsIh4qDO; Fri, 14 Mar 2025 22:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B67442445
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B67442445;
	Fri, 14 Mar 2025 22:25:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B0CF61
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 22:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F362D61130
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 22:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87vYAvvwigsP for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 22:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4BDC607DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4BDC607DD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4BDC607DD
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 22:25:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2E4762003C6;
 Fri, 14 Mar 2025 23:24:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 14 Mar 2025 23:24:58 +0100
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 23:24:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250311112509.2245199-1-fiona.klute@gmx.de>
References: <20250311112509.2245199-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <4364dadc3db11eafdcf67f0bd1942ab7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741991100;
 bh=IJ/yCsZu7SwZX6FB7qK9ss1VenyZdvTMkRGNybsIAwI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l1PZwjkwb9Nljo8g9dPNwrFVcRHXRvvaCwRw7OOzuKUTa5myplH97fghZ29uDxAG4
 IDzOxP/Hcj8TA9gEYi1bajRWY+SGtwUALZ/EXwUkPJKnQyS3BvkuCfOd4S3uArOx45
 hFX9ra1MLKE/Ybnanr95nEAuzC/mp/J/MQw8zGCXjwJ2K9vLb+tu2cY92uvXduplL0
 xExBQBv/G3vacX97WcAAge3NJiF0TZAyhpoCto42dfi5AQjLqSyjKc5uXsI7my386g
 r1XczjmAqttj7DRripVOQlqAqdvPb7g6zwCMzeNi9kEwXjpXy7lm5oKlTpe/3cbY7A
 U8JaOszxz6A7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l1PZwjkw
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.84.0
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

On 11/03/2025 12:25, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog:
> https://gitlab.gnome.org/GNOME/glib/-/blob/main/NEWS?ref_type=heads
> 
> Note that upstream is planning to require C11 starting with 2.85.x,
> and encourages people who would have problems with that to file
> issues: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4473
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
