Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73F7C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 22:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7393C608A0;
	Tue,  8 Jul 2025 22:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4mHdn36YnWp; Tue,  8 Jul 2025 22:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB0C607EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB0C607EA;
	Tue,  8 Jul 2025 22:29:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA01D69
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D004C607EA
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NNb45f85QeF for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 22:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF405607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF405607C4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF405607C4
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:29:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6612E13F86A;
 Wed,  9 Jul 2025 00:29:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Jul 2025 00:29:52 +0200
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 00:29:52 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250707222215.554181-1-dario.binacchi@amarulasolutions.com>
References: <20250707222215.554181-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5be50c29281c181d7c02eba3b16becc1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752013794;
 bh=csjoXodIpT3c0zcR52aiv2lnpZRbQ6w6mdlCObDYuas=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r5G6lHU1xPG76o9D5q1Q/joXCrxMZfdQT5ZMXxI7A7m+sMzAwybmYD3+CD1qmdhfn
 GpK8U55HWy+lilU8yGAed5v/n6Unvmyuza0bcml1FrE4cTHhHN0ix3KwpD3U+rFxH5
 aTStvMx9jvlWc5304NtZdwihX7Lbku+5eI7+IkLDZ0w1dTjbrU1zY4XHE8qtjmXrxX
 wcC615gOGzrhVwcQFXJxr6skxSTNsw3JyoIN1S1WozysDN1lPUL8JMVOvG2W10pGbr
 MUJz/6ml2gg9PL6TTu6WOqU1HD7lQHTyRycS0vyWYMPGtXYl3B674NcWPrNRcm7K1g
 oJaEqM2QqpPRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r5G6lHU1
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.07
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

On 08/07/2025 00:22, Dario Binacchi wrote:
> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2025-July/593789.html
> 
> Changelog:
> https://github.com/u-boot/u-boot/compare/v2025.04...v2025.07
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
