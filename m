Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62683D26D9B
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 20:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D71D08124B;
	Fri,  9 Jan 2026 20:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yleGtl4om-L6; Fri,  9 Jan 2026 20:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4503B80FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767989504;
	bh=eeGgwR/2mEzaqUnRnHe1Y7OdmljEz7UwBR88haNkU7U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bxKIOmxDD63i79FZcGIze/5QBmxoE82xU0oxgorSjZ/AnajuYGqvYplzuffE1NzrA
	 +HECEFd5M/6IXaIq3XBinhrmDGK/r0cvZc8LKa7+PZpCQV9oz9oYjk8tt/rK2XhbAb
	 IaXWtoOT0dwitT3zNyvQu2eT0l5GX2YsOVxExltQmR3Gt7QrFTaI97TH7FrALEG3E/
	 OVLG1dzGGbEOgRjiPzp9cDPll23FHOZ14k1t746BeOx/8pncMy9f1wgfKbuuBGv8on
	 MNY2K/mI6mXAaFl2wNdyZ6lIhejAFu/yZ5WZ4/X0GnSbVUqH1OxUs786BlZWPDhaHT
	 lHbxDKWRfmckw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4503B80FB2;
	Fri,  9 Jan 2026 20:11:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB1712E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 20:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D05E5406E5
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 20:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fd7Ye1R3EuaQ for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 20:11:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCC67402AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC67402AC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCC67402AC
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 20:11:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8C57C780371;
 Fri,  9 Jan 2026 21:11:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Jan 2026 21:11:37 +0100
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 21:11:37 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260109185235.1319640-1-dario.binacchi@amarulasolutions.com>
References: <20260109185235.1319640-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <425d59b2c69d32e8fa2d5f7195e83cb0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767989499;
 bh=X2o8Z/rEeYvjzpJQj0NFtErkxl09syy+d44p867E1cE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qrcGV+3NVh/ObrNV2glA5KRWD3mVtGILa9M2caDvI4DyNUgc217oYU4+gEwrAcjT2
 w/F27ayxdiuZXtLIE31m8AdVRjDxlrvQQs84Im0rRhDUpi/oTYGVrPy8kRtWSqYvMP
 66QWWwkYdk41l8pLXVyQ+DdmgN6twRpld9j9a1oQZNUOBic+SRBBWunD29AJXWMb5J
 r7oX0YWTf7zhvp7g2u6OAIT4Be9f0dHzmXrWxtIP51OYAWrf2zioAgd+6XlLSgFCZh
 P16+etVPPGic/QTf4uukX6BdRJDdeswiIis747hT6M20xAO4DofzKUXrT7CUPEvB5a
 wBOdKND00Xz4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qrcGV+3N
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux
 to 5.15.197 and U-Boot to 2026.01
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

On 09/01/2026 19:52, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.197 and U-Boot to
> version 2026.01.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
