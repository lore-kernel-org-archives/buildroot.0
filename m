Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B1CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68EBE6067A;
	Fri, 10 Oct 2025 17:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKtaex6I-xQI; Fri, 10 Oct 2025 17:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 067F660656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 067F660656;
	Fri, 10 Oct 2025 17:44:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C55114B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D60340787
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sg16bjwU_9VV for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A5D74022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5D74022B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A5D74022B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:44:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 931F35FFB4;
 Fri, 10 Oct 2025 19:44:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 19:44:28 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 19:44:28 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251007174907.2414724-1-giulio.benetti@benettiengineering.com>
References: <20251007174907.2414724-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1d76b1c7aa6ff32b2a3208343ecaca53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760118270;
 bh=YNK9ntFwpGT/KqRNVUBi0o5K4xEnhWoF5QZLWcNzBoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Or93xvgcSp1D7m/kGDMs1fJTWf/FsPLE7TzBWuowspC03m0d0F8AJQ8PlSvGrwy9H
 Ky3G1OnJaR0BX+3SnQkHnr1+4GOATwrwchZr/LKcXC9GiK72O/gRJ8nSVLpCoReBAS
 fMtL4Qs71q0dzL17sGSuEjXhv6h8maWg4/8iFW/eC3AMubGslMy/AbnlFK5Vcb0UBB
 hwViUOt0QG9yg9wuAgGAzbo5AAnEqtc+w3aPhAeHEjSntcfDkp+iWDe8Bmxr+yYPem
 uCmdd09KxGQKiVGHB9lPGsv5BTpK+DKjzelbFtg8qtea4BYSp723hBbxKjOAt2fWwP
 6OVFszexRjyuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Or93xvgc
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-08-12
 version
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

On 07/10/2025 19:49, Giulio Benetti wrote:
> This version allows to build with Linux 6.17.
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
