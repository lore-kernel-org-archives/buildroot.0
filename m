Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0379FCCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0F2360852;
	Sun,  9 Nov 2025 17:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-P3iriq0r6z; Sun,  9 Nov 2025 17:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E35656084F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E35656084F;
	Sun,  9 Nov 2025 17:48:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DA825D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2CC76084F
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KGrqCv9J5mk for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 320DD607D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 320DD607D2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 320DD607D2
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:48:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7012A13F88F;
 Sun,  9 Nov 2025 18:48:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 18:48:21 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 18:48:21 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251108105510.2390949-1-dario.binacchi@amarulasolutions.com>
References: <20251108105510.2390949-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <32543e3df383baa0ad692e1254870da5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762710502;
 bh=upz/xAQmsoyRhVYv0JVckitSYaPdb3n2zd1b/kIh8qM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bE9zPE10emtRaEiLZA8D0PUNWQlnjknssTKhYy6m658f20RR/MyzNFxzit+7/5mkv
 D+9p+5sKXKH2s/v1fDaThDmExDVOpoWbovOLMLFh893VwtjclnDYHj9MKuW5lEocg8
 sTMClw5y39RwS+LRmX2PU3mV5JOqdZ1St5ohuEKqIcVQB4dt/wbhhMGRVDP5fX5yVR
 1VxPM0PAxkO47AH4C/AF+s37TamupQ9Qqy7k4aIeQPyWHoihOCt/NvVwVYKVv2puYn
 zhTPZAJNotRrAJ7zT4GwPiEGdJQ9uVNEqNqq7sPjRMMtNwCfsT7EvCbmQa3yHpOCtf
 yfGE8p92JvQIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bE9zPE10
Subject: Re: [Buildroot] [PATCH 1/1] package/conntrack-tools: bump to
 version 1.4.8
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

On 08/11/2025 11:55, Dario Binacchi wrote:
> Upstream now ships the source archive as .tar.xz instead of .tar.bz2.
> 
> Release notes:
> https://netfilter.org/pub/conntrack-tools/changes-conntrack-tools-1.4.8.txt
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
