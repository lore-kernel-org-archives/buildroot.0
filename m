Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38128CCF9E5
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 22:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6BF80E3B;
	Sat, 25 Oct 2025 22:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLUf1TcohNQe; Sat, 25 Oct 2025 22:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3530E80DCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3530E80DCE;
	Sat, 25 Oct 2025 22:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E3ED7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66B6560B9E
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MR63XfkzFtx0 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 22:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6916E60615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6916E60615
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6916E60615
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:09:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 93A325FFB1;
 Sun, 26 Oct 2025 00:09:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 00:09:19 +0200
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 00:09:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251021200819.548265-1-bernd@kuhls.net>
References: <20251021200819.548265-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <096157ba8be7083633fb37d4072011b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761430161;
 bh=QPjKJKnkvTUG2OtkrKgv78arR+08rKgNv6hkpwsIWZ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ABwxpjbSs5ko+elFO7ISiDodtWjSfCAEevNrzMm4upH8SbMp0FnqzepUJ6OwMO6vh
 LJVWvGag9PCylJ7sMSKDoMzHssH9sULKs9z9wR2iWQQJBQi2xLgTwvXmJTAvLflHXy
 QggpmxIp8vOMkOteSV6gAlEcZTjneS0J01MtO2i5SO3sf1P6+C1Pi+um2CbftvS/1A
 tV0Kg1ovnqZC/LKfGUTiMbDKjUQRAJdcVOlBijWUgi1UyxjX9iElm5kI3mG2w1zo/X
 nsoMSVekBhYADoVPi0744bA2jXYOs4EC83UOlBsdSiX40vl4uYSvtsEviL2C0iRpVL
 U+VGH1jmA1N1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ABwxpjbS
Subject: Re: [Buildroot] [PATCH 1/1] package/libucontext: bump version to
 1.3.3
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

On 21/10/2025 22:08, Bernd Kuhls wrote:
> Changelog:
> https://github.com/kaniini/libucontext/blob/libucontext-1.3.3/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
