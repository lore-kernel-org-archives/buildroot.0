Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CAEC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA6A407CC;
	Sat, 15 Aug 2026 15:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ng_nOLbQXakK; Sat, 15 Aug 2026 15:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19EDD407C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786808953;
	bh=C6fvOYCKTS2CmCMdaTQqg5lXV/kmY1yudiP3MdXXguc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bwi3JRKJf5WURVv0M9ir+e8u2zA6h/G0U3WJKFPcdmT9hrhFt0oWKGlhUE6ykXSJC
	 Ze9f2CLvAELKWH+cbztMkno/J0vB15gPmEr8PMH3Uke1gXQvijz3eRtVSptYruB1W1
	 x4D4eMIsYgqZmQXlK98PsuA16tr7ynS8LVwkVh8fntHpmBJFTG9xFLRQG2+ghafMIO
	 XgrtkI4gz7S7+OXtrPrIF+QiBMl1dknJg3tBUtS1tjPBRSTqeSkWOMY6Ta1egwp0OB
	 3QsHO+jIDZ50X2NsXloxGAVF+88abAugsK4nt7+k8n+3SXxfIS/9e1toiOFowo3WbB
	 N+xhkCZGao24A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19EDD407C4;
	Sat, 15 Aug 2026 15:49:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E872BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B185400A4
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjhs0CyWqm6S for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0219340026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0219340026
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0219340026
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:49:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2453F2003AE;
 Sat, 15 Aug 2026 17:49:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 17:49:08 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 17:49:08 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260810161022.3779199-1-chakrabortyshubham66@gmail.com>
References: <20260412182023.96383-1-chakrabortyshubham66@gmail.com>
 <20260810161022.3779199-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <c0332a4b0a1f048ec037ff04ccd93a4f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2] package/bash-completion: bump to version
 2.17.0
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

On 10/08/2026 18:10, Shubham Chakraborty wrote:
> Release notes:
> https://github.com/scop/bash-completion/blob/master/CHANGELOG.md
> 
> The hash of COPYING changed due to whitespace (tab to space) formatting
> changes.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
