Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38558C3ABBE
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 21:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F35C9606A9;
	Tue,  6 May 2025 21:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBsWX6zYJcmM; Tue,  6 May 2025 21:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47C4360A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C4360A88;
	Tue,  6 May 2025 21:03:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5D81EDF
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B89760A88
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4_onuajQaHI for <buildroot@buildroot.org>;
 Tue,  6 May 2025 21:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4648D606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4648D606A9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4648D606A9
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D22D4780652;
 Tue,  6 May 2025 23:03:48 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:46318])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 23:03:48 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 23:03:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Sergey Matyukevich
 <geomatsi@gmail.com>
In-Reply-To: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
References: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ba6f54efa4f98c5646dd67d25de7dfe4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746565433;
 bh=C7kDc674TgcQiaNBQH8lZSDPAo5HwjkyRcsnzRP3I1Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q6o7EN0rXk/r4ASmKj5jbsfvSvmw8uHLWY6rFUqPL/l/AH3S+12RRJraUCHJ2BxDG
 JtBtcyECQcrYnlIPDgrkof7XIGWUnv/xG6YWrFAjvQiDSfn0F8K5ju7oFIiXvfDwsL
 xaUYEBLj7ePovAmN9eXOnsHEG2j1BEruENdNg1cKUWF3yhy8gH38pZ8WpeVy5xYyol
 1GFBKs8DRz8MBKutML2GexQzpJSYZVmsmNj3/dcnFtK8sTpMeanKA6RDLTtsB2NBzq
 MmOixXrPWJ5N4ezBrKIWBu2bgjuBb8irCItgehe26yrVGM3oVNMsWkDt21LOCmYhwh
 wTbq0eEpK3i6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q6o7EN0r
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: bump to version
 2025-02-24
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

On 26/04/2025 00:26, Giulio Benetti wrote:
> With this version we can build with Linux 6.14.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
