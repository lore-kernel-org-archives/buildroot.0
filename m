Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1E3C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 20:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA01405C4;
	Mon, 27 Jan 2025 20:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvQzJrYvUHDi; Mon, 27 Jan 2025 20:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4B0405CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4B0405CE;
	Mon, 27 Jan 2025 20:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FCF494A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B856400DA
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oBKyuAsRr8n for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 20:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5ED5F403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ED5F403DF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ED5F403DF
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:19:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B8D8D2003D0;
 Mon, 27 Jan 2025 21:19:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42758])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Jan 2025 21:19:47 +0100
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 21:19:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250127125643.1758840-1-thomas@devoogdt.com>
References: <16d6d5fa0dc9be7c219a42b7f7046b2c@free.fr>
 <20250127125643.1758840-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bb160f67ddff23bfae125ea71ce2fc7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738009190;
 bh=56BICI1UySwyhHeiUdhhFGjy9LPVLAaK4Ws1vG90a78=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qjeXNbC1TLuzlmzYWFszkU6YoH11O1cc32cCo5g0wTNyGYGNpEnI4fvGRdM2Lrjt5
 dbU7kKbx3VppUDzfME6gKM2VitRZuMYHj1vUPxOzumNIOaI0qjambJneyaDEzpftPZ
 YZjwewOhK4wV/glZVaICi94ZvzLvC/VzKyAcrcHEoRcrNPMMHjlswFlqubICaM93Wf
 Y3xFHAGC5FfJLU0PXrnaxCPAMAS3xtF3sMSt0YY1y+uD48ekDCRbU9uiwTWxzUlfQ7
 XpfUwZaNP0K0OeLB9mcYBiAEtUM9FH+ayNPspOZTeNPjQHEu0a9gJmDK6b0B+0GTIN
 sqzOBTrBvpuYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qjeXNbC1
Subject: Re: [Buildroot] [PATCH 1/2] package/fontconfig: fix compile issue
 if BR2_DEBUG_3 has been selected
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

On 27/01/2025 13:56, Thomas Devoogdt wrote:
> src/fcobjshash.gperf:568:7: error: stray '#' in program
> src/fcobjshash.gperf:1:18: error: expected '=', ',', ';', 'asm' or 
> '__attribute__' before numeric constant
>     1 | #define __STDC__ 1
>       |                  ^
> 
> This issue has been raised upstream [1], and reported in buildroot [2].
> Upstream has not yet defined a solution, so force it to -g2 for the 
> time being.
> 
> Fixes:
>  - 
> https://autobuild.buildroot.org/results/6ae/6aef28611ad05d8db65105ab150ae980bc6bff4e/build-end.log
>  - 
> https://autobuild.buildroot.org/results/cc3/cc38846fdf63954422ec08d3ae57f2f09ebbf8c8/build-end.log
>  - 
> https://autobuild.buildroot.org/results/b7a/b7ad9a7ecb1d06b8a3d9e86d386195f3c212b9d8/build-end.log
>  - ...
> 
> [1] https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/436
> [2] https://patchwork.ozlabs.org/comment/3450162/
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
