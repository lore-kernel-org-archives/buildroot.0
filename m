Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A29E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 21:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F3A80552;
	Tue,  7 Jan 2025 21:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Iyf7w5R9Vv6; Tue,  7 Jan 2025 21:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA7C8056B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA7C8056B;
	Tue,  7 Jan 2025 21:51:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30FDC1EB8
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DA6F606EE
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gZt698gxWdN for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 21:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD79F606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD79F606D6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD79F606D6
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:51:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CA712B0051B;
 Tue,  7 Jan 2025 22:51:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58736])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 22:51:00 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 22:51:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Richard Braun <rbraun@sceen.net>, Martin Bark
 <martin@barkynet.com>
In-Reply-To: <20250107002702.191013-1-nemaakhilesh@gmail.com>
References: <20250107002702.191013-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1e493147dc292abe471550a094dc7b78@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736286664;
 bh=5IURW3Jkf+C3wpbCtt18iF2yKXqXxrzneWPzKkGhzWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T0aOI9Pm7GIqORpoty7us6MZbbErhv/x0+6VMr8JyMOuUQsopB2XjhU6Cmgh7RAfP
 xXj73kOA+rV7i4+GStXQ035EXioryJuBU/UimKqt5ADMFxP78pyGf6lELU6YruZ5aN
 /UuS0CdjeDcmxxwA8hW/ztgsDPjpI3rKeAan5L8wqzCK6fjQ5NAikCZ1RiOJv20AXN
 4ELjon7FHsOEPxaanqKLPCNyeife2bL8GaKEkav+bqHVLV/LaHQg3qsP4ot3si6LG9
 TRba7qHUzh+YjD3/yqDTn+6lxvOmWviXp04qkurhVRJfTSgJnHk8GnXPPJhg3O6HWR
 MZtPUIDlH866A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T0aOI9Pm
Subject: Re: [Buildroot] [PATCH 1/2] package/zic: bump version to 2024b
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

On 07/01/2025 01:27, Akhilesh Nema wrote:
> Release notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
> 
> Rebased the patch and updated the hash URL.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
