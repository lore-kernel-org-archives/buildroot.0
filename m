Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624B8E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 21:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21923606EE;
	Tue,  7 Jan 2025 21:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xACaH-Y07-e; Tue,  7 Jan 2025 21:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F6E060740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F6E060740;
	Tue,  7 Jan 2025 21:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F0516B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EDC1403D1
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVP3gw1XCKbO for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 21:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F9CC401BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9CC401BF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F9CC401BF
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:51:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4E3C719F57B;
 Tue,  7 Jan 2025 22:51:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58736])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 22:51:27 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 22:51:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250107210923.1127755-1-romain.naour@smile.fr>
References: <20250107210923.1127755-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <cabf6dca22e81938b46cd749c5ceb921@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736286688;
 bh=VOqXlYucRyZbGGK+gyEcioUPG0sAVl9X1hTeuv3Fr8w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VcbGfPJPTm2fRvjVHeNEVPTRcya7b7iA09C/7I3EU1zy2+RZGVlmkIAt7+3EqyYas
 2v6N/BoDf2AzHFF2kDcWFQYYfjqLWQnJMtnRhEuGDh/ezUhIlN754zRw8EeIHHRffs
 eZmY3wQYvbh5OYHdLnNHwqXH4TN6+6DlntN7yRz07cJN3ko8EWW52qQCszRCHQF4vZ
 P+1jqbJ+IGN07b56KAodu7pgTREWbEKu+3A/AZgTJwsM8+pCfwTHN29X4G00GTJ6pR
 M9sY2RQPsyIP2aT53/STDfbphOCGa0sUqxOfmMNMoMbRapoPcaWnVmOBenz9hP1SQ0
 bPgDmSQSzSGGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VcbGfPJP
Subject: Re: [Buildroot] [PATCH] package/qemu: fix Qemu stub builds
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

On 07/01/2025 22:09, Romain Naour via buildroot wrote:
> Since commit "stubs: avoid duplicate symbols in libqemuutil.a" [1],
> Qemu doesn't build with:
> 
>   ./configure --enable-user --disable-system --enable-tools
> 
>   /usr/bin/ld: libhwcore.a.p/hw_core_qdev.c.o: in function 
> 'device_finalize':
>   
> [...]output/build/host-qemu-9.2.0/build/../hw/core/qdev.c:689:(.text+0x75c): 
> undefined reference to 'qapi_event_send_device_deleted'
>   collect2: error: ld returned 1 exit status
> 
> Indeed, with have_system = false and have_tools = true, Qemu needs the
> stubs for QAPI events added by stub_ss.add(files('qdev.c')) to provide
> qapi_event_send_device_deleted().
> 
> Fixes: 388b849fb6c33882b481123568995a749a54f648.
> 
> [1] 
> https://gitlab.com/qemu-project/qemu/-/commit/388b849fb6c33882b481123568995a749a54f648
> 
> Reported: https://gitlab.com/qemu-project/qemu/-/issues/2766
> 
> Fixes:
> http://autobuild.buildroot.org/results/260/2608b7cfcedc21269f08063493fe66c0381357f9
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
