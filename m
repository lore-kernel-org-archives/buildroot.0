Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95531E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6218780A7B;
	Sat, 11 Jan 2025 18:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDnez-JMcXtV; Sat, 11 Jan 2025 18:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83FA780AB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83FA780AB0;
	Sat, 11 Jan 2025 18:37:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14BEB942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FA626079A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxdrMFCQwBqu for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29526607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29526607C4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29526607C4
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:37:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7C90613FA35;
 Sat, 11 Jan 2025 19:37:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50694])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 19:37:22 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 19:37:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111165142.2890748-1-james.hilliard1@gmail.com>
References: <20250111165142.2890748-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <aff4c04c50a7a6133a318f513b66d187@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736620643;
 bh=gQEQTFgTFZ88Pp4TgYV4dhTsgCXvf9a8yE5KzyswpHs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m+O1t34QzDv7hD16RA5u8GeqUZWyaDD4B1Tlc2G1OibV6c6dYLXNLhWduSLWtKbpd
 6h+MszvkHJfQxDOR7Qv9wcYDB93Xayct2dlQzisfBYtX/XuBFBVc5eEioCEvDI2S+u
 oqIV1oSBgx/TmjuyCWg1qAvz7rgj79nt1zCZpEX+c1gTnu/ThDfsu0vazp0IzxHG9r
 oFCgkhI6Z1QHpzpj0kKYp7M95ykZtlhU9VDTYV84SvAlmmkUzUbpGT2/aOv+u09DEm
 HilnlDktEuZwW17Ud3YVkfJQ65pfImD/1D33zn//VUjo8vZ8V5Sa8tH2JUNAgeeYNy
 pPdor0+D5276Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m+O1t34Q
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to
 version 0.18.10
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

On 11/01/2025 17:51, James Hilliard wrote:
> License hash changed due to year update:
> https://sourceforge.net/p/ruamel-yaml/code/ci/e27f5be8d0d23672f33a7fa3fb620c583b94eab5/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
