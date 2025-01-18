Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AE2C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 20:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CFA841A57;
	Sat, 18 Jan 2025 20:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHOYCugeefB0; Sat, 18 Jan 2025 20:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761C241A6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 761C241A6B;
	Sat, 18 Jan 2025 20:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A28B69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AF6A6071F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NLbUkFJS7ku for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 20:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66CD260793
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CD260793
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66CD260793
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:09:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BD50B13F880;
 Sat, 18 Jan 2025 21:09:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34578])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 21:09:09 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 21:09:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250118083233.2882216-1-bernd@kuhls.net>
References: <20250118083233.2882216-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <00ce26d43a0cb0e2099f710d5a546c56@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737230950;
 bh=JotH7FySh1ejHgMXqFHi2LX8JmX3/C/MfMA9xwiDPQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jvs0kco32daP0BbZXeg9KlNZ1CIDIxSrZVIKC/C5uxqpOWgLuU0cryhwh2F4zbL7Q
 WHvHUAC+6TptVg8H1bk1RWhmlQztxFsGzizX+IdidqIJGS3imSoZOTzmdxpMvkqTvP
 52fvxfGozXp4yL9TRvD/NgezVx8IE74ouzfE4K3b7lG0XmrxfxkpDQ3XJ7Qm48fyTT
 Cry07MUZDXi7wpM9+2XEOeD0AkLwyvITtxoJRQYf2O0+KfS2OjRprHwYi3a/3w3l3S
 bsBpo+YIgIHDs2JDMeJQa31gv9KUAr8/0IkI1sJ+Z+hXG9QM2ecc4Xl4gk74rsNw5T
 qwn5jvfvFtIug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jvs0kco3
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.16
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

On 18/01/2025 09:32, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> Release notes: https://news-web.php.net/php.announce/450
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
