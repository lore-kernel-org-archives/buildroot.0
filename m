Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048F7CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 19:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDDE84631;
	Wed, 17 Sep 2025 19:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BnB-6GCidUe; Wed, 17 Sep 2025 19:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109288463D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109288463D;
	Wed, 17 Sep 2025 19:22:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23EA8279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A1548463E
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_fCxluCumTE for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 19:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E3648463D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E3648463D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E3648463D
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:22:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AFE402003CE;
 Wed, 17 Sep 2025 21:22:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 21:22:43 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 21:22:43 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
In-Reply-To: <20250917151717.362991-1-titouan.christophe@mind.be>
References: <20250917151717.362991-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <68111449db32d4de5246fb126313fa71@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758136967;
 bh=125AtpAJsUi/Tx81Monri508Ft0BpHQGTDYZzkB4NS4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dKgckXtYOD2YPki15yFCDTajGC3Q0/e3xw9ObB/HySrlR8onP30uO161xl1pALCxp
 lp+YCIygCsfQSYcPAVkruaTwxELr0u5kL1rihCmMrK8U5OBqSXBOkQUrNz62H+6WMQ
 KFMEPVxkg7+jULRg8buc8jVn2ZkiqIrOzmgJ1bqha51BKArvCaDojut4G+IOJGO3JE
 Se6XpEv4oH2+VnmzjoqWEBjQ8ClVo/CAA+xrVXGXL1P9nSLTjAxKI7K7MIsKeKvMDR
 7CQs9UEHp0d1sXnZLaJ7DOOb1HsjEz8HA0B5rxx5BdnWhqoR/4K0U/mcrcfcL/tMkJ
 GLDeHdNAChMSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dKgckXtY
Subject: Re: [Buildroot] [PATCH] package/opencv4 (-contrib): security bump
 to v4.12.0
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

On 17/09/2025 17:17, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> - CVE-2025-53644:
>     OpenCV is an Open Source Computer Vision Library. Versions prior to
>     4.12.0 have an uninitialized pointer variable on stack that may 
> lead
>     to arbitrary heap buffer write when reading crafted JPEG images.
>     Version 4.12.0 fixes the vulnerability.
>     https://www.cve.org/CVERecord?id=CVE-2025-53644
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
