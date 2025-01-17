Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D86C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 20:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBFC0424C0;
	Fri, 17 Jan 2025 20:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSBQ-zN-Mtpc; Fri, 17 Jan 2025 20:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7D43424C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D43424C8;
	Fri, 17 Jan 2025 20:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E41AEB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2008849CF
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZsn6_y661KJ for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 20:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 025FB849CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 025FB849CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 025FB849CE
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:39:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C7CB2B0054E;
 Fri, 17 Jan 2025 21:39:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35202])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jan 2025 21:39:30 +0100
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 21:39:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
In-Reply-To: <20250115080524.795538-1-nemaakhilesh@gmail.com>
References: <20250115080524.795538-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <def72c03701425e0558610527598c941@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737146373;
 bh=G/+sA4EHeit0MPdF5FPrVmoTB5ca/JsCfclUed52rUw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sSeO0q5jUIemmGem4AUx5lK/Kpbu58KsAOuqLpchKPv0d6Gomw+ujTrXsoqI6AERW
 kfsWsmzNf9uFDdvyPBAM7b8Q1Kk3r+oLrDbVAJqffgVG3FSUMs+i1xOOlCWEIntRft
 CYOMTziqRlie2nZRuCECAyHQ579XKMfICJQ97uDesYmMaO097orxCOhXP4o1FjmQfL
 v5XpsvPv+OffINfVQjBdMbG5WBIZTtkcIVFaV6tMXfAHog/5E/Jo4QlmjFyeY+A3FL
 Ko/cz0hiDVtRnXVD2P3j5wSpIEs0IF/FUzwGyZzI5+n6Lp9SqhUHOgW35TYdW+qtaf
 w6HBs0iHIgx3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sSeO0q5j
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.22
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

On 15/01/2025 09:05, Akhilesh Nema wrote:
> Changelog - https://github.com/pikvm/ustreamer/compare/v6.21...v6.22
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
