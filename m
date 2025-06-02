Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D9C5B555
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CD8440AE6;
	Mon,  2 Jun 2025 19:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3qJTQuODO4C; Mon,  2 Jun 2025 19:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6343240B08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6343240B08;
	Mon,  2 Jun 2025 19:38:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB2D1F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E33560717
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ij-2S9vGpYgr for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 19:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B3D360E7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B3D360E7C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B3D360E7C
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:38:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id ACCDD78034E;
 Mon,  2 Jun 2025 21:38:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 02 Jun 2025 21:38:22 +0200
MIME-Version: 1.0
Date: Mon, 02 Jun 2025 21:38:22 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>, Valentin Korenblit
 <valentinkorenblit@gmail.com>
In-Reply-To: <20250602035936.904546-2-dalang@gmx.at>
References: <20250602035936.904546-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.11
Message-ID: <6de7c67d908ed56b4ce16337fb8e5b89@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748893107;
 bh=NnpM+HHBEEOybrrFE+odzxrKJTx1rkH5ZwWBmcS9EyI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dnjz2tF5OELo9kmuqe3nsa8S5J4ea5YtkDKKRNxQ24vxiVy0AEaTq7TPpVjhjSUJS
 DL6Q6UWXNoZ3xmiDTmGEskWxR3F5Ra4rVoO1cRabmk3b3z53SDam2y+27BzO24WA8T
 UMebIqShxFvogsP6UrSfKjFtO9NBTDB2S7sQLa3N5026bG0BtqmzRi/fm8eIR4PcyK
 fk5mzaQairpVEdxrIoC4Jhr9uvSOeZKj2YTcThetE/f2ACh5hq4rdwpECvZsDfK9oy
 fq4pLFxv1L/MYWtRWIfta5VFAWQSj2msjfL8vBzLFNxVG8CNT1mYHbeHWv7mksmwpb
 kClupCBYDrbRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Dnjz2tF5
Subject: Re: [Buildroot] [PATCH next] package/llvm-project/clang: remove
 merge artifacts
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

On 02/06/2025 05:59, Daniel Lang via buildroot wrote:
> Fixes:
>     e29dae10 ("package/llvm-project: bump to version 20.1.5")
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
