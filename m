Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D1AC8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 20:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5AE80D18;
	Tue,  8 Jul 2025 20:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IztZRyF5nxQh; Tue,  8 Jul 2025 20:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C45780CEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C45780CEA;
	Tue,  8 Jul 2025 20:48:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCA031BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6D340AEE
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDEH_Kry-Cd9 for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 20:48:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4E6640AB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E6640AB1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4E6640AB1
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:47:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CB82DB0053D;
 Tue,  8 Jul 2025 22:47:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Jul 2025 22:47:56 +0200
MIME-Version: 1.0
Date: Tue, 08 Jul 2025 22:47:56 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250707154705.1303551-1-thomas.perale@mind.be>
References: <20250707154705.1303551-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <cf929fad7cbe684caf5bc34f71d529cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752007677;
 bh=IBnSCDPGE+NQLrqRt+ohAHuPZEA0gTUTsLX1wNIXojU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y0q+2SMG8fwaN8yjnCnAZiD8FCIbKLgpk3Bq5ZKuaekp/WzPZeAoXNrlWfdvAqToc
 1KBhyRTJwtxDsniRYlvHHbG1e1zJZacYzgsL7WL2qCp+xp+Bgu283h8ZMDXE7Z7Ec7
 mv6pG0S6RlI5RRYlBEu0ON41atlDMm/vKzwXf+CtK4eCQOT+h7rlOdEuG7lGpqqip4
 gw1MM94tBaf8F2SXDCklZ5pnxI18zwPd8Bo6opJGBL+Kgp6yg0lsCzae1WNCThszxn
 uQSiQbEZYXbdVRhUY9JcQ0z7frZKRhQBBpdWN4ihNCivtWkK2yXuMFXOY7tUFRA4bp
 jpBut7W+J84Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y0q+2SMG
Subject: Re: [Buildroot] [PATCH] package/shairport-sync: fix build w/
 mbedtls v3.6
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

On 07/07/2025 17:47, Thomas Perale via buildroot wrote:
> Since [1] when trying to build this package with mbedtls v3.6 the
> following error is happening:
> 
> ```
> player.h:12:10: fatal error: mbedtls/havege.h: No such file or 
> directory
>    12 | #include <mbedtls/havege.h>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> ```
> 
> This error can be reproduced with the following config:
> 
> ```
> cat <<EOF >.config
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_MBEDTLS=y
> BR2_PACKAGE_SHAIRPORT_SYNC=y
> EOF
> make olddefconfig
> make
> ```
> 
> This patch backport the upstream commit [2] that add support for
> mbedtls v3.
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> [2] 
> https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
