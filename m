Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43487CCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 17:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 719C6418FD;
	Sat,  1 Nov 2025 17:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJx3FYAFh8hj; Sat,  1 Nov 2025 17:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7F941854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7F941854;
	Sat,  1 Nov 2025 17:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 564F5222
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50D6B6125E
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elbEAFZKZlDN for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 17:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D23B61283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D23B61283
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D23B61283
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:58:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2F2595FFA3;
 Sat,  1 Nov 2025 18:58:39 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 18:58:39 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 18:58:39 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20251013072634.1703941-2-buildroot@heine.tech>
References: <20251013072634.1703941-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.11
Message-ID: <f64c0023ace9d345b27bf7af7d632ba8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762019921;
 bh=ZOsC6TyS7xshyiSy0NK+G2kaZlj0yku6l+rWjOEQ9VQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gFM2e0fljL+y/en+FlnjuJCUAoyNxbN7VLsVgVgxHXd16fqt1CmscLeK/k6LS2dYi
 +KC8vCKezzMF9hv1A89gG837BG1pNTmT3unXxZryHeB1SHec+8cm0oLaRCJRJSkLya
 ONSsR0eo9BPBB+ycnA24oTqEovBKaqfsDSIhUnXlVgdOTZfBFkyThzlw51Xy1oGs/Z
 Ie48FG3GzYUE2YwAdtNy5RAj7htB6VeKWuRAFXNdelu86dFSFxt0g/Y+aXj8RwD/cD
 4IfiB5W5yEu81KXg1wg8YZ//FYH1uUcFN6Gv7ty8mpPfHCoBSNwW7EiA2mkXCnMyP2
 O9PBUyO+53Rwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gFM2e0fl
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.16.0
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

On 13/10/2025 09:26, Michael Nosthoff via buildroot wrote:
> Release Notes: https://github.com/gabime/spdlog/releases/tag/v1.16.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
