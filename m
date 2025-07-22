Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A362C83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9671410FD;
	Tue, 22 Jul 2025 17:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Cj8BN2wgwmI; Tue, 22 Jul 2025 17:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E3AA41024
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E3AA41024;
	Tue, 22 Jul 2025 17:09:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D360E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFA360D96
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tvVfDtteTlr for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4091360F6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4091360F6F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4091360F6F
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:09:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3F7DB780510;
 Tue, 22 Jul 2025 19:08:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Jul 2025 19:08:58 +0200
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 19:08:58 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250722163049.2584798-1-giulio.benetti@benettiengineering.com>
References: <20250722163049.2584798-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e16b30cfda0652688835469fba7e3860@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753204140;
 bh=7xefF14on2OJcjphiV/d3VKHTlMcoO78TChlHNFUE7o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yw8tzlUi5fXFHwior76zlEgujBgTM3W2rwdo5eDf04h/E3sqWUcyz5YolWZAm9iSz
 ulLWYRm0X7BS2BPZ9KMc38FdrsvNG4l8z8FaadQi4Zfj24djGoaKLDAabFLS1WahV3
 n3Q1kDRPDK3AHgaHPW+jvQ1jWQa1u+Cj+T252yK/nVyykEeU0qOmfJ8moDJYSqUZsS
 T6g8rtKoyylPjySiXmQArWTazkRFKMikCsSmtJli6Ifdqy9AaGQl8C5OiB+Nktk2HK
 LCGmDJGZaMU22/i/9ZYz/5tLuiA6fRS5WOC4kcBRP8St33hdrVSC7x3Vr55hcAW79+
 P1s2SrXyAFbcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Yw8tzlUi
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to version
 2025-07-02
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

On 22/07/2025 18:30, Giulio Benetti wrote:
> With this patch package builds with Linux up to version 6.15
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
