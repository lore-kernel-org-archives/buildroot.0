Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA44C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 09:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1811360E14;
	Sun, 18 May 2025 09:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcPJDJAzp0TM; Sun, 18 May 2025 09:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D031760D73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D031760D73;
	Sun, 18 May 2025 09:50:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C9521BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0238F401F6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAhPjWwSK01w for <buildroot@buildroot.org>;
 Sun, 18 May 2025 09:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E84FD401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E84FD401A2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E84FD401A2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:50:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 88494B00548;
 Sun, 18 May 2025 11:50:15 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 May 2025 11:50:15 +0200
MIME-Version: 1.0
Date: Sun, 18 May 2025 11:50:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518081112.3980310-1-peter@korsgaard.com>
References: <20250518081112.3980310-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <59ec9d18bf12fa7081b23866863624b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747561816;
 bh=2vZAtaGlXXImFTqk932B+J7Sqzu5Z0J8DIXzaYIMVwU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AjuNSsqIO8amziDobOpkJUrybA3TtVcZ0WSAigYgcS7gjoXRYuQ0kvO3CeQ33nLX/
 pdqMginqA+vHtQvcXtWGqRyUh3Ve7dsSGpDkfEpdxYP3g7VL2JJUomRCyc9PysEEtR
 SHlqT6giGthgbVD51LYa52dT+HzaRhxL707usV2fb+D9enM7yUkntonwabqlS64phT
 oeETbwtHRFxWizzn1iVe/QNTJIFOLW/4iYVMMIw2DUHjZZdB2rPBQ4eL+JdiN6se2k
 HyxkwINO0YjK0mpKnGc7Jp6tow9v2UIEFezf2jvwLiGkswlLMJBpXXc1vxtLO8qQRW
 3rdtcCIYo6VDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AjuNSsqI
Subject: Re: [Buildroot] [PATCH] package/flex: fix GCC 15.x build issue
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

On 18/05/2025 10:11, Peter Korsgaard wrote:
> Fixes:
> https://autobuild.buildroot.net/results/924b1015d4b81385409ef00f1a14be3ca1959c8e/
> 
> As part of building flex for the target a few files are built for the 
> host,
> including a rpl_malloc() implementation containing a malloc() forward
> declaration without any function parameters.
> 
> GCC 15 defaults to -std=gnu23, which handles function declarations 
> without
> parameters differently from earlier C standards leading to compilation
> errors:
> 
> ../lib/malloc.c:6:12: warning: conflicting types for built-in function 
> 'malloc'; expected 'void *(long unsigned int)' 
> [-Wbuiltin-declaration-mismatch]
>     6 |      void *malloc ();
>       |            ^~~~~~
> ../lib/malloc.c:5:1: note: 'malloc' is declared in header '<stdlib.h>'
>     4 |      #include <sys/types.h>
>   +++ |+#include <stdlib.h>
>     5 |
> ../lib/malloc.c: In function 'rpl_malloc':
> ../lib/malloc.c:16:15: error: too many arguments to function 'malloc'; 
> expected 0, have 1
> 
> https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters
> 
> Add a patch submitted upstream to correct the prototype.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
