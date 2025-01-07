Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87189E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A816081A;
	Tue,  7 Jan 2025 20:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_ma0ugFLGta; Tue,  7 Jan 2025 20:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56DD06081F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56DD06081F;
	Tue,  7 Jan 2025 20:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A38416B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 887814050C
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIBpmFzmzqlj for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 20:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76EB040469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76EB040469
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76EB040469
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:52:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5D0D65FFC0;
 Tue,  7 Jan 2025 21:52:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36434])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 21:52:43 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 21:52:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
In-Reply-To: <20250106055227.157140-1-nemaakhilesh@gmail.com>
References: <20250106055227.157140-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3ec5482b32af88eb54e517eb48a595ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736283165;
 bh=yihwkmdyXFZRUhBDfzFZ8HUTJwRwtLnAtxMsbWOnSKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hpkM9MkjDsDL1CCmLZ6hh+QWhIiMUuMRx3tHzf3ywEm9eY2jRwNIMn3sUoxThdXNX
 eFJtoFDrdAdWhZefHyV2slV2lriazeXgD5WE/NQqPRez7KO4kISdDKYuPSrZluf0ry
 bVqfLiLWqKyjRk9JRgPOQ5LpgN+qlg06hALC7D50K6CKwNPSmME34MYrDbqKg9/2Rr
 T7qNEZo3GwxNbuQZ7BbxOqykdsgEr4YZwTXvXybu11tJraPVO3wG5jxRV+jLy0/8US
 AmQ4iqyeVwlWHyBwIGYc3DR2YS+PcO8O3YMc/1/eRjhmlS8jj/xr8lMF1hob39pLQ2
 7DdTI25Bqwjpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hpkM9Mkj
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.21
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

On 06/01/2025 06:52, Akhilesh Nema wrote:
> Changelog - https://github.com/pikvm/ustreamer/compare/v6.16...v6.21
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
