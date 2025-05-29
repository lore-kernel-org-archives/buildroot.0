Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E58EC54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 21:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7EFB61671;
	Thu, 29 May 2025 21:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIaKeRdkB_Tf; Thu, 29 May 2025 21:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1952461675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1952461675;
	Thu, 29 May 2025 21:16:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 460BE1513
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C30481FD9
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzQl2mows0aQ for <buildroot@buildroot.org>;
 Thu, 29 May 2025 21:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BF7181F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF7181F97
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BF7181F97
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:16:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DA48719F5A5;
 Thu, 29 May 2025 23:16:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 29 May 2025 23:16:05 +0200
MIME-Version: 1.0
Date: Thu, 29 May 2025 23:16:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250517233042.3444293-1-giulio.benetti@benettiengineering.com>
References: <20250517233042.3444293-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e0f7c79a9fe5551489cd3106d9016f9a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748553368;
 bh=7IIteXfvdWQst0FvtIO53DRhDfGioGWtNYmjQPWP2eM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GzCCYC4m7nCvALBn8xdzJhE1yG65HHwp1Tn9GPtoW3Ho6S66aJ/3FOvboF5/I92lH
 FbhzeJOmLq8vZH3tZGUOpabke/qRnywA5QqjQDaIWzoC0SwGQbckiz60OOrRLg4vP8
 h1wpAAFHBGObWLmfnyg/eu/6eF/Xyi4nuZw74v/q0booxao1L3edLTxR4jPyk3Xwds
 O8k1wChGeUGLqotxcuh2416TZ1oM+AG+Eb6Nl7xcLVfXR/CGmCTDgOySA2yfK9eEHl
 BiT+ifMUGHkhY+gDrx4VumSLevLnvo6wP2Dn7Qozf/lQh8hR00YntNMStwCWD3/LMn
 lGMxZpsl2B8+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GzCCYC4m
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure with
 Linux 6.14
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

On 18/05/2025 01:30, Giulio Benetti wrote:
> Add local patch pending upstream to fix build failure with Linux 6.14
> 
> Fixes:
> https://autobuild.buildroot.org/results/f6421f9669934686e1ff881b9618198afc9e1259/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
