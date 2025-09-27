Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C724CCAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 11:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7603940BC1;
	Sat, 27 Sep 2025 11:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wC9jArI3EC1H; Sat, 27 Sep 2025 11:16:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A0E4034D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A0E4034D;
	Sat, 27 Sep 2025 11:16:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D88177
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD304214E
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_4kFzTzUoRf for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 11:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4438A42149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4438A42149
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4438A42149
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:16:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 460A82003D3;
 Sat, 27 Sep 2025 13:15:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Sep 2025 13:15:57 +0200
MIME-Version: 1.0
Date: Sat, 27 Sep 2025 13:15:57 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250926213700.3341341-1-giulio.benetti@benettiengineering.com>
References: <20250926213700.3341341-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f2e997aab1e7dad7d4ba7c67b6850bb5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758971758;
 bh=x34tRSz3g4ytNMhGWVlcHvHlGw4hdWN7E+NHJIGoljQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H4aKSsHQc0qwmvdSz25EfPqca3px/fwO0yEEjqtI5kAmry9KR4n+lUMhOVdxPBEiU
 TM+yJejHex71AL1Bbkf+dl4kinilMN9o1t9prYOPuFiGkqjyGsXWK8dtZD6CNbZpOK
 Z/9yD/SJFEIUOLE1bPZNH95BqyR4eLfl11M4oMPTenHakiJomL3+ioUPjzr+3msUSf
 WcqYl3JvkMjIyaJP0iqiC/erpBe+1byOub+wrbkovPJWUJw4ztWha1a/65xwaBxNxy
 yBKBkW0BdCYLkQy9jQH4VDjMZWgLGpN6KLgLEK0NMBrq0Lxnynq8w2Bc/XcP9SBAhi
 d/fCLGluHgUvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H4aKSsHQ
Subject: Re: [Buildroot] [PATCH] package/libblockdev: security bump to
 version 3.4.0
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

On 26/09/2025 23:37, Giulio Benetti wrote:
> Release notes:
> https://github.com/storaged-project/libblockdev/blob/3.4.0/NEWS.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master (after removing "security" in the title).
Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
