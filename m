Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE5AD0EE1C
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 20:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44DC411B0;
	Tue, 25 Nov 2025 20:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajpN3bE-JzK1; Tue, 25 Nov 2025 20:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2315741097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2315741097;
	Tue, 25 Nov 2025 20:48:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3281A6
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 114B4400B7
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oz4Rs25Z4ht8 for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 20:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D8234003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8234003D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D8234003D
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:48:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1309B5FFB4;
 Tue, 25 Nov 2025 21:48:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Nov 2025 21:48:38 +0100
MIME-Version: 1.0
Date: Tue, 25 Nov 2025 21:48:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251122211822.1600323-1-bernd@kuhls.net>
References: <20251122211822.1600323-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8ac7b0ac2a8b5e4643e597e8ffa57032@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764103720;
 bh=UR8FS3gzHUKIO7owgbsyspp1BH77WaDlRovTnSW2QbE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BP16lPnaBVIBiAYgg4x6Fu5YYZ5iXw4UXbpJwbtpYWWa/kw56rYJxy+R3XiKEG4ej
 gzQbYreZqYxOBuDW8DHCzv6rP/uaLdpW0L36u1hP/aa9/HvstIT7yJD+5ROMvjn53B
 WEBWZTCoi7yrRQhPjydkN8sKIq863x6rkXL8BhYhflYiOVCNY1dWTN/IZQmL3RFHHF
 ZFLKFhxHiu8O0HH1HKv7ks3HRNh0C3d+yjlcxleoOLh/Zs8+5dn4tzGCTdz9gSRIHA
 eOeiJUYmJ6JRh9H/6/Q/9edXnnhB4WKoOyQvkzUnymsd0YgBkBSR2D1FCpgqs8aIqD
 yJSPevV+IVs+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BP16lPna
Subject: Re: [Buildroot] [PATCH 1/1] package/{neard, sdbusplus,
 thermald}: typo fixes
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

On 22/11/2025 22:18, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
