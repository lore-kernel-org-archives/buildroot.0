Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBE2C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 11:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC6B582EA2;
	Sat, 25 Jan 2025 11:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD8HTHhajcrU; Sat, 25 Jan 2025 11:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFD0B82EE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD0B82EE1;
	Sat, 25 Jan 2025 11:56:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E207894A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 11:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01E282EA2
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 11:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5G-DpBLBxDE for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 11:56:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD28382E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD28382E9D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD28382E9D
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 11:56:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C63C813F89A;
 Sat, 25 Jan 2025 12:56:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44590])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 12:56:36 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 12:56:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250125094121.32306-1-bernd@kuhls.net>
References: <20250125094121.32306-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <9d0e14d3c63b08bce938e3747482b1ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737806199;
 bh=cUmKLxNiMfIWzYAgCKuKZ5bLlqoQkvDcd3t+VSltq1k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tuyjakNrKLvpnGXxIUdEAztf7raOH/DkO9LpxT5X6iD1OIBBPQ3eM9R3OXLeUoBnf
 hfGZrRnwfPYBHlVc3OvFe0IA3COJzJRPbIkGx7wn/GKAvHyVhtxGTb5+JSx2+7HeKP
 raX63Pa9vm5W7wOBmLlQU9gQ/thL2vAzC4hs2Ueir1L1ZLvXst60Yal2v/jDWcBWJY
 9Ta2BQqmvBqNIoetFRwhjh/dOehHgpcfZvI/OQ8f+iHnwY+E0Lg8Qo+BKb5C0BcCma
 jj16Nz0bMuwwYZSUjlTyVC6Cv7/TzasqMotL5RhOnBgK7tGXGG+sfl2WlfrpvY78C+
 KlrdJwpn2pVHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tuyjakNr
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: bump version to 2.4.1
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

On 25/01/2025 10:41, Bernd Kuhls wrote:
> Release notes:
> https://github.com/gerbera/gerbera/releases/tag/v2.3.0
> https://github.com/gerbera/gerbera/releases/tag/v2.4.0
> https://github.com/gerbera/gerbera/releases/tag/v2.4.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
