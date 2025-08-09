Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5F0C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362B140B45;
	Sat,  9 Aug 2025 16:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zJrJz0s8uSi; Sat,  9 Aug 2025 16:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D26440B48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D26440B48;
	Sat,  9 Aug 2025 16:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92C4C21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7923540867
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJhEQ2i51VJh for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1D6540872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1D6540872
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1D6540872
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:19:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 86C772003DD;
 Sat,  9 Aug 2025 18:19:16 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 18:19:16 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 18:19:16 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Julien Grossholtz
 <julien.grossholtz@openest.io>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250803144208.195144-1-ps.report@gmx.net>
References: <20250803144208.195144-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <dfce4d91f81cfe5dc50a4b14cfb8bc6f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754756362;
 bh=TH8A+D/6/jWpDKnivSg7BtgiC5LPFWCQ8tSimMEQhzU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OjeRtgy7FisjkEF3xYDuIHnST3qL2yV5epvv0X4eMIWn0QCgEFfAYK1yKrnXXrMGZ
 Sg485my6eEkix/vKIcxVdgG8ZXo3KKulD7UHYlSyrEi4Dd6GmexMUhVOTHNBkFfBEp
 VmZEBXCZveC9yK5wQzGCG4OfZFxbzxtwCEeu45TyV5WRxFPcrLjg8pOnejQETkM7da
 rOMYaBUWaphCdz98poqyEoA0H2VjCajUCKg1wDD1xsGcixAl+jsUV91r5/FJvQKtlI
 L/qbZpsi63SwFxWqLlgqGFzqeVAhMjCCP+vqDH03rrFXQJShy5v8WTvD84N/xQ098/
 Y/X8O0USrMUDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OjeRtgy7
Subject: Re: [Buildroot] [PATCH 1/3] configs/raspberrypi*: bump kernel
 version to ac69f09 (6.12.41)
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

On 03/08/2025 16:42, Peter Seiderer via buildroot wrote:
> Now based on 6.12.41 (from 6.12.20)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
