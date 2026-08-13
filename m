Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A986C5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E693E813F5;
	Thu, 13 Aug 2026 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M62EFpyw1KF3; Thu, 13 Aug 2026 20:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19013813E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786652212;
	bh=67JvyIQ9F77D9MrQU0NGAMdUJV9w5PZQromWm4uEKZw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XGKCCtaq9g3czit9OSgDhA1+CykyljYPBVbHAxGB3ktdreyL1GvQmEs64WNguV26s
	 sdvmbeeGO9F3e6G+pXcfMMN37UjycMOUqb8dn4bfvbMOrP+Z7TJj9NKv15f4NzKKXN
	 AkqIs+4m6PZzb5daZpjE6gEBkheIP5ELSTiosOu1gq19xaOU987ErxfwGg3/mX+PSM
	 UxDvJlZvjFYFhDQrcqBDnHsM3OFSWmTw3FGjLYn3e/jhxQAtJrNbxttCg2wdo0Q4XP
	 M9U4aFRd5HpyqBzza+zAFIs7rRYma9NfDhm7aBP3qy4v0aY44nrqc3BpwV5dILSBgo
	 b+4K38FQQ4d/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19013813E9;
	Thu, 13 Aug 2026 20:16:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B34483A0
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD64813E9
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dWU7h-8imtK for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB6D5813E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB6D5813E7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB6D5813E7
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:16:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 98275B00539;
 Thu, 13 Aug 2026 22:16:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Aug 2026 22:16:45 +0200
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 22:16:45 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thierry Bultel <tbultel@free.fr>
In-Reply-To: <20260813143405.2868517-1-fiona.klute@gmx.de>
References: <20260813143405.2868517-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <3edefbbb41bb41185bb3728373ec0048@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/dracut: security bump to
 version 112
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

On 13/08/2026 16:34, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
> 
> Upstream changelog:
> https://github.com/dracut-ng/dracut/releases/tag/112
> 
> The changelog lists multiple "security related commits", though only
> one mentions a CVE: CVE-2026-6893 [1], which allows a malicious DHCP
> server to inject code into shell scripts.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-6893
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

I applied the first 2 patches of this series to master, thanks.

I kept the third patch (dracut-util) as new to give it more time for
review and testing.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
