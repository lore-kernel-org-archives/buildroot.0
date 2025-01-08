Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555DFE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 18:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BEA403F9;
	Wed,  8 Jan 2025 18:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIRbO3_CcPo7; Wed,  8 Jan 2025 18:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D94BA403FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D94BA403FE;
	Wed,  8 Jan 2025 18:30:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B214F1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 18:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACB2E8100F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 18:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZJm5IrYg6Kn for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 18:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3D8E80ED5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3D8E80ED5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3D8E80ED5
 for <buildroot@busybox.net>; Wed,  8 Jan 2025 18:30:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2EADF13F8A2;
 Wed,  8 Jan 2025 19:30:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38266])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Jan 2025 19:30:47 +0100
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 19:30:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250108090011.2566873-1-francois.perrad@gadz.org>
References: <20250108090011.2566873-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <9df120f6269064307eb3babe3506b2b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736361048;
 bh=17FsSsSd1nEs600IUL9mXxBX45PAqqdsGWTODfRNf3c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nkjpm1EkRuCeu8rFbH9MMGvkameCk70SjbT1WCbWTEG/DhDMkkFT1d6QL9giB24tV
 8w28j+PoLjjIQ8YRrTC8tC4OTixJ+ZF0iTDMtqw2M3mzBgT8cviMw4v2oa71qkMjHx
 51ze6c9CBe3gEpZG+R1R6kcmCK1F0RRpHso5HhMKFfg6MYhfko6gby6roBqX8wpD1d
 5jQq4gsQt7BN1ezAjdMzBvymTOxwooV4oNrvNVxMHumERml9xa/NTCJ2KljmTLP3YU
 6p8/LkGbi7lcWavKrgg2+h22pU0d61NatxMMkrcE1J2hH81t4sWbCuZl21kyv+3EYJ
 x2bu6plI2n+FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Nkjpm1Ek
Subject: Re: [Buildroot] [PATCH] package/moarvm: bump to version 2024.12
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

On 08/01/2025 10:00, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
