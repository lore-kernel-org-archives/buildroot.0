Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6C6CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 10:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D9A740EEE;
	Sat, 18 Oct 2025 10:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCwnpJiuuj7M; Sat, 18 Oct 2025 10:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2017340B01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2017340B01;
	Sat, 18 Oct 2025 10:55:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A2F1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBDE860BE3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izlbhRkyatvb for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 10:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22F7660BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22F7660BD3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22F7660BD3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:55:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 03682780383;
 Sat, 18 Oct 2025 12:55:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 12:55:46 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 12:55:46 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251015120240.2793382-1-buildroot@bubu1.eu>
References: <20251015120240.2793382-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <fc452d8d09cfd4880d79151a72ee9885@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760784949;
 bh=47NUIX6g3A0YECwfaMGXBqNu52EEapir5+ievBEezIQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TG7GStM5z5yz4nRlUp8kSLwcw2J2dAW/aKI0grZHXhZqz7N/fb3Sp/u5vIliYuMKo
 +cR19i3KOkYnpwZK97HC6DwhZkuOsZKqda9sfzf33eo1gkXk5L6aXY3N6zlKzvKBYU
 b1koaI7HFNtqMFEhSFaIrUKwD7iwJgz6RbFRLwkgCQayoZSPxuk3iGT3aCA9aPBehO
 vl0NF+Uing7ljHC1yA9cJkCYl3PWtMbHFeIFYoPUVVxzBgTnABRAcx1TJRWwQh7PFh
 YSDFEQdG//mMUNbzZPkSLn8eJpgkYbvZz5OaRW968eKtNkQCRTTr0D66NoyKnDezyP
 staiXUjWg605w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TG7GStM5
Subject: Re: [Buildroot] [PATCH] package/python-asgiref: bump to 3.10.0
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

On 15/10/2025 14:02, Marcus Hoffmann via buildroot wrote:
> CHANGELOG: 
> https://github.com/django/asgiref/blob/2138f0317d79cedd065571447ae0a7571989550e/CHANGELOG.txt#L1-L13
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
