Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF89C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 530CA406C5;
	Wed, 26 Aug 2026 21:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16gZYcWuShql; Wed, 26 Aug 2026 21:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787778980;
	bh=XVvREiLz97cKP2srMRD3863EEL7IUjop5lm7zF1DhcQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HBDG40mfinUnZlCuurt/GS484UjadkbBvLezerltSiVMEVQcb2FWv1GMlAFtNVycf
	 j6tVtW2p86UK4bCTtFwhH8y0cXLOgdKzrnApPquSpK3mptEXNZKV3fPFNijblwd8yj
	 vAqNPVFycj4+9G8x6W/S2in9O1YlC4Lm/5Ja4altEqQ8CQEO2JkhaZMpeaoqDLTXcG
	 COKQ0fmbMQlv1sSiPMJH5bg5YDFG5/mgOoxrN45MftsoiLiSVUTi6MbPayIWuajeth
	 dsqjc2bA7NWSUosjnur/2qdFMou/PBK3YEFR5YXoGwou+rmzmqDTcjYTTd0GuLr6t9
	 WDuh3PnIIbDyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CDB24063E;
	Wed, 26 Aug 2026 21:16:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03A677AA
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E97DD4063E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhfvKUL9M8yp for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94A4440633
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:16:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 23D8619F5AF;
 Wed, 26 Aug 2026 23:16:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 23:16:15 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 23:16:15 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260826150620.4062409-1-thomas.petazzoni@bootlin.com>
References: <20260826150620.4062409-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <6a37e0dd755a9a26d984a1a9ea16515c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/dahdi-linux: backport commits to
 fix build with recent kernels
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

On 26/08/2026 17:06, Thomas Petazzoni via buildroot wrote:
> Fixes build with kernels >= 6.15.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/ed73aa844a18cfc15e942ced4ae363c3d0d09015/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
