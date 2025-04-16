Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5442CC369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 17:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26AF381209;
	Wed, 16 Apr 2025 17:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dv09LEqJ_WRU; Wed, 16 Apr 2025 17:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CB3984837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CB3984837;
	Wed, 16 Apr 2025 17:22:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DBDA6B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ECFD40C28
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DmIt6rM_Su4 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 17:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1D3A40B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D3A40B8D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1D3A40B8D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:22:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0C8D32003CE;
 Wed, 16 Apr 2025 19:22:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Apr 2025 19:22:18 +0200
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 19:22:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
In-Reply-To: <4789a09c12708cbd48172f0c6964e6a7f18f36a4.1744784815.git.baruch@tkos.co.il>
References: <4789a09c12708cbd48172f0c6964e6a7f18f36a4.1744784815.git.baruch@tkos.co.il>
User-Agent: Webmail Free/1.6.10
Message-ID: <a46c94b06a85145bdf03bbc2a155ce41@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744824140;
 bh=BsVH0LrjzChEX3+9+gcEcA9YFkAKqw92weeaEeV8+08=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ien02TWzT+2S0vrjzPl9T4S3ZzH6OiH/6brqEYVDeX6dv/68rLLwbHvgyf9KYMY7n
 M1SDkrw3jX2EtECCTX09pwrYrnXRFpCXirOY+wE/wJhliTvkbkEOiHRVzvkLA7JVUp
 +A9MooWz+AMDIxH35/dSKVxam9EYoNXhMuiIeaW2Vraa7hKPT3bbDA/jkQZ+JDJGPQ
 dgZy55kJ0i5uCopM9N2qg5b6JyYteyTIT60AatVBGpAW7NhzMw8mdmUdE9OWs33hLa
 TCAPzgOcBHga7s2zkbd2LvCzZ4Ibk+sqCZp8fbra3G8QlVvL3Lp47+/LqPAICDgt5g
 k8zJ0uPMDOO0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ien02TWz
Subject: Re: [Buildroot] [PATCH] package/socat: bump to version 1.8.0.3
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

On 16/04/2025 08:26, Baruch Siach via buildroot wrote:
> List of changes in this release:
> http://www.dest-unreach.org/socat/CHANGES
> 
> Refresh patch.
> 
> Update README hash for changes that are unrelated to license.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
