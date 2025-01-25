Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0C3C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 12:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80529607EE;
	Sat, 25 Jan 2025 12:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APSr7MNoa5yY; Sat, 25 Jan 2025 12:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A439F60A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A439F60A6A;
	Sat, 25 Jan 2025 12:32:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FD9B1183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40C59607EE
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4h2_IKFaBr-Z for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 12:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 614C960A6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614C960A6A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 614C960A6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:32:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 991BE2003C3;
 Sat, 25 Jan 2025 13:32:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54912])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 13:32:04 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 13:32:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125053043.86742-1-nemaakhilesh@gmail.com>
References: <20250121091917.19379-1-nemaakhilesh@gmail.com>
 <20250125053043.86742-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <da1d351c5385390f404fb66f87011716@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737808325;
 bh=/iMVxc8OhnYHbpnGKKwiF7w6+vbQ4cU1wdxGEPI2gbw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QX1pRkL6gb5ZU83At6Q6Qs8NZLvSuoyasVCTZU6xhu5fWwaT8G+HPG3+bhFlhS/RA
 pYAKbcPXl8+ZPukVdnLXb5CvqfGstkDITqGULMRD8fQ/ucx/8Q364YYCGPeV5EhCK1
 sxtsY03hF3rrKpkVGHFE6q3UMpPDzMiY2cE673ykYLLzzEqlNkuFX1XCObgC2lHHR5
 t7Ao7i7wMIDtj/5Aqu9HX5H/FKqhRSxHNpdC0hYfvlw6h8ZvyN65XDc/uiYap71N74
 yroWYbXbPzkOL6Js7NLS7yCYMHqHKz8qtWWDJ76oDgAa3c9tpQ6cKviCXMYqBqWvYE
 PdPzqxv6q5Ygw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QX1pRkL6
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lzip: bump to version 1.25
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

On 25/01/2025 06:30, Akhilesh Nema wrote:
> Release notes:
> https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
> 
> - Updated hash of the COPYING file (FSF's full name and address was 
> added)
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
