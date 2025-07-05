Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC0BC83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20A860EF2;
	Sat,  5 Jul 2025 17:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g73aO83ZhHfD; Sat,  5 Jul 2025 17:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0421260E85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0421260E85;
	Sat,  5 Jul 2025 17:26:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 146C415F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C8040061
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSIj9_xZ3jbn for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:26:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F83E40067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F83E40067
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F83E40067
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:26:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4AAD913F89C;
 Sat,  5 Jul 2025 19:26:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Jul 2025 19:26:10 +0200
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 19:26:10 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Marcus Hoffmann <bubu@bubu1.eu>, Thomas
 Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20250626194752.144160-1-thomas@devoogdt.com>
References: <20250422075932.2345-1-thomas@devoogdt.com>
 <20250626194752.144160-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f44f004344cbfa954954eeb789dc434b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751736374;
 bh=YnyruiREAgvOs2ZxmY7NBOMtha/Ttv2ARVr1oMg1xoc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TvcId0030NNWwjQ4drpdYh7qQortR5A/oszHxoZNtWSHoMXvDdFsOneMIq8im1C7l
 fsDy33r3AjBlgOX93NuvuHiCHXsSgGnEqjibFeqyY969KMxBNc+G4r0OSdb6TLMJ0h
 wNQ2YEkVUSgz1x2kgMJ1ZEbabgbFfzaQ2/bEcwE59luC7Ac1hhPEoqIw4HsFNuVZ2y
 xR1UYos88CLrzgOKcmfd1rM72Md9jN2F7qx2d9GFuuAOFwBv+9IZV/KndkzlwQhNul
 IwxtM+SfPZt394ZjuboC6eMNUcRoVpThiv/75jYtmLFGdELCSzx1Gkz+WPLG5zOK0x
 8arKgMcwBNSLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TvcId003
Subject: Re: [Buildroot] [PATCH v4] package/util-linux: bump to 2.41.1
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

On 26/06/2025 21:47, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News:
> - 
> https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41-ReleaseNotes
> - 
> https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.1-ReleaseNotes
> 
> Dropped patches which are all upstream.
> - https://github.com/util-linux/util-linux/pull/3049
> - https://github.com/util-linux/util-linux/pull/3383
> 
> Synced all license files.
> 
> Dropped the AUTORECONF call, since
> 0001-libmount-ifdef-statx-call.patch is upstream.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
