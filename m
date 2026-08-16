Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3391EC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D89C40728;
	Sun, 16 Aug 2026 07:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzXzBVIhGV3v; Sun, 16 Aug 2026 07:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 628B140720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786866975;
	bh=t5XsUYesSA5HnG2DVJ0KphyThLoa7+jSX34GdhJd0Qs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oLhObjMyQE+BPULAkfVmU+97o1KzZ29TklqqtUAE/CIJsRO8u7WI0IYnyLyOympQM
	 yb0T9hbu388mWGXTf40wCk/3moHx9/jxiyKhKsPC9Ga77m4QEDy8GBm6vJEhQK3kCn
	 QAHs62mK48hCqfOOjVK6Ju7XGE9oReE29SAaWku2NEZaPw0uQIP4l46Vc0pPPVAvD5
	 dLzOA6y+IedGAuKRoOWw+wrGpb15dPTzVaHCf4EQJR7riw46EPAHdAzpeWaAcosDAZ
	 l1a8gmpon/M20GCNxll/Td7QrTWjZIqz2l4TUmSPIYptv+JuP+qL8ZU+F0xiiIrfG2
	 2JKuxAZO62cEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 628B140720;
	Sun, 16 Aug 2026 07:56:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68337194
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA366069F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vL7AwYIBK9j for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46B466061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46B466061A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46B466061A
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:56:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8D8E0B0053D;
 Sun, 16 Aug 2026 09:56:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 09:56:10 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 09:56:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260816073211.1830243-1-bernd@kuhls.net>
References: <20260816073211.1830243-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <45690d9185535ded8563468368b9bc40@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260812
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

On 16/08/2026 09:32, Bernd Kuhls wrote:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260812
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260811
> 
> Fixes the following CVEs:
> 
> CVE-2025-31936
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01379.html
> 
> CVE-2025-31938
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01404.html
> 
> CVE-2026-20917
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01423.html
> 
> CVE-2025-35973
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01428.html
> 
> CVE-2026-20716
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01435.html
> 
> CVE-2026-20760
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01441.html
> 
> CVE-2026-20713
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01442.html
> 
> CVE-2026-20707
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01443.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
