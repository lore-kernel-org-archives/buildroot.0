Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BA8C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C514A408F2;
	Sat, 29 Mar 2025 20:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRhuvEEd4_Nu; Sat, 29 Mar 2025 20:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15ACC408FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15ACC408FE;
	Sat, 29 Mar 2025 20:22:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCEAC121
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE1F3408F2
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VefuOl2HgWJg for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C03C408F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C03C408F0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C03C408F0
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E4A4413F879;
 Sat, 29 Mar 2025 21:22:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57316])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Mar 2025 21:22:45 +0100
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 21:22:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <45bf4abdbbb4ff9d87b4ac7d7eebf687e723e7c4.1742563913.git.yann.morin@orange.com>
References: <cover.1742563913.git.yann.morin@orange.com>
 <45bf4abdbbb4ff9d87b4ac7d7eebf687e723e7c4.1742563913.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <676df009c1723e2725056e05d5913f4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743279768;
 bh=6PVNKLpm7SYXZG/WF7HcIoRS5LY4jXF04N2b51jmHE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dMc3F0VQo6YN9dHKXzYYs7jfd9Aqe63q0uiOboAEziUNl7qcEkD21YHdkm9wfDSBN
 0+5VlWAaex7Qf1TMlkUTksZWFLx/T6RQRFw7qxKnBDDwwfBTIWr94JOEtbAM6uQx3p
 KpZ6VIF4ABItVr+bNfMmwdSc9ux/Ttkv2YBrnjVu31vlp4EA+jk0nt/ZmRFmlU5tIJ
 A9P6QBDKhQ5veOrxDhrzfnNacHUQorU7k329GovYHC3ywU4kQBPUp2jCA+2irYJw3x
 oDpjpfWvEdwGA2j+K4Xq0ydDItkI2sULhAnqOeP2yxyzQadR30nyQ2ERF0Q5V0FfR7
 KVWuPqFpFV+JQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dMc3F0VQ
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-golang: support _SUBDIR
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

On 21/03/2025 14:32, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Some packages have their actual source tree in a sub-directory (even if
> that is the only source in the repository); this is the case for 
> example
> with the Amazon ECR credential helper (to be packaged in a follow up
> commit):
>     https://github.com/awslabs/amazon-ecr-credential-helper
> 
> Do the build in _SUBDIR, and also do the vendoring in there.
> 
> We don't need the build to generate executables inside _SUBDIR, so we
> just keep using $(@D)/bin as a place to generate them (and install them
> from).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Christian Stewart <christian@aperture.us>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
