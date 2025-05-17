Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F9BC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431D081490;
	Sat, 17 May 2025 15:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URSdzi4A6Pbj; Sat, 17 May 2025 15:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8150B814B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8150B814B1;
	Sat, 17 May 2025 15:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 516621DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42BD640FC2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUTiMFax7wIz for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0CF740FB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0CF740FB8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0CF740FB8
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:48:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DA3745FFAA;
 Sat, 17 May 2025 17:48:45 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 17:48:45 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 17:48:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250517102258.3463895-1-bernd@kuhls.net>
References: <20250517102258.3463895-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <2eb42b33d3a9eacfad8a4c482a611130@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747496927;
 bh=bdkOQOxGhhnp3rrbnbUfb+QDT7aWIpTaVYL3xg+vQh4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TPHgMawrFNC9ZNm3gamC/N35gyl2KgktcYDQqmLcvS0h6IVNu3/5/J+eJ8u90gb9l
 S1sJnmSfQ9JZ3cRLWdzQPJ7ku3Q4T+s1nExM6221wsLAUHV4Z48htF87Hq6hcyes5G
 WqCp9ziQDH9+OIc7R410zUyH/avOIL6sV41OrwN7rION8f1EjxU4wdQGgnydQpgzMb
 H7B39MY/xv2Jz5BhjUSaJCIqh562LukRmopYZD2ZluNhkWdg/r8OqfKhAB4MDtsxe+
 uHBfbBhrpTEy5pUejFI9mV2qj/r/j26pZw4+Rpszlk8lgDfV7DrZVprae6myhAKTEW
 +sSfkCB3UWR4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TPHgMawr
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: fix
 build with gcc-15.x
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

On 17/05/2025 12:22, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
