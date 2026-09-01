Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12785C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E085F407C1;
	Tue,  1 Sep 2026 21:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRGymi5bZntn; Tue,  1 Sep 2026 21:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788299857;
	bh=+6Us4Fi1Uglx/wogNtRpGE7YYumU/c4aRAu0vLeW6Nw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XT/uAeAxqcOjdGsURN+fJyvq1zFEN0o6EO+4MumNuxfLcrvxM9q8k7X8xM6yaFJjO
	 sMJOV5J/1h28x03DQRHtqU7wmQyjxvYyePUYWC/FHhLeOfqb4tTE449Xe72yHPBIEc
	 5zLEsWeA5m/1JmqkjzOe714clH3ahqVI8nmsIZHGFiTUagRgSVYzTor7SeUXkwQmP8
	 DwTUrdWKAYF7bB8w0JzEn4qpEOmOVE+h/me/PUQRs+RzmkfwrJhHGFYE156Rae8cOF
	 M4Hqsu5jyH42g9lfG5tpw36+pglxn9z7XHYH4FU15z7RYs3taj0Va99oIO8t50dZf2
	 HfbgZXCfNfUmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39B3540770;
	Tue,  1 Sep 2026 21:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 700E0127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61766607B8
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUuTWMmBw6lv for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 915DF6079B
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:57:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7C3032003AE;
 Tue,  1 Sep 2026 23:57:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Sep 2026 23:57:29 +0200
MIME-Version: 1.0
Date: Tue, 01 Sep 2026 23:57:29 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Alexander Egorenkov <egorenar@linux.ibm.com>
In-Reply-To: <20260827212125.1988552-2-romain.naour@smile.fr>
References: <20260827212125.1988552-1-romain.naour@smile.fr>
 <20260827212125.1988552-2-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <079deed2f8284f877fc1ab91f00a84d2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/gcc: enable decimal float on s390
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

On 27/08/2026 23:21, Romain Naour via buildroot wrote:
> Floating-point type _Float16 added in gcc-16 on s390 now requires
> decimal floating-point support enabled in the toolchain [1][2].
> 
> Without decimal floating-point, gcc 16.2.0 fails to build with:
> 
> ../../../libgcc/config/s390/_dpd_sd_to_hf.c:27:25: error: decimal 
> floating-point not supported for this target
>    27 | HFtype __dpd_truncsdhf (_Decimal32);
>       |                         ^~~~~~~~~~
> ../../../libgcc/config/s390/_dpd_sd_to_hf.c:31:16: error: decimal 
> floating-point not supported for this target
>    31 | force_convert (_Decimal32 x)
>       |                ^~~~~~~~~~
> ../../../libgcc/config/s390/_dpd_hf_to_td.c:34:1: error: decimal 
> floating-point not supported for this target
>    34 | _Decimal128
>       | ^~~~~~~~~~~
> ../../../libgcc/config/s390/_dpd_sd_to_hf.c:35:18: error: decimal 
> floating-point not supported for this target
>    35 | __dpd_truncsdhf (_Decimal32 x)
> 
> Enable decimal floating-point support as suggested by Alexander
> Egorenkov.
> 
> Fixes:
> https://lore.kernel.org/buildroot/ansJ5dXXblvYeMLB@windsurf/
> 
> [1] https://gcc.gnu.org/gcc-16/changes.html#s390
> [2] 
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5d6d56d837c3dbeabd382c1fb4f7d21d9891f4b9
> 
> Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
