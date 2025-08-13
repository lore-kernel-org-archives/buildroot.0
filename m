Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7924C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EEC082718;
	Wed, 13 Aug 2025 16:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j_wEwlaGMDd; Wed, 13 Aug 2025 16:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADBF6825C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADBF6825C6;
	Wed, 13 Aug 2025 16:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4351B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C2A6403F2
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLZkb6ujiteb for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8031340366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8031340366
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8031340366
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:21:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 932E62003D0;
 Wed, 13 Aug 2025 18:21:16 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 Aug 2025 18:21:16 +0200
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 18:21:16 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20250811161107.7641-2-maxime@leroys.fr>
References: <20250811140030.1043469-1-maxime@leroys.fr>
 <20250811161107.7641-1-maxime@leroys.fr>
 <20250811161107.7641-2-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <713b94de7ad1290d2805d86b8e982b5c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755102078;
 bh=Pow7a+i+HqUECssxOw8vcBoHfDQlzrECOJtH8Y5yDMs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jCNLPJTJY1l7sw+sZziTYj9WeKLDcTO53wgt/581b87qYQdVx5bsRK5tS9E/0WNjR
 P51TTDbZ/+DOzRYsI/s8ZnMgS5IQ1plTzfAM5jKpQrY7bNfxfgyIt0gPLC0OfyjUx7
 NC9K3vuKv3X8ZURrP00uY1jsZ8zc9eV1iX2HeqIuCGQJBs5tJ6gJJtyImBl6MXaNXg
 ODTUiCaxL4gxTAH0BTWrBm9HwOnnpxjay4Zojh9cr0j5IfeVZmfEhSeal3VFjp6h8l
 53zuXA0eX5talFlXt5oNzXAwaE9cHe4vbIYKZsYBm7qRnadF5KFaqSmPDmoESx+9rB
 RdUaTDCXbHRhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jCNLPJTJ
Subject: Re: [Buildroot] [PATCH v3 1/2] package/frr: bump to version 10.4.1
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

On 11/08/2025 18:11, Maxime Leroy wrote:
> Update FRR to the latest stable version (10.4.1 see [1], 10.4.0 see 
> [2]).
> 
> As protobuf-c is no longer mandatory (see [3]), a new option
> BR2_PACKAGE_FRR_PROTOBUF is added to enable/disable it.
> 
> getloadavg function [4] is now used by FRR but older libcs (e.g. 
> uClibc,
> dietlibc) lack this function, to fix the compilation, a patch must be
> applied on FRR.
> 
> [1] https://github.com/FRRouting/frr/commit/88f5c06cbc1c
> [2] https://github.com/FRRouting/frr/releases/tag/frr-10.4.0
> [3] https://github.com/FRRouting/frr/commit/e51c16a4ca92
> [4] https://github.com/FRRouting/frr/commit/ff76fb21d7b3
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
