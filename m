Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39652D277E8
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 13:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F6E60785;
	Sat, 10 Jan 2026 13:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkIvMtdldToZ; Sat, 10 Jan 2026 13:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18D49606F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768053580;
	bh=aFvilulsXzMZawkp7KDucgcpP5JrPsLpCXq69nbnedI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DUWE9R2f9PSZ1HgYCs7PsV6LFLsG+RbJw4jcpz0jceTiSQZ0HgWJrun/j2OuiaZsZ
	 IUexxVhdShj53GBSJVd6gbawUmncxe9+BfZYG3C1e25DYbja84sTCjmHJxKDB1asLh
	 MMg6dHyV6vfNujkvNeF47oCkrIFFl3Qz9r8WknDQ9Hk+2Pm7xwSwnIahrVO77Xzd2a
	 KuSlqz35v3WSzJdWc3K2X+MYCh/6jAdvcfUmTrvXcrxzQJsiqe1raFRx9XwM6Gmpjh
	 I3ZgVuEBZsC8GCZHIz3y+fx6TCdOcFL0Yc30gLUXSK8GT5WuAiLyN64J1SrqLtO9d0
	 ngpCs772ybSYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D49606F8;
	Sat, 10 Jan 2026 13:59:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBFFC18D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BE5606F8
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yno4nJ0prpJo for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 13:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFC5C606F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC5C606F5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFC5C606F5
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:59:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B8386780371;
 Sat, 10 Jan 2026 14:59:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Jan 2026 14:59:32 +0100
MIME-Version: 1.0
Date: Sat, 10 Jan 2026 14:59:32 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260110111857.170161-1-dario.binacchi@amarulasolutions.com>
References: <20260110111857.170161-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <6d77177061c6096a1eca46daa9cbfe03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768053576;
 bh=gMJcYgLEwsyLRAAJ6XyEieGawDPFi5XheZGGfHppR08=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RilwElHH6RvN/8cPmHT9Wu0JfiKNFF3Auh/fOcB+ZahjXDfNTthdoIBbV6vZHv7+y
 9ObTl7D16XLQN3OgL1mgkS3I8SH+72IVG2Ft7KrSoe/l843OnkJwlY/Z+3xYsPLkmO
 7ITIrpy4adtK3620+oNSzXRZoTtODD2MvZ7BNmFsotf2p/EbedVMtF6z9EwW6ijiju
 3sd/Mj1fGfC4yK3eLoyuk1eEua4g8k7T0VV+DirencrTpO9TRStDtpsTMLfqEKKURU
 CnaIXhDrXyQybGh3QS5iTABMD2sJPIFlAUmSiRVGmc4V/0jSlZ5OUH9vjo+OWe03ss
 GHwmn3ZLPdLVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RilwElHH
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.64 and U-Boot to 2026.01
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

On 10/01/2026 12:18, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.64 and U-Boot to
> version 2026.01.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
