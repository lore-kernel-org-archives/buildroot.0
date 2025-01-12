Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE4E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 20:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FAA4606F3;
	Sun, 12 Jan 2025 20:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EPhwmRks2WQ; Sun, 12 Jan 2025 20:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70BF460720
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70BF460720;
	Sun, 12 Jan 2025 20:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6BB2942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9554180EDB
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eQFhNkUDBuH for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 20:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A42B480DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A42B480DC1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A42B480DC1
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:10:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6082E5FFC0;
 Sun, 12 Jan 2025 21:10:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34046])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 21:10:25 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 21:10:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109085754.760776-1-nemaakhilesh@gmail.com>
References: <20250109085754.760776-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ed9d5010cb38518fbbdabc4c67151747@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736712626;
 bh=hQeFyEm5L5Ju5UFxVy0l2YJwaO0TdrvAbLHsUeR12ks=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SMbsyn01tMuYy7xXMsMR0aW1zT1lRF2OUglCbPWlCk2UJyvIRXlAjWKvxh/dahySe
 SCJkkuUMVrFhE4FzPJEqiJqhzVkF4fq1KrR99SIduzs5VW4ei33DAeaLBWTWW9ES9O
 dNDubXFg0Auj0vHTP8JTHAlTsld7rn2u09UAGyE3p8Xbgt57IJPYsuxozeIqN7z4Hv
 OIZdf9hHrLWIVmAxxHGk/7Kf716Os1MfcEp0Or1xz52n2xglcLdiZwInGQs7jhkwdv
 imACc7JbP/izF2BfZSJAOvszXtMnJLsGsHq7iobhiMmxAkplgo5n5Ss6ohB0Gcj4MC
 2EVx6IfUKLFEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SMbsyn01
Subject: Re: [Buildroot] [PATCH 1/1] package/e2fsprogs: bump version to
 1.47.2
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

On 09/01/2025 09:57, Akhilesh Nema wrote:
> Release notes:
> https://github.com/tytso/e2fsprogs/blob/v1.47.2/doc/RelNotes/v1.47.2.txt
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
