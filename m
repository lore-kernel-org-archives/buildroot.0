Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E7AC36002
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 21:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0999061177;
	Fri, 21 Mar 2025 21:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2xg5yUkEzyv; Fri, 21 Mar 2025 21:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED666077C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED666077C;
	Fri, 21 Mar 2025 21:11:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B706C1A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4DF74010C
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9OyqxEInRV4 for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 21:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE515404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE515404B6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE515404B6
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:11:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9139219F522;
 Fri, 21 Mar 2025 22:11:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Mar 2025 22:11:01 +0100
MIME-Version: 1.0
Date: Fri, 21 Mar 2025 22:11:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250321164243.936786-1-bernd@kuhls.net>
References: <20250321164243.936786-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <9642a63aa99ac08a23fb29ff7c41d409@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742591462;
 bh=KwE491HW4xgAunM7XVhdUqInNCLzOJCQqJPc6BDtizE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rz+pVi74m2M41DrXIkki65tcUqW5iEY2w4AXK0/AQ6R/A2FS7HtjEhaE10FyqgmS/
 zuKXbWvv5jgPzPFxAbsGEXgVTZO4PpmBfv7LpK3cWtoKsKLZd4+HO365D1ia824cJZ
 NqUMZiJKWve4vG00CEur/jVluy96WwCQ7sZnlTN88zRsHneOMFkuPaWiRZqslS03F3
 MVhTzYhAI/M5lj+SrYhqtqmKZ9O/PkopkfZzkvPdF5tyGImrlSlCeajWNJApEikYoZ
 /E+f5LoHSqRkFQ4JAAgVIo7rmJPROOxlDXh41ZQGpgGUXNhD0uAtYjZrBWm/lVfiDz
 PHTAZ3n/hRvRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rz+pVi74
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.15
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

On 21/03/2025 17:42, Bernd Kuhls wrote:
> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/stable-release-0-4-8-15/17998
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
