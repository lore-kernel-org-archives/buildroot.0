Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85F6CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 12:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7429E84520;
	Sat, 29 Nov 2025 12:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYU40zD1x6Dt; Sat, 29 Nov 2025 12:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CBA581276
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBA581276;
	Sat, 29 Nov 2025 12:02:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59BC2708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F08460702
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4N5D1HqXLt3 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 12:01:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3406960701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3406960701
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3406960701
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:01:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4FF0319F57B;
 Sat, 29 Nov 2025 13:01:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Nov 2025 13:01:55 +0100
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 13:01:55 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20251121112214.640511-2-giulio.benetti@benettiengineering.com>
References: <20251121112214.640511-1-giulio.benetti@benettiengineering.com>
 <20251121112214.640511-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <733df77174f2e8ae3b9166ba44958497@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764417717;
 bh=Ljmbn8K7nw3piA3YChsEEa9iz96q1QcPXhTmZ620PTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jSXafXHtKc8CYf+wfCqEWcNSIWbeDrRaM0IsbAvkDNzEGVzDv6X5KRNSp2p3j3ROU
 I224hXpD52uWsUD7E6bh2jkZdKLy9KWGlExM0jfamc+TXhpY1RG7dhFU90oot+8gPM
 eeEmsEd3mL0uhdXwONZjow9Bpq40vUs3xHF+t9TCWyEUZWy/2MNk60snt7F2RZszex
 CVBqKE+0P/JHP4H9yFvde91VKrisqnkDIWkqZIAWhfmBHVaINhmkJyhTsrpZ/a4wMo
 HQWLL2nNivaHj4sXoYnXIUdFfA8wnZRHQbx3P/kIuFloguXBSbFxgAmhBuL8ZznRCh
 othsF1ctD4f2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jSXafXHt
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.118.1
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

On 21/11/2025 12:22, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_118_1.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
