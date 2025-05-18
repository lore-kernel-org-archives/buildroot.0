Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E667C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 365C3813CB;
	Sun, 18 May 2025 14:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXY-funA9TDy; Sun, 18 May 2025 14:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635C581495
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635C581495;
	Sun, 18 May 2025 14:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80B58DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66896813CB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QJb5PK_YUVE for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9272981495
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9272981495
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9272981495
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:50:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 62EC3780333;
 Sun, 18 May 2025 16:50:53 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 May 2025 16:50:53 +0200
MIME-Version: 1.0
Date: Sun, 18 May 2025 16:50:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
In-Reply-To: <20250518143918.749581-1-thomas.petazzoni@bootlin.com>
References: <20250518143918.749581-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <6d2f11c4ef1ee1a5168b5fa615bb5f5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747579856;
 bh=PTD+FUM5BBPV+FgmE/5U54hX5U/dRCPqbjeNcqHIibo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K/vvepXYmubsNJ4l9ygkW3tT3zoQJae2Nuai7X9xeXkAEjrjXzL3SCEXzMx9IyjQE
 TtwPkO8ijs2WMJ20uKkLJZkzZt5vgT3NJAqmjYBY2f0T81Wl9+UAiOs6a2chONYynA
 r7hgHAyZXtPV8gzsj2reXdldB1XMdYTGXXtLkCFGrlgOhdGi+q7VPf+I+HgQVbl4cZ
 OLSQZ38edeTMo4wCgza5nlTiJEs+HklhstgsLTQkQ8IinqhtZXcLT5GXaeCC51TLg1
 YELPO5APON3Xs8BIdRAj3YGjZ+c2hRnwDJFbPcJcV3TBqvMIfzNbT3jkWN6L1QDIw+
 f29W7TelsTQug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K/vvepXY
Subject: Re: [Buildroot] [PATCH] package/python-pyproj: propagate
 dependencies from proj
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

On 18/05/2025 16:39, Thomas Petazzoni via buildroot wrote:
> The python-pyproj package was introduced in
> 7c65b4484e1ed414496488cf8eb4fe967b10c087, and it selects
> BR2_PACKAGE_PROJ, but forgot to propagate its dependencies, so let's
> do that.
> 
> Fixes:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PROJ
>   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=n] && 
> BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL 
> [=y] && BR2_USE_WCHAR [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_PYTHON_PYPROJ [=y] && BR2_PACKAGE_PYTHON3 [=y]
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
