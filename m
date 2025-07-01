Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEFFC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B81D84858;
	Tue,  1 Jul 2025 20:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMcEfW1Trl7f; Tue,  1 Jul 2025 20:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B378480F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B378480F;
	Tue,  1 Jul 2025 20:15:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E855A128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE86440A24
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 290aNGEa3_bg for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:15:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D3AE40A00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D3AE40A00
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D3AE40A00
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:15:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 01D2A13F89C;
 Tue,  1 Jul 2025 22:15:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Jul 2025 22:15:38 +0200
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 22:15:38 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <bcbd271754126b79b0b42df3ca88aedf99d9a600.1751378952.git.yann.morin@orange.com>
References: <bcbd271754126b79b0b42df3ca88aedf99d9a600.1751378952.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c970698783863826b122824b5868541c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751400940;
 bh=6ThAkGfMx1D0/QJ67gnrDZeyA/UJINl4oHwD5DGehV8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bgwGz/IERycq7P6SR9j3hukI7WJ+2M3lLlssh0VlThafwaUBgBp1X+4z4xvwCkw2q
 y6LyU/mx+jkl5g/lZtuinBCqWU8xgeny+tmw+q4DOD+VEtmGE/jwfrc1T+VHBWVjYx
 5ZJC6kUgulTlvccfhAd6Fxn+xLOnPib0X43eKR5xs9z6pFayfvlKQLjKolgPx3GXll
 cawv+TavdAqOarvionLyj+i952zp3Z8L+U3BGNhEvCR0Znz2G7nA7g0U2FrYHO5AXu
 7EvF4+OS0OkksfD0MHwWIIqbuE0+CR0e9BdC8m4gZekx//mvDGM7qAM/oaHvOAB468
 /fI7F3yq3Irpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bgwGz/IE
Subject: Re: [Buildroot] [PATCH] support/testing: enable lpxelinux for
 syslinux runtime test
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

On 01/07/2025 16:09, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The syslinux runtime test (which is in fact a build-only test) ensures
> that syslinux does get build at least once a week (via the gitlab-CI
> weekly pipeline). Runtime testing would need much more work, though, 
> but
> nothing in syslinux is currently runtime tested anyway.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
