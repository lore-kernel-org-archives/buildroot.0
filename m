Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A583C369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 11:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522B180C9D;
	Sat, 12 Apr 2025 11:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKQD9rpOEIIO; Sat, 12 Apr 2025 11:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F5BF83842
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5BF83842;
	Sat, 12 Apr 2025 11:49:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63CCA108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5546440F2F
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3rNOMRJ0OFd for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 11:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D8EE40F5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D8EE40F5E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D8EE40F5E
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:49:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A3E1F5FF95;
 Sat, 12 Apr 2025 13:49:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Apr 2025 13:49:05 +0200
MIME-Version: 1.0
Date: Sat, 12 Apr 2025 13:49:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250411144739.3957036-1-dario.binacchi@amarulasolutions.com>
References: <20250411144739.3957036-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <07999d43f8c4533022e4a2795fdb55ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744458549;
 bh=LxpGI2K6CcJMLSMO19TOd10NUuxe7JP71NVOhwNSNCs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KeaorM0gslK6NoAZ41dQMioq8/oF8SjsFyAMxKxlBSwNkRNM7ZXGTkGgjdpVZKG52
 WeSiOjWmyyJkESQ+rDmVie+RBiUmzSEs7bMIiCIrDnaw8rVVTizB4OjISY4a8rX/Lu
 IO90KYmCaiQEAIETLLdxMx48lRCM6TUYfe/V8l59Lh1Nc6GgsP7lpuv5L9nDAkNbeb
 IrmhY0aPisOSRR8QE+q5NALWdUB9L/gmU5m+OmPKD3qCo1fN4xM+rpbXXlUMk5VH40
 MT7vBroW+psrZct1eYrUrOErAOOLinWsq12C84nueH6SLGITrYyyADG2cw/CS2QEJx
 x0pFLSTlQnghA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KeaorM0g
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump to
 version LTS_03_2025
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

On 11/04/2025 16:47, Dario Binacchi wrote:
> Release notes:
> https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_03_2025
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
