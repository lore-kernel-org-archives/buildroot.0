Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E6C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 21:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BEC46088E;
	Sat, 25 Jan 2025 21:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5pU1KY3FsLF; Sat, 25 Jan 2025 21:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A9F160AAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A9F160AAF;
	Sat, 25 Jan 2025 21:38:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A5EE941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55FC8117B
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vG5Zfk1i4Myy for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 21:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16ED681139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16ED681139
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16ED681139
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:38:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D8C38780331;
 Sat, 25 Jan 2025 22:38:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43772])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 22:38:03 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 22:38:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250125182148.234260-1-thomas@devoogdt.com>
References: <20250125182148.234260-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7f729ff17f4c2cf7313fa6482c7142f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737841086;
 bh=xme0H9hqCdU9djZWCMkX7thvBKlDsHCgLnkjmb32ww0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q3nVeqAUMYG9h76fEflSgTg8IxAUX9Ce3Qs6yLlz3WtyoEI1FqTiR5qVEGHg6X3U3
 DYVhfUdDrFVvJxt1w20PMhPrsdr/gmUgNEQiHg559yedZFhQO+6GRRxm3bBz3EqPPU
 SlRCdaFRhU3TW72nObu9ixpTg95jTRiD4Tn2YVxm3k3S9MVJpj4B+wjpahwhe/D1ia
 Ntz78huGSM1QoArQ2QAZD0G0Up3ipAVs6SisxP/M3x2+bXYacUU9Bjx2aqCRtViuT3
 947WYHhYpGs0+QXAJMmwQUUBQcqSwwY9UV/7dGaVXfrm1n+dEtImeqKh5eq5iq1fkt
 gDNRceIgV5KLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q3nVeqAU
Subject: Re: [Buildroot] [PATCH] package/fontconfig: bump to 2.16.0
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

On 25/01/2025 19:21, Thomas Devoogdt wrote:
> Announcements:
>  2.16.0: 
> https://lists.freedesktop.org/archives/fontconfig/2025-January/007143.html
>  2.15.0: 
> https://lists.freedesktop.org/archives/fontconfig/2023-December/007064.html
> 
> Some notes:
> 
> - The hash is no longer part of the announcement but
>   can instead be found in the release archive.
> 
> - Switched to meson while at it.
> 
> - Dropped the patch, since it's part of the autotools.
> 
> - Dropped some configs args, --with-arch, --disable-static,
>   since meson now handles the arch, and disable static as
>   it has most probably not been needed anymore for years.
>   Was part of commit dd4faf6f6f3fb32657b5d0c4fb72d15a7f571b2e.
>   "cairo: add host version"
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
