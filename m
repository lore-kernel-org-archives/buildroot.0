Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579C7C5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88FD812FB;
	Sat, 15 Aug 2026 09:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHjAovO3Ba23; Sat, 15 Aug 2026 09:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B01E812DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786787382;
	bh=q/GdiN/2xj4Cad0gnMLxUyJSAyalNwhDxkV8dzDxi/E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WRmXZo1N9OwfvK5t/Yzn3pf1Y7uIausd/8/0q7CvdHxFqQBseWnT5Ph+qsQriJnwj
	 vmOpy5de+YgYLpU0n5Sn+LQad4Un8sWr+N9GHDLIjZNB4PZEahTJLK5um8Ug7h2ErI
	 4pMplIybLhcZW8d2y93RciXr554nEm4Jv0QIotDdu1WPwS+yt+9v+S56ogHD+BksTU
	 uzS9Vqeb1QQJeGen2nCpNflhWK77TQnjsMJINZ1nhaRjLHNwlAmJ+ycWTX0AIuqZln
	 E3Bbl7WQHlvzkks30axOlcBiNGr5uvwy/hpsZONT3uAfNR07xVaNgOiMZIVKlA7Un1
	 v9g0/4MhT2sjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B01E812DF;
	Sat, 15 Aug 2026 09:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 074A4109
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6D4A812DF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7iewMEHKdVf for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A09648126A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A09648126A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A09648126A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:49:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 89AD613F88F;
 Sat, 15 Aug 2026 11:49:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 11:49:36 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 11:49:36 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260813205647.44839-1-thomas.petazzoni@bootlin.com>
References: <20260813205647.44839-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <e34c023913f1607ddda53338fa9376c2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/assimp: bump to version 6.0.5
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

On 13/08/2026 22:56, Thomas Petazzoni via buildroot wrote:
> 6.0.3 Changelog:
> https://github.com/assimp/assimp/releases#release-v6.0.3
> 
> 6.0.4 Changelog:
> https://github.com/assimp/assimp/releases#release-v6.0.4
> 
> 6.0.5 Changelog:
> https://github.com/assimp/assimp/releases#release-v6.0.5
> 
> Sadly, it doesn't fix any of the four CVEs currently affecting assimp
> according to https://security.buildroot.org/master/component/assimp.
> 
> License file hash updated due to:
> 
> -Copyright (c) 2006-2021, assimp team
> +Copyright (c) 2006-2026, assimp team
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
