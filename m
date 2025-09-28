Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFE2CAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 16:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA6C3406B8;
	Sun, 28 Sep 2025 16:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl50XFaoRnt9; Sun, 28 Sep 2025 16:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ACBE40260
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACBE40260;
	Sun, 28 Sep 2025 16:24:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 650D212D
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 16:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B53740200
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 16:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pID7IYZXYIc4 for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 16:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 888DA40116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888DA40116
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 888DA40116
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 16:24:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 040126012F;
 Sun, 28 Sep 2025 18:24:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 18:24:40 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 18:24:40 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, Petr
 Kulhavy <brain@jikos.cz>
In-Reply-To: <20250928145118.32282-1-fl@n621.de>
References: <20250928145118.32282-1-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <5ff3f6388cdb2b267347212ecad2871d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759076685;
 bh=45t8F6/XmWwdnDQZYHqvBy5lY6EFQXZxifMMP7f0pHg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qw/1DkHgBSWl1oXDXEZIpfkHE7RVVyuZAibKdPAWOJOda6626bqQpfjnQTW6JrETV
 xoMrHzxIj04iNYx1LFjG1qUdV89pvL7sm8QuOmURc23yHJXZJ6c/jCv4jxcRtSqLoU
 xtq7jDxqIVnfYj4JfIjPlYmVQfvkx3H9XekOhyjK8Jv4p9TpjLeB1dTYKgFARorRaI
 qgoCaQvJFkabsK7EwrpfKMDuMLf2nBhUZyoqm869H0uCRuIhVQpYP1C82auJQJGbNC
 sbsOl/LJpWdVRE4YMc2V3LyO4ngtF6k0iecNL803eYNrlX8Xrc0n171OH1VHxNxg65
 wtcUzG1YoliZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qw/1DkHg
Subject: Re: [Buildroot] [PATCH 1/1] package/linuxptp: update default config
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

On 28/09/2025 16:50, Florian Larysch wrote:
> Since upstream commit fe01cc7 ("Deprecate the slaveOnly option in favor
> of clientOnly."), included in v4.0, ptp4l complains about the
> "slaveOnly" option being deprecated on startup.
> 
> Update the default config to silence this warning.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
