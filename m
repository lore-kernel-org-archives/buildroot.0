Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E14C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A2860828;
	Sat, 17 May 2025 15:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nh7MvshhYAhH; Sat, 17 May 2025 15:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A73D060BB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73D060BB2;
	Sat, 17 May 2025 15:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D031DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 547B78329D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cft5rGyUTrxw for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE36A83295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE36A83295
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE36A83295
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:09:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7A5296013A;
 Sat, 17 May 2025 17:09:35 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 17:09:35 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 17:09:35 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250514202131.687200-1-james.hilliard1@gmail.com>
References: <20250514202131.687200-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <aaa443eb2efae0c15e2e4031e1251f40@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747494577;
 bh=rJSghR/IHKKVAe2Ea2OuRy+G7b5+AGRNwNjtJdTBjIA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O6BLGi2lG2a6cclmIpltGcV7fX9EsqYz/gUvV8gy04mHvJkeLvt3yv4H/Mtyvhc88
 tGYMlIP0p5w9TDcDbjq3G5hofN3IOwUjhkj0NK7CHx3aa7tMb+4aNlGsy/8yKJHh4e
 /xhjlQ7/i6lKOHy46XyqE1V2bNyIhAc8aQkKP+uwzWmZS61r4SQEe+UMnD83FgkDpz
 gTJZhbBcZ1169Uecfchjrxf5vFBrfzkEHRkU2mhusR3JynoqFg06Q3dAuc2hWUr23S
 J9NDMvikMHQKIIawYEOJms7A4nkOS9Z3pLgbT4c4a5bagAFcmIhoXU4L0XUlbL4Dv/
 KlWAe3k/I++uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O6BLGi2l
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libubootenv: fix cmake 4
 compatibility
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

On 14/05/2025 22:21, James Hilliard wrote:
> Add a patch fixing cmake 4 compatibility.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
